package edu.fer.ris.algoritam.services

import edu.fer.ris.algoritam.model.Stock
import edu.fer.ris.algoritam.repositories.StockRepository
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Service
import javax.transaction.Transactional

@Service
class StockService(
    @Autowired private val stockRepository: StockRepository
) {
    @Transactional
    fun getByIsbn(isbn: String): Stock {
        val stockOptional = stockRepository.findByBookIsbn(isbn)
        if (!stockOptional.isPresent) {
            throw IllegalArgumentException("Stock not present for isbn: $isbn")
        }

        return stockOptional.get()
    }
}