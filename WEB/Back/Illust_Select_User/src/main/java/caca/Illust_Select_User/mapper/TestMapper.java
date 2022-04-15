package caca.Illust_Select_User.mapper;

import caca.Illust_Select_User.dto.TestDto;
import caca.Illust_Select_User.dto.RepoDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface TestMapper {
    List<TestDto> getUserList() ;
    List<RepoDto> getUserRepoList(@Param("user_id") String user_id);
//    List<TestDto> getLogin(
//        @Param("user_id") String user_id,
//        @Param("user_pw") String user_passwd
//    );
}
