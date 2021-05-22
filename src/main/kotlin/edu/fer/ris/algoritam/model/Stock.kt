package edu.fer.ris.algoritam.model

import javax.persistence.*

@Entity
@Table(name = "stock")
class Stock(
    @Column(name = "count")
    var count: Int,
    @OneToOne(fetch = FetchType.LAZY, mappedBy = "stock")
    @MapsId
    @JoinColumn(name = "id")
    var book: Book? = null
) {
    /**
     * Set by hibernate.
     */
    @Id
    var bookId: Long? = null

    /**
     * Help jackson with parsing
     */
    constructor(count: Int) : this(count, null)

    override fun toString(): String {
        return "Stock(book=${book?.title}, count=$count)"
    }

    override fun equals(other: Any?): Boolean {
        if (this === other) return true
        if (other !is Stock) return false

        if (book != other.book) return false

        return true
    }

    override fun hashCode(): Int {
        return book?.hashCode() ?: 0
    }


}