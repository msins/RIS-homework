package edu.fer.ris.algoritam.model

import java.time.LocalDate
import javax.persistence.*

@Entity
@Table(name = "discount")
class Discount(
    @Column(name = "start_date")
    var start: LocalDate,
    @Column(name = "end_date")
    var end: LocalDate,
    @Column(nullable = false)
    var percentage: Short,
    @ManyToMany(mappedBy = "discounts")
    var books: MutableSet<Book> = mutableSetOf(),
    @Id @GeneratedValue(strategy = GenerationType.SEQUENCE) var id: Long? = null
) {

    init {
        require(percentage in 1..100) { "Discount percentage out of range: $percentage" }
    }
}