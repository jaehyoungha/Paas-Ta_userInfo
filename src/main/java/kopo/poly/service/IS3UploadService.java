package kopo.poly.service;


import kopo.poly.dto.FileDTO;
import org.springframework.web.multipart.MultipartFile;

//s3 파일 업로드 서비스용
public interface IS3UploadService {

    // 파일 업로드 로직////
    String fileUpload(MultipartFile mf, String dirName)throws Exception;

    // 업로드 파일 삭제 로직
    int fileDelete(String fileName) throws Exception;

    int fileInsert(FileDTO fDTO) throws Exception;

}