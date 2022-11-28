package petanitambak.petanitambakbackend.model

import jakarta.persistence.*

@Entity
data class Category(

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    var id: Int? = null,

    var name: String? = null,

    var lowerLimit: Int? = null,

    @ManyToOne(optional = false)
    @JoinColumn(name = "factor_id", nullable = false)
    var factor: Factor? = null

) {
    @OneToMany(mappedBy = "category", orphanRemoval = true)
    var activities: MutableCollection<Activity> = mutableListOf()
}
