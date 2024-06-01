package com.glow.banana.mapper;

import com.glow.banana.domain.Photo;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PhotoMapper {


    void insertPhoto(Photo photo);
}
