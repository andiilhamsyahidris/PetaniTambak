package petanitambak.petanitambakbackend.dto

import java.io.Serializable

/**
 * A DTO for the {@link petanitambak.petanitambakbackend.model.Factor} entity
 */
data class FactorDto(
    var id: Int? = null,
    var name: String? = null,
    var categories: MutableCollection<CategoryDto> = mutableListOf()
) : Serializable