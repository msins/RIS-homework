package edu.fer.ris.algoritam.model

import javax.persistence.Column
import javax.persistence.Embeddable

@Embeddable
class Address(
    @Column(name = "street")
    var street: String,
    @Column(name = "number")
    var number: String,
    @Column(name = "city")
    var city: String
) {
}