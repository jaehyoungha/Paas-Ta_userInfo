package kopo.poly.repository;

import kopo.poly.repository.entity.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<UserEntity ,String> {

    //회원 존재여부
    //ID가 존재하는지 체크할 때 활용
    UserEntity findByUserId(String userId);

    Optional<UserEntity> findByUserIdAndUserPwd(String userId, String userPwd);



}
