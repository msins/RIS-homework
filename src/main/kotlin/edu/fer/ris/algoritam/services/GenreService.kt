package edu.fer.ris.algoritam.services

import edu.fer.ris.algoritam.model.Genre
import edu.fer.ris.algoritam.repositories.GenreRepository
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Service
import javax.transaction.Transactional

@Service
class GenreService(
    @Autowired private val genreRepository: GenreRepository
) {
    @Transactional
    fun getAll(): List<Genre> {
        return genreRepository.findAll()
    }

    @Transactional
    fun count(): Long {
        return genreRepository.count()
    }
}