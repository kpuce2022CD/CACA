package caca.About_Customer.service;

import caca.About_Customer.dto.TestDto;

import java.util.List;

public interface TestService {
    public List<TestDto> getUserList(String user_id);
}
