package kopo.poly.repository.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;

@Getter
@NoArgsConstructor
@AllArgsConstructor
@Table(name="USER_FILE")
@DynamicInsert
@DynamicUpdate
@Builder
@Entity
public class FileEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "FILE_SEQ") //사진 번호
    private Long fileSeq;

    @Column(name = "IMG_URL") //AWS 이미지 경로
    private String imgUrl;

    @Column(name = "REG_ID", updatable = false) // 등록자 ID
    private String reg_id;

    @Column(name = "REG_DT", updatable = false) // 등록일
    private String reg_dt;

    @Column(name = "CHG_ID") // 수정자 ID
    private String chg_id;

    @Column(name = "CHG_DT") // 수정일
    private String chg_dt;
}
