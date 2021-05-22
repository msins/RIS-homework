package edu.fer.ris.algoritam.repositories

import edu.fer.ris.algoritam.model.Designer
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.data.jpa.repository.Query
import org.springframework.stereotype.Repository
import java.util.*

@Repository
interface DesignerRepository : JpaRepository<Designer, Long> {
    /**
     * Using custom query with join fetch to also load books set.
     */
    @Query("SELECT d FROM Designer d join fetch d.books i WHERE d.name = ?1")
    fun findByName(name: String): Optional<Designer>
}