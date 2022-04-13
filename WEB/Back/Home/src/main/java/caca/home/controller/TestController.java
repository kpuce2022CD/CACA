package caca.home.controller;

import caca.home.dto.TestDto;
import caca.home.service.TestService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

@RestController
@RequiredArgsConstructor
public class TestController {
    private final TestService testService;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public Object test() {
        return "Hello DB!";
    }

    @RequestMapping(value = "/user", method = RequestMethod.GET) 
    public List<TestDto> getUser() { 
        return testService.getUserList(); 
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET) 
    public Boolean login_param(HttpServletRequest req) {
        String user_id = req.getParameter("user_id");
        String user_pw = req.getParameter("user_pw");
        if(testService.getLogin(user_id, user_pw) != null){
            return true;
        }else{
            return false;
        }
    }
}