package edu.fer.ris.algoritam.services

import edu.fer.ris.algoritam.model.Translator
import edu.fer.ris.algoritam.repositories.TranslatorRepository
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Service
import javax.transaction.Transactional

@Service
class TranslatorService(
    @Autowired private val translatorRepository: TranslatorRepository
) {
    @Transactional
    fun getAll(): List<Translator> {
        return translatorRepository.findAll()
    }

    @Transactional
    fun count(): Long {
        return translatorRepository.count()
    }

    @Transactional
    fun getByName(name: String): Translator {
        val translatorOptional = translatorRepository.findByName(name)
        if (!translatorOptional.isPresent) {
            throw IllegalStateException("Translator doesn't exist")
        }

        return translatorOptional.get()
    }

    @Transactional
    fun deleteById(id: Long) {
        val translatorOptional = translatorRepository.findById(id)
        if (translatorOptional.isPresent) {
            translatorOptional.get().books.forEach {
                it.setTranslator(null)
            }

            translatorOptional.get().books.clear()
        }
        translatorRepository.deleteById(id)
    }
}