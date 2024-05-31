package com.glow.banana.controller;

import com.glow.banana.service.loginService;
import jakarta.servlet.http.HttpServletRequest;
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

    @RequestMapping(value = "/login/addUser", method = RequestMethod.POST)
    public @ResponseBody int addUser(@RequestParam Map<String, String> allParams) {
        Map<String, Object> paramMap = new HashMap<>(allParams);
        // 앞단에서 지역 등 조건 필터링을 allParams 로 넘겨받음.
        // 앞단에서 가져온 변수 이외에도 필요한 매개변수를 paramMap에 추가할 수 있습니다.
        // 예: paramMap.put("key", "value");


        return loginService.addUser(paramMap);
    }

    @RequestMapping(value = "/login/Login", method = RequestMethod.POST)
    public @ResponseBody String Login(@RequestParam Map<String, String> allParams, HttpServletRequest request) {
        Map<String, Object> paramMap = new HashMap<>(allParams);
        String userId = loginService.Login(paramMap);

        if (userId != null && !userId.isEmpty()) {
            HttpSession session = request.getSession();
            session.setAttribute("userId", userId);
            return userId;
        } else {
            return null;
        }
    }

    @RequestMapping(value = "login/logout", method = RequestMethod.POST)
    public @ResponseBody String logout(HttpServletRequest request) {
        //아직 제대로 로그아웃이 안됨.
        HttpSession session = request.getSession(false); // false to avoid creating a new session if one doesn't exist
        if (session != null) {
            session.invalidate();
            return "Logout successful";
        } else {
            return "No user is logged in";
        }
    }


}
