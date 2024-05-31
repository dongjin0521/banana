package com.glow.banana.mapper;


import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.binding.MapperMethod;

import java.util.List;
import java.util.Map;

@Mapper
public interface loginMapper {

    int addUser(Map<String, Object> paramMap);

    String Login(Map<String, Object> paramMap);

}



