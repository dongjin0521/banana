package com.glow.banana.controller;

import com.glow.banana.service.chatService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class chatController {

    @Autowired
    private chatService chatService;

    @RequestMapping(value = "/chat/insertChat", method = RequestMethod.POST)
    public @ResponseBody int insertChat(@RequestParam Map<String, String> allParams, HttpServletRequest request) {
        Map<String, Object> paramMap = new HashMap<>(allParams);
        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("userId");

        if (userId != null) {
            System.out.println("logged in. userId: "+userId);
            //임시
            paramMap.put("productId","1");
            paramMap.put("userId",userId);
            paramMap.put("type","D");
        } else {
            return 0;
        }


        return chatService.insertChat(paramMap);
    }

    @RequestMapping(value = "/chat/getChat", method = RequestMethod.POST)
    public @ResponseBody List<Map<String, Object>> getChat(@RequestParam Map<String, String> allParams, HttpServletRequest request) {
        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("userId");

        if (userId != null) {
            System.out.println("logged in. userId: "+userId);
        } else {
            System.out.println("No user is logged in");
        }

        Map<String, Object> paramMap = new HashMap<>(allParams);


        return chatService.getChat(paramMap);
    }

    @RequestMapping(value = "/chat/getChatAll", method = RequestMethod.POST)
    public @ResponseBody List<Map<String, Object>> getChatAll(@RequestParam Map<String, String> allParams, HttpServletRequest request) {
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

        return chatService.getChatAll(paramMap);
    }
}
