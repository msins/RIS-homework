package edu.fer.ris.algoritam.services

import edu.fer.ris.algoritam.model.PrintingOffice
import edu.fer.ris.algoritam.repositories.PrintingOfficeRepository
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Service
import javax.transaction.Transactional

@Service
class PrintingOfficeService(
    @Autowired private val printingOfficeRepository: PrintingOfficeRepository
) {

    @Transactional
    fun getAll(): List<PrintingOffice> {
        return printingOfficeRepository.findAll()
    }

    @Transactional
    fun count(): Long {
        return printingOfficeRepository.count()
    }
}