package kopo.poly.service;

import kopo.poly.dto.FileDTO;

public interface IFileService {

    //DB 파일 업로드//
    int fileUpload(FileDTO fDTO) throws Exception;


}