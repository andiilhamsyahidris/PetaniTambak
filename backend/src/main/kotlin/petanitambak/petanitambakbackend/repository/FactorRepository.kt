package petanitambak.petanitambakbackend.repository;

import org.springframework.data.jpa.repository.JpaRepository
import petanitambak.petanitambakbackend.model.Factor

interface FactorRepository : JpaRepository<Factor, Int> {
}