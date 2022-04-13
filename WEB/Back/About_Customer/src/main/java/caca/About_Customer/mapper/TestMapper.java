package caca.About_Customer.mapper;

import caca.About_Customer.dto.TestDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface TestMapper {
    List<TestDto> getUserList() ;
}
