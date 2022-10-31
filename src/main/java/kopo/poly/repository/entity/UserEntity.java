package kopo.poly.repository.entity;

import lombok.*;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Getter
@NoArgsConstructor
@AllArgsConstructor
@Table(name="USER_INFO")
@DynamicInsert
@DynamicUpdate
@Builder
@Entity
public class UserEntity {

    @Id
    @Column(name = "USER_ID") // 아이디
    private String userId;

    @NonNull
    @Column(name = "USER_EMAIL", nullable = false)// 이메일
    private String userEmail;

    @NonNull
    @Column(name = "USER_PWD" , nullable = false) // 비밀번호
    private String userPwd;

    @NonNull
    @Column(name = "USER_NAME" , nullable = false) // 이름
    private String userName;

    @NonNull
    @Column(name = "PHONE_NUMBER") // 전화번호
    private String phoneNumber;

    @NonNull
    @Column(name = "ADDR1", nullable =false) // 우편번호
    private String addr1;

    @Column(name = "ADDR2") // 상세주소
    private String addr2;

    @Column(name = "REG_ID", updatable = false) // 등록자 ID
    private String reg_id;

    @Column(name = "REG_DT", updatable = false) // 등록일
    private String reg_dt;

    @Column(name = "CHG_ID") // 수정자 ID
    private String chg_id;

    @Column(name = "CHG_DT") // 수정일
    private String chg_dt;
}
