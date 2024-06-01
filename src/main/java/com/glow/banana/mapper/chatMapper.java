package com.glow.banana.mapper;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface chatMapper {
    int insertChat(Map<String, Object> paramMap);

    List<Map<String, Object>> getChat(Map<String, Object> paramMap);

    List<Map<String, Object>> getChatAll(Map<String, Object> paramMap);
}
