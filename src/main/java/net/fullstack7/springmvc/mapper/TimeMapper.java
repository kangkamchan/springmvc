package net.fullstack7.springmvc.mapper;

import org.apache.ibatis.annotations.Select;

public interface TimeMapper {
    @Select("SELECT now()")
    String getTime();
}
