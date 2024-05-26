package com.glow.banana.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.binding.MapperMethod;

import java.util.List;
import java.util.Map;

@Mapper
public interface deliveryMapper {
    List<Map<String, Object>> list(Map<String, Object> paramMap);



}
