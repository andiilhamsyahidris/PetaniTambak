package petanitambak.petanitambakbackend.dto

import java.io.Serializable

/**
 * A DTO for the {@link petanitambak.petanitambakbackend.model.Category} entity
 */
data class CategoryDto(
    var id: Int? = null,
    var name: String? = null,
    var lowerLimit: Int? = null,
    var activities: MutableCollection<ActivityDto> = mutableListOf()
) : Serializable