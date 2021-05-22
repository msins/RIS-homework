package edu.fer.ris.algoritam.services

import edu.fer.ris.algoritam.model.Author
import edu.fer.ris.algoritam.repositories.AuthorRepository
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Service
import javax.transaction.Transactional

@Service
class AuthorService(
    @Autowired private val authorRepository: AuthorRepository
) {
    @Transactional
    fun getAll(): List<Author> {
        return authorRepository.findAll()
    }

    @Transactional
    fun count(): Long {
        return authorRepository.count()
    }

}