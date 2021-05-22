package edu.fer.ris.algoritam.model

import javax.persistence.*

@Entity
@Table(name = "orders")
class Order(
    @OneToMany(
        mappedBy = "order",
        cascade = [CascadeType.ALL],
        orphanRemoval = true,
    )
    var items: MutableSet<OrderItem>,
    @Id @GeneratedValue(strategy = GenerationType.SEQUENCE) var id: Long? = null
) {
    fun addItem(item: OrderItem): Order {
        items.add(item)
        item.order = this
        return this
    }

    fun removeItem(item: OrderItem): Order {
        items.remove(item)
        item.order = null
        return this
    }
}