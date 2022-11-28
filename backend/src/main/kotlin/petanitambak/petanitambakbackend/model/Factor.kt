package petanitambak.petanitambakbackend.model

import jakarta.persistence.*

@Entity
data class Factor(

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    var id: Int? = null,

    var name: String? = null

) {
    @OneToMany(mappedBy = "factor", orphanRemoval = true)
    var categories: MutableCollection<Category> = mutableListOf()
}
