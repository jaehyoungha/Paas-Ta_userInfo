package kopo.poly.service;

import kopo.poly.dto.UserDTO;

public interface IUserInfoService {


    int insertUserInfo(UserDTO uDTO) throws Exception;

    int login(UserDTO uDTO)throws Exception;
}
