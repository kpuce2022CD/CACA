package caca.home.service;

import caca.home.dto.TestDto;

import java.util.List;

public interface TestService {
    public List<TestDto> getUserList(String user_id);
    public List<TestDto> updateEmail(String user_id, String user_email);
    public List<TestDto> updateAbout(String user_id, String about);
    public List<TestDto> getLogin(String user_id, String user_pw);
}

