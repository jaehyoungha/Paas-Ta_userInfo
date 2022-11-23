package kopo.poly.service;

import kopo.poly.dto.UserDTO;

public interface IUserInfoService {

    int insertUserInfo(UserDTO uDTO) throws Exception;
    int login(UserDTO uDTO)throws Exception;
    UserDTO getUserInfo(String userId) throws Exception;
    int updateUserInfo(UserDTO uDTO) throws Exception;
    int RandomPasswordSendMail(UserDTO uDTO) throws Exception;

}