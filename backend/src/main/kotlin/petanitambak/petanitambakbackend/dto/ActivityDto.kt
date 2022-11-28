package petanitambak.petanitambakbackend.dto

import java.io.Serializable

/**
 * A DTO for the {@link petanitambak.petanitambakbackend.model.Activity} entity
 */
data class ActivityDto(var id: Int? = null, var name: String? = null, var details: String? = null) : Serializable