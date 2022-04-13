package caca.home.service;

import caca.home.dto.TestDto;

import java.util.List;

public interface TestService {
    public List<TestDto> getUserList();
    public List<TestDto> getLogin(String user_id, String user_pw);
}

