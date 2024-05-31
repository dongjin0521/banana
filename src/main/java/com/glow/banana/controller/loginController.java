package com.glow.banana.controller;

import com.glow.banana.service.loginService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@Controller
public class loginController {
    @Autowired
    private loginService loginService;

    @RequestMapping(value = "/login/insertAccount", method = RequestMethod.POST)
    public @ResponseBody int insertAccount(@RequestParam Map<String, String> allParams) {
        Map<String, Object> paramMap = new HashMap<>(allParams);
        // 앞단에서 지역 등 조건 필터링을 allParams 로 넘겨받음.
        // 앞단에서 가져온 변수 이외에도 필요한 매개변수를 paramMap에 추가할 수 있습니다.
        // 예: paramMap.put("key", "value");


        return loginService.insertAccount(paramMap);
    }

    @RequestMapping(value = "/login/Login", method = RequestMethod.POST)
    public @ResponseBody String Login(@RequestParam Map<String, String> allParams) {
        Map<String, Object> paramMap = new HashMap<>(allParams);
        return loginService.Login(paramMap);
    }


}
