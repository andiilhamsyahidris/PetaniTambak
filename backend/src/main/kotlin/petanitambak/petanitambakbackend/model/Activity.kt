package petanitambak.petanitambakbackend.model

import jakarta.persistence.*

@Entity
data class Activity(

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    var id: Int? = null,

    var name: String? = null,

    val details: String? = null,

    @ManyToOne(optional = false)
    @JoinColumn(name = "category_id", nullable = false)
    var category: Category? = null

)
