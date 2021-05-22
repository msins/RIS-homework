package edu.fer.ris.algoritam.model

import javax.persistence.*

@Entity
@Table(name = "pricing")
class Pricing(
    @Embedded
    val price: Price,
    @OneToOne(fetch = FetchType.LAZY, mappedBy = "pricing")
    @MapsId
    @JoinColumn(name = "id")
    var book: Book? = null
) {
    @Id
    var bookId: Long? = null

    override fun toString(): String {
        return "Pricing(book=(${book!!.id}, ${book?.title}), price=($price))"
    }

    override fun equals(other: Any?): Boolean {
        if (this === other) return true
        if (other !is Pricing) return false

        if (book != other.book) return false

        return true
    }

    override fun hashCode(): Int {
        return book?.hashCode() ?: 0
    }


}