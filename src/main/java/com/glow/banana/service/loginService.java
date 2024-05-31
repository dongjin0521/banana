package com.glow.banana.service;

import com.glow.banana.mapper.deliveryMapper;
import com.glow.banana.mapper.loginMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;
@Service
public class loginService {
    @Autowired
    loginMapper loginMapper;
    public int addUser(Map<String, Object> paramMap) {
        int result =  loginMapper.addUser(paramMap);
        return result;
    }

    //로그인 mapper 접근

    public String Login(Map<String, Object> paramMap) {
        String result = loginMapper.Login(paramMap);

        return result;
    }
}
