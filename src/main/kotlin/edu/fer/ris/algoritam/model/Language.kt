package edu.fer.ris.algoritam.model

import com.fasterxml.jackson.annotation.JsonProperty


/**
 * There is never going to be need for other languages, even english might
 * never be used for croatian book publisher.
 */
enum class Language {
    @JsonProperty("Hrvatski")
    CROATIAN,

    @JsonProperty("Engleski")
    ENGLISH
}