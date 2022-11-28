package petanitambak.petanitambakbackend.repository;

import org.springframework.data.jpa.repository.JpaRepository
import petanitambak.petanitambakbackend.model.Category

interface CategoryRepository : JpaRepository<Category, Int> {

    fun findByFactorNameIgnoreCaseOrderByLowerLimitDesc(name: String): List<Category>

}