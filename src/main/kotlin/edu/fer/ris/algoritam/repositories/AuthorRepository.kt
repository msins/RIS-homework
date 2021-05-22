package edu.fer.ris.algoritam.repositories

import edu.fer.ris.algoritam.model.Author
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.data.jpa.repository.Query
import org.springframework.stereotype.Repository
import java.util.*

@Repository
interface AuthorRepository : JpaRepository<Author, Long> {
    fun findByName(name: String): Optional<Author>
}