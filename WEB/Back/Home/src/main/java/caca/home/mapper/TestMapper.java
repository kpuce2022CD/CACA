package caca.home.mapper;

import caca.home.dto.TestDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface TestMapper {
    List<TestDto> getUserList() ;
    List<TestDto> getLogin(
        @Param("user_id") String user_id,
        @Param("user_pw") String user_passwd
    );
}
