package edu.fer.ris.algoritam.services

import edu.fer.ris.algoritam.model.Designer
import edu.fer.ris.algoritam.repositories.DesignerRepository
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Service
import javax.transaction.Transactional

@Service
class DesignerService(
    @Autowired private val designerRepository: DesignerRepository
) {
    @Transactional
    fun getAll(): List<Designer> {
        return designerRepository.findAll()
    }

    @Transactional
    fun count(): Long {
        return designerRepository.count()
    }

    @Transactional
    fun getByName(name: String): Designer {
        val designerOptional = designerRepository.findByName(name)
        if (!designerOptional.isPresent) {
            throw IllegalStateException("Designer doesn't exist")
        }

//        Hibernate.initialize(designerOptional.get().books)
        return designerOptional.get()
    }
}