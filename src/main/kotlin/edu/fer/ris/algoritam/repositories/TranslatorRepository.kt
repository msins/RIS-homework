package edu.fer.ris.algoritam.repositories

import edu.fer.ris.algoritam.model.Translator
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.data.jpa.repository.Query
import org.springframework.stereotype.Repository
import java.util.*

@Repository
interface TranslatorRepository : JpaRepository<Translator, Long> {
    /**
     * Using custom query with join fetch to also load books set.
     */
    @Query("SELECT t FROM Translator t join fetch t.books i WHERE t.name = ?1")
    fun findByName(name: String): Optional<Translator>



}