package edu.fer.ris.algoritam.dto

import com.fasterxml.jackson.annotation.JsonInclude
import com.fasterxml.jackson.annotation.JsonProperty
import edu.fer.ris.algoritam.model.Cover
import edu.fer.ris.algoritam.model.Language
import edu.fer.ris.algoritam.model.Pricing
import edu.fer.ris.algoritam.model.Stock

data class BookDto(
    @JsonProperty("isbn") var isbn: String,
    @JsonProperty("title") var title: String,
    @JsonProperty("cover") var cover: Cover,
    @JsonProperty("numOfPages") var numOfPages: Int,
    @JsonProperty("language") var language: Language,
    @JsonProperty("authors") var authors: List<String>,
    @JsonProperty("genres") var genres: List<String>,
    @JsonProperty("translator") var translator: String,
    @JsonProperty("printingOffice") var printingOffice: String,
    @JsonProperty("editor") var editor: String,
    @JsonProperty("designer") var designer: String,
    @JsonProperty("priceUnits") var priceUnit: Int,
    @JsonProperty("priceSubUnits") var priceSubUnit: Int,
    @JsonProperty("stockCount") var stock: Int
)