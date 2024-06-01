package com.glow.banana.controller;



import com.glow.banana.service.PhotoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

@Controller
public class PhotoController {

    @Autowired
    private PhotoService photoService;

    @PostMapping("/upload")
    @ResponseBody
    public String uploadPhoto(@RequestParam("file") MultipartFile file) {
        try {
            String a="a";
            photoService.savePhoto(file,a);
            return "File uploaded successfully";
        } catch (IOException e) {
            return "Failed to upload file";
        }
    }

//    public class FileUploadController {
//
//        @PostMapping("/upload")
//        public String uploadFile(@RequestParam("file") MultipartFile file) {
//            // 여기에 파일 업로드를 처리하는 코드를 작성합니다.
//            // 성공하면 적절한 응답을 반환하고, 실패하면 에러 응답을 반환합니다.
//            if (!file.isEmpty()) {
//                // 파일을 저장하거나 처리하는 로직 추가
//                return "success";
//            } else {
//                return "error";
//            }
//        }
//    }
}
