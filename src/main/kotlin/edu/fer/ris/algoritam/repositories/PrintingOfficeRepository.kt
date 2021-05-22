package edu.fer.ris.algoritam.repositories

import edu.fer.ris.algoritam.model.PrintingOffice
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.data.jpa.repository.Query
import org.springframework.stereotype.Repository
import java.util.*

@Repository
interface PrintingOfficeRepository : JpaRepository<PrintingOffice, Long> {
    /**
     * Using custom query with join fetch to also load books set.
     */
    @Query("SELECT p FROM PrintingOffice p join fetch p.books i WHERE p.name = ?1")
    fun findByName(name: String): Optional<PrintingOffice>
}