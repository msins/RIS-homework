package edu.fer.ris.algoritam.repositories

import edu.fer.ris.algoritam.model.Book
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.stereotype.Repository
import java.util.*

@Repository
interface BookRepository : JpaRepository<Book, Long> {
    fun findByIsbn(isbn: String): Optional<Book>
    fun deleteByIsbn(isbn: String)
}