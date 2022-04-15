package caca.home.service;

import caca.home.dto.TestDto;
import caca.home.mapper.TestMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class TestServiceImpl implements TestService {

    private final TestMapper testMapper;

    @Override
    public List<TestDto> getUserList(String user_id) {
        return testMapper.getUserList(user_id);
    }

    @Override
    public List<TestDto> updateEmail(String user_id, String user_email) {
        return testMapper.updateEmail(user_id, user_email);
    }

    @Override
    public List<TestDto> updateAbout(String user_id, String about) {
        return testMapper.updateAbout(user_id, about);
    }

    @Override
    public List<TestDto> getLogin(String user_id, String user_pw) {
        return testMapper.getLogin(user_id, user_pw);
    }
}
