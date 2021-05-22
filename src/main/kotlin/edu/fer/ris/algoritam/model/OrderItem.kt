package edu.fer.ris.algoritam.model

import javax.persistence.*

@Entity
@Table(name = "order_item")
class OrderItem(
    var quantity: Int,
    @Embedded
    var price: Price,

    @ManyToOne(fetch = FetchType.LAZY)
    var order: Order? = null,

    @ManyToOne(fetch = FetchType.LAZY)
    var book: Book? = null,
    @Id @GeneratedValue(strategy = GenerationType.SEQUENCE) var id: Long? = null
) {
}