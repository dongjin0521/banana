package com.glow.banana.controller;

import com.glow.banana.service.PhotoService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.apache.ibatis.binding.MapperMethod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.Banner;
import org.springframework.stereotype.Controller;
import com.glow.banana.service.deliveryService;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import static java.lang.Thread.sleep;

@Controller
public class deliveryController {
    @Autowired
    private deliveryService deliveryService;
    @Autowired
    private PhotoService photoService;
    @RequestMapping(value = "/delivery/getDeliveryList", method = RequestMethod.POST)
    public @ResponseBody List<Map<String, Object>> getDeliveryList(@RequestParam Map<String, String> allParams, HttpServletRequest request) {
        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("userId");

        if (userId != null) {
            System.out.println("logged in. userId: "+userId);
        } else {
            System.out.println("No user is logged in");
        }

        Map<String, Object> paramMap = new HashMap<>(allParams);
        // 앞단에서 지역 등 조건 필터링을 allParams 로 넘겨받음.
        // 앞단에서 가져온 변수 이외에도 필요한 매개변수를 paramMap에 추가할 수 있습니다.
        // 예: paramMap.put("key", "value");

        return deliveryService.getDeliveryList(paramMap);
    }
    //,@RequestParam("file") MultipartFile file
    @RequestMapping(value = "/delivery/insertDeliveryList", method = RequestMethod.POST)
    public @ResponseBody int insertDeliveryList(@RequestParam Map<String, String> allParams, HttpServletRequest request,@RequestParam("file") MultipartFile file) {
        Map<String, Object> paramMap = new HashMap<>(allParams);
        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("userId");

        if (userId != null) {
            System.out.println("logged in. userId: "+userId);
            paramMap.put("userId",userId);
        } else {
            return 0;
        }

        String originalFileName = file.getOriginalFilename();

        String fileType = file.getContentType();
        String fileExtension = "";
        String imageName = UUID.randomUUID().toString() + fileExtension;
        paramMap.put("imgName", imageName);


        try {
            photoService.savePhoto(file,imageName);


        } catch (IOException e) {
            throw new RuntimeException(e);
        }

//        paramMap.put("description","설명")
////        paramMap.put("userId","1");
////        paramMap.put("loc1","대구");
////        paramMap.put("loc2","북구");
////        paramMap.put("title","제목임");;

        return deliveryService.insertDeliveryList(paramMap);
    }



//    public @ResponseBody String getDeliveryList(@RequestParam Map<String, String> allParams, Model model) {
//        Map<String, Object> paramMap = new HashMap<>(allParams);
//        //앞단에서 지역 등 조건필터링을 allParams 로 넘겨받음.
//        //앞단에서 가져온 변수 이외에도 필요한 매개변수를 paramMap에 추가할 수 있습니다.
//        // 예: paramMap.put("key", "value");
//
//        model.addAttribute("list", deliveryService.getDeliveryList(paramMap));
//        //스프링 MVC에서 컨트롤러 메서드가 문자열을 반환하면, 이 문자열은 보통 뷰의 이름을 나타냄. 스프링은 이 뷰 이름을 사용하여 적절한 뷰를 찾고, 그 뷰를 렌더링하여 클라이언트에게 반환
//        return "/delivery/getDeliveryList";
//    }

}
