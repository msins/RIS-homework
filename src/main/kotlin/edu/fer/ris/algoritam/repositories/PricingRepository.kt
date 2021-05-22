package edu.fer.ris.algoritam.repositories

import edu.fer.ris.algoritam.model.Pricing
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.stereotype.Repository
import java.util.*

@Repository
interface PricingRepository : JpaRepository<Pricing, String> {
    fun findByBookId(bookId: Long): Optional<Pricing>
    fun findByBookIsbn(isbn: String): Optional<Pricing>
}