package edu.fer.ris.algoritam.controllers

import edu.fer.ris.algoritam.dto.BookDto
import edu.fer.ris.algoritam.model.*
import edu.fer.ris.algoritam.services.BookService
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.*

@RestController
@RequestMapping(path = ["api/v1/book"])
class BookController(
    @Autowired val bookService: BookService
) {
    @GetMapping("{isbn}")
    fun getBook(@PathVariable isbn: String): ResponseEntity<Book> {
        return ResponseEntity.ok(bookService.getBook(isbn))
    }

    @PostMapping
    fun registerNewBook(@RequestBody dto: BookDto) {
        val book = Book(
            isbn = dto.isbn,
            numOfPages = dto.numOfPages,
            title = dto.title,
            cover = dto.cover,
            language = dto.language
        )
        dto.authors.forEach { author -> book.addAuthor(Author(author)) }
        dto.genres.forEach { book.addGenre(Genre(it)) }
        book.setStock(Stock(dto.stock))
            //use HRK as default for now
            .setPricing(Pricing(Price(dto.priceUnit, dto.priceSubUnit, Currency.HRK)))
            .setDesigner(Designer(dto.designer))
            .setTranslator(Translator(dto.translator))
            .setEditor(Editor(dto.editor))
        bookService.addBook(book)
    }

    @DeleteMapping(path = ["{isbn}"])
    fun deleteBook(@PathVariable("isbn") isbn: String) {
        bookService.deleteBookByIsbn(isbn)
    }

    @PutMapping(path = ["{isbn}"])
    fun updateBook(
        @PathVariable("isbn") isbn: String,
        @RequestBody bookDto: BookDto
    ) {
        // TODO add separate methods for easier handling
        bookService.updateBook(
            isbn,
            bookDto.numOfPages,
            bookDto.title,
            bookDto.cover,
            bookDto.language,
            bookDto.authors,
            bookDto.genres,
            bookDto.stock,
            bookDto.translator,
            bookDto.printingOffice,
            bookDto.editor,
            bookDto.designer,
            Price(
                bookDto.priceUnit,
                bookDto.priceSubUnit,
                Currency.HRK
            ),
        )
    }
}