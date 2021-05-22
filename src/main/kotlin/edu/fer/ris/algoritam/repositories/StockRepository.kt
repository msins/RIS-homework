package edu.fer.ris.algoritam.repositories

import edu.fer.ris.algoritam.model.Stock
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.stereotype.Repository
import java.util.*

@Repository
interface StockRepository : JpaRepository<Stock, String> {
    fun findByBookId(bookId: Long): Optional<Stock>
    fun findByBookIsbn(isbn: String): Optional<Stock>
}