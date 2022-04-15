package caca.Illust_Select_User.service;

import caca.Illust_Select_User.dto.TestDto;
import caca.Illust_Select_User.dto.RepoDto;
import caca.Illust_Select_User.mapper.TestMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class TestServiceImpl implements TestService {

    private final TestMapper testMapper;

    @Override
    public List<TestDto> getUserList() {
        return testMapper.getUserList();
    }

    @Override
    public List<RepoDto> getUserRepoList(String user_id) {
        return testMapper.getUserRepoList(user_id);
    }

//    @Override
//    public List<TestDto> getLogin(String user_id, String user_pw) {
//        return testMapper.getLogin(user_id, user_pw);
//    }
}
