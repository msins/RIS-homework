package edu.fer.ris.algoritam.services

import edu.fer.ris.algoritam.model.Editor
import edu.fer.ris.algoritam.repositories.EditorRepository
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Service
import javax.transaction.Transactional

@Service
class EditorService(
    @Autowired private val editorRepository: EditorRepository
) {
    @Transactional
    fun getAll(): List<Editor> {
        return editorRepository.findAll()
    }

    @Transactional
    fun getByName(name: String): Editor {
        val editorOptional = editorRepository.findByName(name)
        if (!editorOptional.isPresent) {
            throw IllegalStateException("Editor doesn't exist")
        }

        return editorOptional.get()
    }

    @Transactional
    fun count(): Long {
        return editorRepository.count()
    }

    @Transactional
    fun deleteById(id: Long) {
        val editorOptional = editorRepository.findById(id)
        if (editorOptional.isPresent) {
            editorOptional.get().books.forEach {
                it.setEditor(null)
            }

            editorOptional.get().books.clear()
        }
        editorRepository.deleteById(id)
    }
}