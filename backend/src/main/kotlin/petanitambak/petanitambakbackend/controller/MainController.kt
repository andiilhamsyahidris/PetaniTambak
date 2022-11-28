package petanitambak.petanitambakbackend.controller

import org.springframework.stereotype.Controller
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.RestController
import petanitambak.petanitambakbackend.dto.CategoryDto
import petanitambak.petanitambakbackend.service.MainService

@RestController
class MainController(
    private val service: MainService
) {

    @GetMapping("{factorName}/{lowerLimit}")
    fun findActivityByFactorNameAndCategoryLowerLimit(
        @PathVariable factorName: String,
        @PathVariable lowerLimit: Int
    ): CategoryDto {
        return service.findActivityByFactorNameAndCategoryLowerLimit(factorName, lowerLimit)
    }

}
