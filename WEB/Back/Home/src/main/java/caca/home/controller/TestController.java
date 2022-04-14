package caca.home.controller;

import caca.home.dto.TestDto;
import caca.home.service.TestService;
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

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public Object test() {
        return "Hello DB!";
    }

    @RequestMapping(value = "/user", method = RequestMethod.GET) 
    public List<TestDto> getUser() { 
        return testService.getUserList(); 
    }

    @RequestMapping(value = "/login", method = {RequestMethod.GET, RequestMethod.POST})
    public boolean login_param(HttpServletRequest req) {
        String user_id = req.getParameter("user_id");
        String user_pw = req.getParameter("user_pw");

        if(!testService.getLogin(user_id, user_pw).isEmpty()){
            HttpSession session = req.getSession(); // 세션에 로그인 회원 정보 보관
            session.setAttribute(LOGIN_MEMBER, user_id);
            System.out.println("login!!! "+session.getAttribute(LOGIN_MEMBER));
        }

        return !testService.getLogin(user_id, user_pw).isEmpty();
    }
}