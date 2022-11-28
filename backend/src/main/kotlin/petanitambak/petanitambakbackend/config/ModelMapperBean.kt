package petanitambak.petanitambakbackend.config

import org.modelmapper.ModelMapper
import org.springframework.context.annotation.Bean
import org.springframework.stereotype.Component

@Component
class ModelMapperBean {

    @Bean
    fun modelMapper(): ModelMapper {
        return ModelMapper()
    }

}
