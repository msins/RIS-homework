package edu.fer.ris.algoritam.model

import com.fasterxml.jackson.annotation.JsonProperty

enum class Cover {
    @JsonProperty("paperback")
    PAPERBACK,

    @JsonProperty("hardcover")
    HARDCOVER
}