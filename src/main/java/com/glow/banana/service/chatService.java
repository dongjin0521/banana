package com.glow.banana.service;

import com.glow.banana.mapper.chatMapper;
import com.glow.banana.mapper.deliveryMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class chatService {

    @Autowired
    chatMapper chatMapper;


    public int insertChat(Map<String, Object> paramMap) {
        int result = chatMapper.insertChat(paramMap);
        return result;
    }

    public List<Map<String, Object>> getChat(Map<String, Object> paramMap) {
        List<Map<String, Object>> list =  chatMapper.getChat(paramMap);
        return list;
    }

    public List<Map<String, Object>> getChatAll(Map<String, Object> paramMap) {
        List<Map<String, Object>> list =  chatMapper.getChatAll(paramMap);
        return list;
    }
}
