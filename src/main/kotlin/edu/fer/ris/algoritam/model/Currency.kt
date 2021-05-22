package edu.fer.ris.algoritam.model

import com.fasterxml.jackson.annotation.JsonProperty

enum class Currency {
    @JsonProperty("hrk")
    HRK,
    @JsonProperty("eur")
    EUR
}