package edu.fer.ris.algoritam.model

import edu.fer.ris.algoritam.util.slugify
import org.hibernate.annotations.NaturalId
import java.time.LocalDate
import java.time.LocalDateTime
import java.time.format.DateTimeFormatter
import java.time.temporal.ChronoUnit
import javax.persistence.*

@Entity
@Table(name = "book")
class Book(
    @NaturalId
    @Column(name = "isbn")
    var isbn: String,

    @Column(name = "num_of_pages")
    var numOfPages: Int,

    @NaturalId
    @Column(name = "title")
    var title: String,

    @Enumerated(EnumType.STRING)
    var cover: Cover,

    @Enumerated(EnumType.STRING)
    var language: Language,

    @Transient
    var slug: String = title.slugify(),

    @Column(name = "added_at")
    var addedAt: LocalDateTime = LocalDateTime.now().truncatedTo(ChronoUnit.SECONDS),

    @Column(name = "modified_at")
    var lastModifiedAt: LocalDateTime = LocalDateTime.now().truncatedTo(ChronoUnit.SECONDS),

    @Id @GeneratedValue(strategy = GenerationType.SEQUENCE) var id: Long? = null
) {

    //Todo: switch to lazy
    @ManyToMany(
        cascade = [CascadeType.PERSIST, CascadeType.MERGE],
        fetch = FetchType.EAGER
    )
    @JoinTable(
        name = "book_author",
        joinColumns = [JoinColumn(name = "book_isbn")],
        inverseJoinColumns = [JoinColumn(name = "author_id")]
    )
    var authors: MutableSet<Author> = mutableSetOf()
        private set

    //Todo: switch to lazy
    @ManyToMany(
        cascade = [CascadeType.PERSIST, CascadeType.MERGE],
        fetch = FetchType.EAGER
    )
    @JoinTable(
        name = "book_genre",
        joinColumns = [JoinColumn(name = "book_isbn")],
        inverseJoinColumns = [JoinColumn(name = "genre_id")]
    )
    var genres: MutableSet<Genre> = mutableSetOf()
        private set

    //Todo: switch to lazy
    @ManyToMany(
        cascade = [CascadeType.PERSIST, CascadeType.MERGE],
        fetch = FetchType.EAGER
    )
    @JoinTable(
        name = "book_discount",
        joinColumns = [JoinColumn(name = "book_isbn")],
        inverseJoinColumns = [JoinColumn(name = "discount_id")]
    )
    var discounts: MutableSet<Discount> = mutableSetOf()
        private set

    @OneToOne(cascade = [CascadeType.ALL], orphanRemoval = true)
    @JoinColumn(name = "stock_id")
    var stock: Stock? = null
        private set

    @OneToOne(cascade = [CascadeType.ALL], orphanRemoval = true)
    @JoinColumn(name = "pricing_id")
    var pricing: Pricing? = null
        private set

    @ManyToOne(cascade = [CascadeType.PERSIST, CascadeType.MERGE])
    @JoinColumn(nullable = true)
    var publisher: Publisher? = null
        private set

    @ManyToOne(cascade = [CascadeType.PERSIST, CascadeType.MERGE])
    @JoinColumn(nullable = true)
    var designer: Designer? = null
        private set

    @ManyToOne(cascade = [CascadeType.PERSIST, CascadeType.MERGE])
    @JoinColumn(nullable = true)
    var editor: Editor? = null
        private set

    @ManyToOne(cascade = [CascadeType.PERSIST, CascadeType.MERGE])
    @JoinColumn(nullable = true)
    var translator: Translator? = null
        private set

    @ManyToOne(cascade = [CascadeType.PERSIST, CascadeType.MERGE])
    @JoinColumn(nullable = true)
    var printingOffice: PrintingOffice? = null
        private set

    fun addAuthor(author: Author): Book {
        this.authors.add(author)
        author.books.add(this)
        return this
    }

    fun removeAuthor(author: Author): Book {
        this.authors.remove(author)
        author.books.remove(this)
        return this
    }

    fun addGenre(genre: Genre): Book {
        this.genres.add(genre)
        genre.books.add(this)
        return this
    }

    fun removeGenre(genre: Genre): Book {
        this.genres.remove(genre)
        genre.books.remove(this)
        return this
    }

    fun addDiscount(discount: Discount): Book {
        this.discounts.add(discount)
        discount.books.add(this)
        return this
    }

    fun removeDiscount(discount: Discount): Book {
        this.discounts.remove(discount)
        discount.books.remove(this)
        return this
    }

    fun setStock(stock: Stock): Book {
        this.stock = stock
        this.stock!!.book = this
        return this
    }

    fun setPricing(pricing: Pricing): Book {
        this.pricing = pricing
        this.pricing!!.book = this
        return this
    }

    fun setPublisher(publisher: Publisher?): Book {
        this.publisher = publisher
        publisher?.let {
            this.publisher!!.books.add(this)
        }
        return this
    }

    fun setDesigner(designer: Designer?): Book {
        this.designer = designer
        designer?.let {
            this.designer!!.books.add(this)
        }
        return this
    }

    fun setEditor(editor: Editor?): Book {
        this.editor = editor
        editor?.let {
            this.editor!!.books.add(this)
        }
        return this
    }

    fun setTranslator(translator: Translator?): Book {
        this.translator = translator
        translator?.let {
            this.translator!!.books.add(this)
        }
        return this
    }

    fun setPrintingOffice(printingOffice: PrintingOffice?): Book {
        printingOffice?.let {
            this.printingOffice = printingOffice
            this.printingOffice!!.books.add(this)
        }
        return this
    }

    override fun equals(other: Any?): Boolean {
        if (this === other) return true
        if (other !is Book) return false

        if (isbn != other.isbn) return false

        return true
    }

    override fun hashCode(): Int {
        return isbn.hashCode()
    }

    override fun toString(): String {
        return """
            |Book(
            |   id='$id'
            |   isbn='$isbn',
            |   title='$title',
            |   authors=$authors,
            |   genres=$genres,
            |   printingOffice=$printingOffice,
            |   editor=$editor,
            |   designer=$designer,
            |   translator=$translator,
            |   language=$language,
            |   cover=$cover,
            |   stock=$stock,
            |   pricing=$pricing
            |)""".trimMargin()
    }

}