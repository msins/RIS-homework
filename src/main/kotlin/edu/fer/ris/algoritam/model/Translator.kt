package edu.fer.ris.algoritam.model

import org.hibernate.annotations.NaturalId
import javax.persistence.*

@Entity
@Table(name = "translator")
class Translator(
    @Column(name = "name")
    @NaturalId
    var name: String,
    @OneToMany(mappedBy = "translator")
    var books: MutableSet<Book> = mutableSetOf(),
    @Id @GeneratedValue(strategy = GenerationType.SEQUENCE) var id: Long? = null
) {
    override fun toString(): String {
        return name
    }

    override fun equals(other: Any?): Boolean {
        if (this === other) return true
        if (other !is Translator) return false

        if (name != other.name) return false

        return true
    }

    override fun hashCode(): Int {
        return name.hashCode()
    }
}