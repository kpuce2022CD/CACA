package caca.home.mapper;

import caca.home.dto.TestDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface TestMapper {
    List<TestDto> getUserList() ;
}
