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
    public List<TestDto> getUserList() {
        return testMapper.getUserList();
    }

    @Override
    public List<TestDto> getLogin(String user_id, String user_pw) {
        return testMapper.getLogin(user_id, user_pw);
    }
}
