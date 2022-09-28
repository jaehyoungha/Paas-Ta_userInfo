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
//    @GeneratedValue(generator = "system-uuid")
//    @GenericGenerator(name = "system-uuid", strategy = "uuid")
    @Column(name = "USER_ID")
    private String userId;

    @NonNull
    @Column(name = "USER_PWD" , nullable = false)
    private String userPwd;

    @NonNull
    @Column(name = "USER_NAME" , nullable = false)
    private String userName;

    @NonNull
    @Column(name = "USER_EMAIL", nullable = false)
    private String userEmail;

    @NonNull
    @Column(name = "PHONE_NUMBER")
    private String phoneNumber;

    @NonNull
    @Column(name = "ADDR1", nullable =false)
    private String addr1;

    @Column(name = "ADDR2")
    private String addr2;
}
