package edu.fer.ris.algoritam.repositories

import edu.fer.ris.algoritam.model.Book
import edu.fer.ris.algoritam.model.Editor
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.data.jpa.repository.Query
import org.springframework.stereotype.Repository
import java.util.*

@Repository
interface EditorRepository : JpaRepository<Editor, Long> {
    /**
     * Using custom query with join fetch to also load books set.
     */
    @Query("SELECT e FROM Editor e join fetch e.books i WHERE e.name = ?1")
    fun findByName(name: String): Optional<Editor>
}