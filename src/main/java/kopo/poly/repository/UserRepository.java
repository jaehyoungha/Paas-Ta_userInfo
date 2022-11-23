package kopo.poly.repository;

import kopo.poly.repository.entity.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<UserEntity ,String> {

    //회원 존재여부
    //ID가 존재하는지 체크할 때 활용
    UserEntity findByUserId(String userId);

    UserEntity findByUserIdAndUserEmail(String userId,String userEmail);

    Optional<UserEntity> findByUserIdAndUserPwd(String userId, String userPwd);



    @Transactional
    @Modifying(clearAutomatically = true)
    @Query(value = "UPDATE USER_INFO SET USER_PWD = :userPwd WHERE USER_ID = :userId ",nativeQuery = true)
    int updateUserPwd(@Param("userPwd") String userPwd, @Param("userId") String userId);
}