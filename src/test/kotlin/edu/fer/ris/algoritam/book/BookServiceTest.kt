package edu.fer.ris.algoritam.book

import com.fasterxml.jackson.databind.ObjectMapper
import com.fasterxml.jackson.module.kotlin.readValue
import edu.fer.ris.algoritam.dto.BookDto
import edu.fer.ris.algoritam.model.*
import edu.fer.ris.algoritam.services.*
import org.junit.jupiter.api.Assertions.*
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.assertThrows
import org.junit.jupiter.api.extension.ExtendWith
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.boot.test.context.SpringBootTest
import org.springframework.test.annotation.DirtiesContext
import org.springframework.test.context.ActiveProfiles
import org.springframework.test.context.junit.jupiter.SpringExtension
import kotlin.IllegalArgumentException

//clean persisted entities between tests
@DirtiesContext(classMode = DirtiesContext.ClassMode.AFTER_EACH_TEST_METHOD)
@SpringBootTest
@ExtendWith(value = [SpringExtension::class])
@ActiveProfiles("test")
class BookServiceTest @Autowired constructor(
    private val bookService: BookService,
    private val authorService: AuthorService,
    private val designerService: DesignerService,
    private val editorService: EditorService,
    private val printingOfficeService: PrintingOfficeService,
    private val genreService: GenreService,
    private val translatorService: TranslatorService,
    private val pricingService: PricingService,
    private val stockService: StockService
) {
    // book found on the frontpage of a popular bookshop
    fun persistBookWithPriceAndStock(): Book {
        val book = Book(
            "9789534860182",
            500,
            "Nevidljivi život Addie LaRue",
            Cover.PAPERBACK,
            Language.CROATIAN
        )


        book.addAuthor(Author("V.E Schwab"))
            .addGenre(Genre("Fikcija")).addGenre(Genre("Povijesni"))
            .setTranslator(Translator("Jelena Pataki"))
            .setPrintingOffice(PrintingOffice("Kerschoffset"))
            .setDesigner(Designer("Janka Carev"))
            .setEditor(Editor("Silvia Sinkovic"))
            .setPublisher(Publisher("Sonatina"))
            .setStock(Stock(100))
            .setPricing(Pricing(Price(149, 0, Currency.HRK)))

        bookService.addBook(book)
        return book
    }

    @Test
    fun verify_book_equality_after_persisting() {
        val book = persistBookWithPriceAndStock()

        //checks equality with business key (isbn)
        val actual = bookService.getBook(book.isbn)
        assertEquals(book, actual)

        //check all other individual fields
        assertEquals(book.title, actual.title)
        assertEquals(book.cover, actual.cover)
        assertEquals(book.numOfPages, actual.numOfPages)
        assertEquals(book.authors, actual.authors)
        assertEquals(book.genres, actual.genres)
        assertEquals(book.language, actual.language)
        assertEquals(book.translator, actual.translator)
        assertEquals(book.addedAt, actual.addedAt)
        assertEquals(book.lastModifiedAt, actual.lastModifiedAt)
        assertEquals(book.printingOffice, actual.printingOffice)
        assertEquals(book.editor, actual.editor)
        assertEquals(book.designer, actual.designer)

        /*
         * Check one to one relationships (will never need to reference book from pricing/stock so !! is acceptable)
         */
        assertEquals(book, actual.pricing!!.book)
        assertEquals(book, actual.stock!!.book)
    }

    @Test
    fun many_to_one_mappings_not_deleted_with_book() {
        val book = persistBookWithPriceAndStock()

        bookService.deleteBookByIsbn(book.isbn)

        //verify that book is deleted
        assertEquals(0, bookService.count())

        //author, editor, designer, printing office, translator shouldn't be deleted
        assertEquals(Author("V.E Schwab"), authorService.getAll().get(0))
        assertEquals(Editor("Silvia Sinkovic"), editorService.getAll().get(0))
        assertEquals(Designer("Janka Carev"), designerService.getAll().get(0))
        assertEquals(Translator("Jelena Pataki"), translatorService.getAll().get(0))
        assertEquals(PrintingOffice("Kerschoffset"), printingOfficeService.getAll().get(0))

        //genres should also not be deleted
        assertEquals(listOf("Fikcija", "Povijesni"), genreService.getAll().map { it.name })

    }

    @Test
    fun stock_and_pricing_deleted_with_book() {
        val book = persistBookWithPriceAndStock()

        bookService.deleteBookByIsbn(book.isbn)

        //Pricing and stock have to be deleted since they are mapped with OneToOne
        assertThrows<IllegalArgumentException> { stockService.getByIsbn(book.isbn) }
        assertThrows<IllegalArgumentException> { pricingService.getByIsbn(book.isbn) }
    }

    @Test
    fun deletion_of_editor_doesnt_delete_book() {
        val book = persistBookWithPriceAndStock()

        editorService.deleteById(book.editor!!.id!!)

        //editor removed
        assertEquals(0, editorService.count())

        //book not
        assertEquals(book, bookService.getBook(book.isbn))

        //books editor is null
        assertNull(bookService.getBook(book.isbn).editor)
    }

    @Test
    fun deletion_of_translator_doesnt_delete_book() {
        val book = persistBookWithPriceAndStock()

        translatorService.deleteById(book.translator!!.id!!)

        //translator removed
        assertEquals(0, translatorService.count())

        //book wasn't
        assertEquals(book, bookService.getBook(book.isbn))
    }

    @Test
    fun re_insertion_of_translator_persists() {
        val book = persistBookWithPriceAndStock()

        translatorService.deleteById(book.translator!!.id!!)

        val newBook = bookService.getBook(book.isbn)
        newBook.setTranslator(Translator("New translator"))
        bookService.updateBook(newBook)

        assertEquals(1, translatorService.count())

        //books translator is not null
        assertNotNull(bookService.getBook(book.isbn).translator)
        assertEquals("New translator", bookService.getBook(book.isbn).translator!!.name)
    }

    @Test
    fun insert_duplicate_translator() {
        val book = persistBookWithPriceAndStock()
        val book2 = Book(
            "1789534860182",
            1,
            "title",
            Cover.PAPERBACK,
            Language.CROATIAN
        ).setTranslator(Translator("Jelena Pataki"))
        bookService.addBook(book2)

        // two books should point to same translator
        assertEquals(1, translatorService.count())
        assertEquals(book.translator, book2.translator)

        // translator translated two books
        assertEquals(2, translatorService.getByName(book.translator!!.name).books.size)
    }

    @Test
    fun insert_duplicate_editor() {
        val book = persistBookWithPriceAndStock()
        val book2 = Book(
            "1789534860182",
            1,
            "title",
            Cover.PAPERBACK,
            Language.CROATIAN
        ).setEditor(Editor("Silvia Sinkovic"))
        bookService.addBook(book2)


        // two books should point to same editor
        assertEquals(1, editorService.count())
        assertEquals(book.editor, book2.editor)

        // editor edited two books
        assertEquals(2, editorService.getByName(book.editor!!.name).books.size)
    }

    @Test
    fun insert_duplicate_designer() {
        val book = persistBookWithPriceAndStock()
        val book2 = Book(
            "1789534860182",
            1,
            "title",
            Cover.PAPERBACK,
            Language.CROATIAN
        ).setDesigner(Designer("Janka Carev"))
        bookService.addBook(book2)

        // two books should point to same editor
        assertEquals(1, designerService.count())
        assertEquals(book.designer, book2.designer)

        // editor edited two books
        assertEquals(2, designerService.getByName(book.designer!!.name).books.size)
    }

    @Test
    fun add_duplicate_book() {
        val book = persistBookWithPriceAndStock()
        //duplicate isbn which is business key
        val book2 = Book(
            "9789534860182",
            1,
            "title",
            Cover.PAPERBACK,
            Language.CROATIAN
        )

        assertThrows<IllegalStateException> {
            bookService.addBook(book2)
        }
    }

}