package edu.fer.ris.algoritam.util

import java.text.Normalizer

/**
 * Adapted for Croatian
 */
fun String.slugify() = toLowerCase()
    .replace("\n", " ")
    .let {
        Normalizer.normalize(it, Normalizer.Form.NFKD)
            .replace("\\p{M}".toRegex(), "")
    }.replace("đ", "d")
    .replace("[^a-z\\d\\s]".toRegex(), " ")
    .split(" ")
    .joinToString("-")
    .replace("-+".toRegex(), "-")