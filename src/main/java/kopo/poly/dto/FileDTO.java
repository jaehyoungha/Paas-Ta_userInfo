package kopo.poly.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FileDTO {

    private Long file_seq;
    private String file_path;
    private String file_orgName;
    private String file_ext;
    private String file_reg_id;
    private String file_reg_dt;
    private String file_chg_id;
    private String file_chg_dt;
}
