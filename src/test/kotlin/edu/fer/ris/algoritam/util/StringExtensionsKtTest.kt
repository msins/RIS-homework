package edu.fer.ris.algoritam.util

import org.junit.jupiter.api.Assertions.*
import org.junit.jupiter.api.Test
import java.text.Normalizer

internal class StringExtensionsKtTest {

    @Test
    fun testSlugifyWithUtf8() {
        assertEquals("nevidljivi-zivot-addie-larue", "Nevidljivi život Addie LaRue".slugify())
        assertEquals("test", "TEST".slugify())
        assertEquals("cdcdzsz", "ćđčdžšž".slugify())
    }
}
