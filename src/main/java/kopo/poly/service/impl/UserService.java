package kopo.poly.service.impl;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import kopo.poly.dto.UserDTO;
import kopo.poly.repository.UserRepository;
import kopo.poly.repository.entity.UserEntity;
import kopo.poly.service.IUserInfoService;
import kopo.poly.util.CmmUtil;
import kopo.poly.util.EncryptUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

@Slf4j
@RequiredArgsConstructor
@Service("UserService")
public class UserService implements IUserInfoService {

    private final UserRepository userRepository;
    @Transactional
    @Override
    public int insertUserInfo(UserDTO uDTO) throws Exception {
        int res = 0;
        String userPwd = CmmUtil.nvl(uDTO.getUserPwd());
        String userEmail = CmmUtil.nvl(uDTO.getUserEmail());

        UserEntity uEntity = userRepository.findByUserId(uDTO.getUserId());

        //isPresent() 함수는 Optional객체의 값이 존재하는지 체크
        if (uEntity != null) {
            res = 2;
        } else {
            uDTO.setUserPwd(EncryptUtil.encHashSHA256(userPwd));
            uDTO.setUserEmail(EncryptUtil.encAES128CBC(userEmail));

            // 회원가입을 위해 Entity 생성 //반드시 Builder
            UserEntity sEntity = UserEntity.builder()
                    .userId(uDTO.getUserId()).userName(uDTO.getUserName()).userPwd(uDTO.getUserPwd()).userEmail(uDTO.getUserEmail())
                    .phoneNumber(uDTO.getPhoneNumber()).addr1(uDTO.getAddr1()).addr2(uDTO.getAddr2())
                    .build();


            //DB에 저장
            userRepository.save(sEntity);

            //회원가입 여부 재조회
            uEntity = userRepository.findByUserId(uDTO.getUserId());

            if (uEntity != null) { //값이 존재 // 성공
                res = 1;
            }
        }
        return res;
    }
    @Transactional
    @Override
    public int login(UserDTO uDTO) throws Exception {
        log.info(this.getClass().getName() + "login start!!");
        int res = 0;
        String userPwd = CmmUtil.nvl(uDTO.getUserPwd());
        uDTO.setUserPwd(EncryptUtil.encHashSHA256(userPwd));
        Optional<UserEntity> uEntity = userRepository.findByUserIdAndUserPwd(uDTO.getUserId(), uDTO.getUserPwd());

        if (uEntity.isPresent()) {
            res = 1;
        }
        log.info(this.getClass().getName() + "login end!!");
        return res;
    }
    @Transactional
    @Override
    public UserDTO getUserInfo(String userId) throws Exception {
        log.info(this.getClass().getName() + ".getUserInfo start!!");
        UserEntity uEntity = userRepository.findByUserId(userId);
        UserDTO uDTO = new UserDTO();
        log.info("userName : " +uDTO.getUserName());
        if (uEntity != null) {
            uDTO = new ObjectMapper().convertValue(uEntity, new TypeReference<UserDTO>() {
            });
        }
        log.info(this.getClass().getName() + ".getUserInfo end!!");
        return uDTO;
    }
    @Transactional
    @Override
    public int updateUserInfo(UserDTO uDTO) throws Exception {
        log.info(this.getClass().getName()+ ".updateUserInfo start!!");
        int res =0;
        UserEntity uEntity = UserEntity.builder().userName(uDTO.getUserName())
                .userEmail(uDTO.getUserEmail()).userPwd(uDTO.getUserPwd())
                .addr1(uDTO.getAddr1()).addr2(uDTO.getAddr2()).phoneNumber(uDTO.getPhoneNumber()).build();

        UserEntity userEntity = userRepository.save(uEntity);
        if (userEntity.getUserId().equals(uDTO.getUserId())) {
            res = 1;
        }
        log.info(this.getClass().getName()+ ".updateUserInfo end");
        return res;
    }

}

