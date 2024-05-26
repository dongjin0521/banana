package com.glow.banana.service;

import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.binding.MapperMethod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.glow.banana.mapper.deliveryMapper;
import java.util.List;
import java.util.Map;

@Service
public class deliveryService {
    @Autowired
    deliveryMapper deliveryMapper;

    public List<Map<String, Object>> getDeliveryList(Map<String, Object> paramMap) {
        List<Map<String, Object>> list =  deliveryMapper.list(paramMap);
        return list;
    }
}
