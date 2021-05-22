package edu.fer.ris.algoritam.controllers.errors

import com.fasterxml.jackson.annotation.JsonFormat
import org.springframework.http.HttpStatus
import org.springframework.validation.FieldError
import org.springframework.validation.ObjectError
import java.time.LocalDateTime

class ApiError(
    val status: HttpStatus,
    val message: String? = null,
    val debugMessage: String? = null,
    var subErrors: MutableList<ApiSubError>? = null,
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd-MM-yyyy hh:mm:ss")
    val timestamp: LocalDateTime = LocalDateTime.now()
) {

    fun addValidationError(error: ApiValidationError) {
        addSubError(error)
    }

    private fun addSubError(error: ApiSubError) {
        if (subErrors == null) {
            subErrors = ArrayList()
        }
        subErrors!!.add(error)
    }

}

abstract class ApiSubError

data class ApiValidationError(
    var type: String? = null,
    var field: String? = null,
    val rejectedValue: Any? = null,
    val message: String? = null
) : ApiSubError() {
    companion object {
        fun fromFieldError(error: FieldError): ApiValidationError {
            return ApiValidationError(
                type = error.objectName,
                field = error.field,
                rejectedValue = error.rejectedValue,
                message = error.defaultMessage
            )

        }

        fun fromObjectError(error: ObjectError): ApiValidationError {
            return ApiValidationError(
                type = error.objectName,
                message = error.defaultMessage
            )
        }
    }
}