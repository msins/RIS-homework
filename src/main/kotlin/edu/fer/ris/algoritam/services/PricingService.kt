package edu.fer.ris.algoritam.services

import edu.fer.ris.algoritam.model.Pricing
import edu.fer.ris.algoritam.repositories.PricingRepository
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Service
import javax.transaction.Transactional

@Service
class PricingService(
    @Autowired private val pricingRepository: PricingRepository
) {
    @Transactional
    fun getByIsbn(isbn: String): Pricing {
        val pricingOptional = pricingRepository.findByBookIsbn(isbn)
        if (!pricingOptional.isPresent) {
            throw IllegalArgumentException("No pricing for isbn: $isbn")
        }

        return pricingOptional.get()
    }
}