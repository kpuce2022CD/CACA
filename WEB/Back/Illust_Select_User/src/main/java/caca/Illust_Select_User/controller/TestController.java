package caca.Illust_Select_User.controller;

import caca.Illust_Select_User.dto.TestDto;
import caca.Illust_Select_User.dto.RepoDto;
import caca.Illust_Select_User.service.TestService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.CrossOrigin;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@RestController
@RequiredArgsConstructor
@CrossOrigin("*")
public class TestController {
    private final TestService testService;
    private static final String LOGIN_MEMBER = "";
    private TestService user_id;
    private HttpSession session;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public Object test() {
        return "Hello DB!";
    }

    @RequestMapping(value = "/user", method = RequestMethod.GET) 
    public List<TestDto> getUser() { 
        return testService.getUserList(); 
    }

    @RequestMapping(value = "/userRepo", method = {RequestMethod.GET, RequestMethod.POST})
    public List<RepoDto> Repo_param(HttpServletRequest req) {
        String user_id = req.getParameter("user_id");

        return testService.getUserRepoList(user_id);
    }

}