package petanitambak.petanitambakbackend.service

import jakarta.annotation.PostConstruct
import org.modelmapper.ModelMapper
import org.springframework.stereotype.Service
import petanitambak.petanitambakbackend.dto.CategoryDto
import petanitambak.petanitambakbackend.model.Activity
import petanitambak.petanitambakbackend.model.Category
import petanitambak.petanitambakbackend.model.Factor
import petanitambak.petanitambakbackend.repository.ActivityRepository
import petanitambak.petanitambakbackend.repository.CategoryRepository
import petanitambak.petanitambakbackend.repository.FactorRepository

@Service
class MainService(
    private val mapper: ModelMapper,
    private val factorRepository: FactorRepository,
    private val categoryRepository: CategoryRepository,
    private val activityRepository: ActivityRepository
) {

    fun findActivityByFactorNameAndCategoryLowerLimit(factorName: String, lowerLimit: Int): CategoryDto {
        val categories = mutableListOf<Category>()
        categoryRepository.findByFactorNameIgnoreCaseOrderByLowerLimitDesc(factorName)
            .forEach {
                if (lowerLimit >= it.lowerLimit!!) {
                    categories.add(it)
                }
            }

        val category = categories.first()

        return mapper.map(category, CategoryDto::class.java)
    }

    @PostConstruct
    fun init() {
        val factorPhAir = factorRepository.save(Factor(id = null, name = "ph"))
        val salinitas = factorRepository.save(Factor(id = null, name = "salinitas"))
        val suhu = factorRepository.save(Factor(id = null, name = "suhu"))

        //
        // PH AIR
        //

        val phRendah = categoryRepository.save(
            Category(
                id = null,
                name = "rendah",
                lowerLimit = 0,
                factor = factorPhAir
            )
        )
        val phBaik = categoryRepository.save(
            Category(
                id = null,
                name = "baik",
                lowerLimit = 70,
                factor = factorPhAir
            )
        )
        val phTinggi = categoryRepository.save(
            Category(
                id = null,
                name = "tinggi",
                lowerLimit = 85,
                factor = factorPhAir
            )
        )

        //
        // PH -> RENDAH

        val act1PhRendah = Activity(
            id = null,
            name = "Pemberian kapur",
            details = "Dosis pemberian kapur yang disarankan adalah jika pH 4 s/d 5 : 1.000 – 1.500 Kg/Ha dan Jika pH 4 s/d 5 : 1.000 – 1.500 Kg/Ha",
            category = phRendah
        )
        val act2PhRendah = Activity(
            id = null,
            name = "Pemberian saringan pecahan koral dan pecahan kulit kerang",
            details = "Memberikan saringan yang terdiri dari pecahan koral dan pecahan kulit kerang dicampur dengan potongan batu kapur pada saluran aerasi kolam.",
            category = phRendah
        )
        val act3PhRendah = Activity(
            id = null,
            name = "Pemberian batu karang pantai",
            details = "Penggunaannya juga serupa dengan penggunaan batu kapur, anda hanya cukup merendamnya di dasar kolam.",
            category = phRendah
        )

        activityRepository.saveAll(listOf(act1PhRendah, act2PhRendah, act3PhRendah))

        //
        // PH -> BAIK

        val act1PhBaik = Activity(
            id = null,
            name = "Pembersihan Kolam",
            details = "Menumpuknya sisa pakan dan kotoran menjadi faktor utama yang membuat air kolam menjadi kotor. Sehingga pembersihan kolam wajib dilakukan jika air sudah dirasa tidak sehat.",
            category = phBaik
        )
        val act2PhBaik = Activity(
            id = null,
            name = "Dosis Pemberian Suplemen",
            details = "Suplemen Organik Cair GDM Spesialis Perikanan ditakar sesuai dengan dosis lalu dicampurkan dengan air dan ditebar secara merata. Hal ini wajib dilakukan 1 minggu sekali untuk hasil yang maksimal.",
            category = phBaik
        )

        activityRepository.saveAll(listOf(act1PhBaik, act2PhBaik))

        //
        // PH -> TINGGI

        val act1PhTinggi = Activity(
            id = null,
            name = "Menggunakan Molase",
            details = "Dosis untuk pemakaian molase untuk penurunan pH adalah 10 liter/hektar atau 1 ppm.",
            category = phTinggi
        )
        val act2PhTinggi = Activity(
            id = null,
            name = "Daun Ketapang",
            details = "Merendam daun ketapang pada dasar air selama beberapa hari. Sebaiknya sebelum merendam daun ketapang, terlebih dahulu rebus daun ketapang untuk menghilangkan zat tanin yang terkandung, karena zat tanin dapat menimbulkan warna kuning pada air tambak.",
            category = phTinggi
        )
        val act3PhTinggi = Activity(
            id = null,
            name = "Gunakan tawas",
            details = "Tawas mampu membantu proses pengendapan dan dapat dengan cepat menurunkan pH air.",
            category = phTinggi
        )

        activityRepository.saveAll(listOf(act1PhTinggi, act2PhTinggi, act3PhTinggi))

        //
        // SALINITAS
        //

        val salinitasRendah = categoryRepository.save(
            Category(
                id = null,
                name = "rendah",
                lowerLimit = 0,
                factor = salinitas
            )
        )
        val salinitasBaik = categoryRepository.save(
            Category(
                id = null,
                name = "baik",
                lowerLimit = 15,
                factor = salinitas
            )
        )
        val salinitasTinggi = categoryRepository.save(
            Category(
                id = null,
                name = "tinggi",
                lowerLimit = 25,
                factor = salinitas
            )
        )

        //
        // SALINITAS -> RENDAH

        val act1SalinitasRendah = Activity(
            id = null,
            name = "Membuang air tawar di permukaan",
            details = "Hal ini dilakukan karena massa jenis air tawar lebih rendah dibandingkan air asin, sehingga air tawar cenderung berada di permukaan",
            category = salinitasRendah
        )
        val act2SalinitasRendah = Activity(
            id = null,
            name = "Pemberian kapur secara rutin",
            details = "Air hujan dapat menurunkan kadar oksigen di dalam air serta akan mengakibatkan Alkalinitas dan pH cenderung akan menurun.",
            category = salinitasRendah
        )

        activityRepository.saveAll(listOf(act1SalinitasRendah, act2SalinitasRendah))

        //
        // SALINITAS -> BAIK

        val act1SalinitasBaik = Activity(
            id = null,
            name = "Kondisi tambakmu baik",
            details = "Tidak ada yang perlu dilakukan.",
            category = salinitasBaik
        )

        activityRepository.saveAll(listOf(act1SalinitasBaik))

        //
        // SALINITAS -> TINGGI

        val act1SalinitasTinggi = Activity(
            id = null,
            name = "Menambahkan air tawar",
            details = "Menambahkan air tawar hingga ketinggian air tambak mencapai ketinggian awal sebelum terjadinya penguapan.",
            category = salinitasTinggi
        )

        activityRepository.saveAll(listOf(act1SalinitasTinggi))

        //
        // SUHU
        //

        val suhuRendah = categoryRepository.save(
            Category(
                id = null,
                name = "rendah",
                lowerLimit = 0,
                factor = suhu
            )
        )
        val suhuBaik = categoryRepository.save(
            Category(
                id = null,
                name = "baik",
                lowerLimit = 25,
                factor = suhu
            )
        )
        val suhuTinggi = categoryRepository.save(
            Category(
                id = null,
                name = "tinggi",
                lowerLimit = 25,
                factor = suhu
            )
        )

        //
        // SUHU -> RENDAH

        val act1SuhuRendah = Activity(
            id = null,
            name = "Mengurangi air tambak",
            details = "Mengurangi air tambak hingga permukaan air mengalami pengurangan tinggi berkisar 5 hingga 8 cm sampai suhu air kembali stabil.",
            category = suhuRendah
        )

        activityRepository.saveAll(listOf(act1SuhuRendah))

        //
        // SUHU -> BAIK

        val act1SuhuBaik = Activity(
            id = null,
            name = "Kondisi tambakmu baik",
            details = "Tidak ada yang perlu dilakukan.",
            category = suhuBaik
        )

        activityRepository.saveAll(listOf(act1SuhuBaik))

        //
        // SUHU -> TINGGI

        val act1SuhuTinggi = Activity(
            id = null,
            name = "Meningkatkan permukaan air tambak",
            details = "Hal tersebut dilakukan untuk meredam suhu yang memapari permukaan air, sehingga air dalam tambak dapat lebih lambat terpapar oleh panas matahari.",
            category = suhuTinggi
        )

        activityRepository.saveAll(listOf(act1SuhuTinggi))

    }

}