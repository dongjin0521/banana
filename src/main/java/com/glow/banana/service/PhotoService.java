package com.glow.banana.service;

import com.glow.banana.domain.Photo;
import com.glow.banana.mapper.PhotoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

@Service
public class PhotoService {

    @Autowired
    private PhotoMapper photoMapper;

//    public void savePhoto(MultipartFile file) throws IOException {
//        String fileName = file.getOriginalFilename();
//        String fileType = file.getContentType();
//        long fileSize = file.getSize();
//
//        // 파일 시스템에 파일 저장
//        file.transferTo(new File("/src/main/resources/static/image" + fileName));
//
//        // 데이터베이스에 파일 정보 저장
//        Photo photo = new Photo();
//        photo.setFileName(fileName);
//        photo.setFileType(fileType);
//        photo.setFileSize(fileSize);
//        photoMapper.insertPhoto(photo);
//    }

    public void savePhoto(MultipartFile file,String imagname) throws IOException {
        String originalFileName = file.getOriginalFilename();

        String fileType = file.getContentType();
        String fileExtension = "";
        long fileSize = file.getSize();
        if (originalFileName != null && originalFileName.contains(".")) {
            fileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
        }
        //유니크 파일네임
        //String uniqueFileName = UUID.randomUUID().toString() + fileExtension;

        // 프로젝트 루트를 기준으로 경로 설정
        Path currentPath = Paths.get(System.getProperty("user.dir"));
        Path uploadPath = Paths.get(currentPath.toString(), "src/main/resources/static/image");

        // 저장할 디렉토리 생성
        if (!Files.exists(uploadPath)) {
            Files.createDirectories(uploadPath);
        }

        // 파일 시스템에 파일 저장
        File destinationFile = uploadPath.resolve(imagname).toFile();
        file.transferTo(destinationFile);

        // 데이터베이스에 파일 정보 저장
        Photo photo = new Photo();
        photo.setFileName(imagname);
        photo.setFileType(fileType);
        photo.setFileSize(fileSize);
        photoMapper.insertPhoto(photo);


    }

}
