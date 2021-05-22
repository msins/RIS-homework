package edu.fer.ris.algoritam.controllers.errors

import org.springframework.http.HttpHeaders
import org.springframework.http.HttpStatus
import org.springframework.http.ResponseEntity
import org.springframework.http.converter.HttpMessageNotReadableException
import org.springframework.web.HttpMediaTypeNotSupportedException
import org.springframework.web.bind.MethodArgumentNotValidException
import org.springframework.web.bind.MissingServletRequestParameterException
import org.springframework.web.bind.annotation.ControllerAdvice
import org.springframework.web.bind.annotation.ExceptionHandler
import org.springframework.web.context.request.ServletWebRequest
import org.springframework.web.context.request.WebRequest
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler
import javax.persistence.EntityNotFoundException

@ControllerAdvice
class RestExceptionHandler : ResponseEntityExceptionHandler() {
    override fun handleMissingServletRequestParameter(
        ex: MissingServletRequestParameterException,
        headers: HttpHeaders,
        status: HttpStatus,
        request: WebRequest
    ): ResponseEntity<Any> {
        return buildResponseEntity(
            ApiError(
                HttpStatus.BAD_REQUEST,
                message = ex.parameterName + " parameter is missing",
                debugMessage = ex.message
            )
        )
    }

    override fun handleHttpMediaTypeNotSupported(
        ex: HttpMediaTypeNotSupportedException,
        headers: HttpHeaders,
        status: HttpStatus,
        request: WebRequest
    ): ResponseEntity<Any> {
        return buildResponseEntity(
            ApiError(
                HttpStatus.UNSUPPORTED_MEDIA_TYPE,
                message = "${ex.contentType} not supported. Supported types: ${ex.supportedMediaTypes.joinToString(", ")}",
                debugMessage = ex.message
            )
        )
    }

    override fun handleMethodArgumentNotValid(
        ex: MethodArgumentNotValidException,
        headers: HttpHeaders,
        status: HttpStatus,
        request: WebRequest
    ): ResponseEntity<Any> {
        return buildResponseEntity(
            ApiError(
                HttpStatus.BAD_REQUEST,
                message = "Validation Error",
            ).apply {
                ex.bindingResult.fieldErrors.forEach { fieldError ->
                    addValidationError(ApiValidationError.fromFieldError(fieldError))
                }
                ex.bindingResult.globalErrors.forEach { globalError ->
                    addValidationError(ApiValidationError.fromObjectError(globalError))
                }
            }
        )
    }

    @ExceptionHandler(EntityNotFoundException::class)
    protected fun handleEntityNotFound(ex: EntityNotFoundException): ResponseEntity<Any> {
        return buildResponseEntity(ApiError(HttpStatus.NOT_FOUND, message = ex.message))
    }

    fun buildResponseEntity(apiError: ApiError): ResponseEntity<Any> {
        return ResponseEntity(apiError, apiError.status)
    }
}

