package kopo.poly.mapper;

import kopo.poly.dto.UserDTO;
import kopo.poly.repository.entity.UserEntity;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;


@Mapper
public interface UserMapper {
    UserMapper INSTANCE = Mappers.getMapper(UserMapper.class);

    UserDTO userEntityToUserDto(UserEntity userEntity);

    UserEntity userDtoToUserEntity(UserDTO userDTO);
}
