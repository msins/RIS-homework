package edu.fer.ris.algoritam.model

import javax.persistence.Embeddable
import javax.persistence.EnumType
import javax.persistence.Enumerated

@Embeddable
data class Price(
    var units: Int,
    var subUnits: Int,
    @Enumerated(EnumType.STRING)
    var currency: Currency
)

operator fun Price.plus(other: Price): Price {
    val units = this.units + other.units + (this.subUnits + other.subUnits) / 100
    val subUnits = (this.subUnits + other.subUnits) % 100
    return Price(
        units,
        subUnits,
        if (this.currency == other.currency)
            this.currency else throw IllegalArgumentException("Adding different currencies.")
    )
}

operator fun Price.minus(other: Price): Price {
    val flag = (other.subUnits > this.subUnits)
    val units = this.units - other.units - if (flag) 1 else 0
    val subUnits = this.subUnits + if (flag) 100 else 0 - other.subUnits
    return Price(
        units,
        subUnits,
        if (this.currency == other.currency)
            this.currency else throw IllegalArgumentException("Subtracting different currencies.")
    )
}
