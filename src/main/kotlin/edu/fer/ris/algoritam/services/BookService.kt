package edu.fer.ris.algoritam.services

import edu.fer.ris.algoritam.model.*
import edu.fer.ris.algoritam.repositories.*
import edu.fer.ris.algoritam.util.slugify
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Service
import java.time.LocalDateTime
import java.time.temporal.ChronoUnit
import javax.transaction.Transactional

@Service
class BookService(
    @Autowired private val bookRepository: BookRepository,
    @Autowired private val authorRepository: AuthorRepository,
    @Autowired private val genreRepository: GenreRepository,
    @Autowired private val editorRepository: EditorRepository,
    @Autowired private val translatorRepository: TranslatorRepository,
    @Autowired private val designerRepository: DesignerRepository,
    @Autowired private val printingOfficeRepository: PrintingOfficeRepository
) {

    @Transactional
    fun getBook(isbn: String): Book {
        return bookRepository.findByIsbn(isbn).orElseThrow {
            IllegalStateException("Book with isbn: $isbn doesn't exist")
        }
    }


    @Transactional
    fun updateBook(book: Book) {
        bookRepository.save(book)
    }

    //TODO make this nicer
    @Transactional
    fun updateBook(
        isbn: String,
        numOfPages: Int? = null,
        title: String? = null,
        cover: Cover? = null,
        language: Language? = null,
        authors: List<String>? = null,
        genres: List<String>? = null,
        stockCount: Int? = null,
        translatorName: String? = null,
        printingOfficeName: String? = null,
        editorName: String? = null,
        designerName: String? = null,
        price: Price? = null,
        lastModifiedAt: LocalDateTime = LocalDateTime.now().truncatedTo(ChronoUnit.SECONDS)
    ) {
        val book = bookRepository.findByIsbn(isbn)
            .orElseThrow { IllegalStateException("Book with isbn $isbn doesn't exist") }

        book.numOfPages = numOfPages ?: book.numOfPages
        book.title = title ?: book.title
        book.slug = book.title.slugify()
        book.cover = cover ?: book.cover
        book.language = language ?: book.language

        stockCount?.let {
            //book.stock?.count = stockCount
            book.setStock(Stock(stockCount))
        }

        price?.let {
            book.setPricing(Pricing(price))
        }

        authors?.let {
            for (authorName in it) {
                val authorOptional = authorRepository.findByName(authorName)
                if (authorOptional.isPresent) {
                    book.authors.add(authorOptional.get())
                } else {
                    book.authors.add(Author(authorName))
                }
            }
        }

        genres?.let {
            for (genreName in it) {
                val genreOptional = genreRepository.findByName(genreName)
                if (genreOptional.isPresent) {
                    book.genres.add(genreOptional.get())
                } else {
                    book.genres.add(Genre(genreName))
                }
            }
        }


        editorName?.let { book.setEditor(Editor(editorName)) }
        printingOfficeName?.let { book.setPrintingOffice(PrintingOffice(printingOfficeName)) }
        translatorName?.let { book.setTranslator(Translator(translatorName)) }
        designerName?.let { book.setDesigner(Designer(designerName)) }

        book.lastModifiedAt = lastModifiedAt
        bookRepository.save(book)
    }

    @Transactional
    fun getBooks(): List<Book> {
        return bookRepository.findAll()
    }

    @Transactional
    fun count(): Long {
        return bookRepository.count()
    }

    /**
     * Save book and all unsaved variables to db
     */
    @Transactional
    fun addBook(newBook: Book) {
        bookRepository.findByIsbn(newBook.isbn)
            .ifPresent { throw IllegalStateException("Book with isbn ${newBook.isbn} doesn't exist") }

        newBook.editor?.let {
            val editorOptional = editorRepository.findByName(it.name)
            if (editorOptional.isPresent) {
                newBook.setEditor(editorOptional.get())
            }
        }

        newBook.translator?.let {
            val translatorOptional = translatorRepository.findByName(it.name)
            if (translatorOptional.isPresent) {
                newBook.setTranslator(translatorOptional.get())
            }
        }

        newBook.designer?.let {
            val designerOptional = designerRepository.findByName(it.name)
            if (designerOptional.isPresent) {
                newBook.setDesigner(designerOptional.get())
            }
        }
        bookRepository.save(newBook)
    }

    @Transactional
    fun deleteBookByIsbn(isbn: String) {
        bookRepository.deleteByIsbn(isbn)
    }
}