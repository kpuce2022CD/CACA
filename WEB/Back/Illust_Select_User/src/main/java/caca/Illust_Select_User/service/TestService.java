package caca.Illust_Select_User.service;

import caca.Illust_Select_User.dto.TestDto;
import caca.Illust_Select_User.dto.RepoDto;

import java.util.List;

public interface TestService {
    public List<TestDto> getUserList();
    public List<RepoDto> getUserRepoList(String user_id);
//    public List<TestDto> getLogin(String user_id, String user_pw);
}

