package petanitambak.petanitambakbackend.repository;

import org.springframework.data.jpa.repository.JpaRepository
import petanitambak.petanitambakbackend.model.Activity

interface ActivityRepository : JpaRepository<Activity, Int> {
}