package kopo.poly.repository;

import kopo.poly.repository.entity.FileEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface S3UploadRepository extends JpaRepository <FileEntity, Long> {

}
