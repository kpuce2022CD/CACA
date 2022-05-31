package caca.home.controller;

import caca.home.dto.TestDto;
import caca.home.service.TestService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

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
        return testService.getUserList((String) session.getAttribute(LOGIN_MEMBER));
    }

    @RequestMapping(value = "/email", method = {RequestMethod.GET, RequestMethod.POST})
    public Object updateEmail(HttpServletRequest req) {
        String user_email = req.getParameter("user_email");
        System.out.println("aaa "+user_email);
        testService.updateEmail((String) session.getAttribute(LOGIN_MEMBER), user_email);
        return user_email;
    }

    @RequestMapping(value = "/contact", method = {RequestMethod.GET, RequestMethod.POST})
    public Object updateContact(HttpServletRequest req) {
        String user_contact = req.getParameter("contact");
        System.out.println("aaa "+user_contact);
        testService.updateContact((String) session.getAttribute(LOGIN_MEMBER), user_contact);
        return user_contact;
    }

    @RequestMapping(value = "/user_about", method = {RequestMethod.GET, RequestMethod.POST})
    public Object updateAbout(HttpServletRequest req) {
        String about = req.getParameter("about");
        System.out.println("aaa" + about);
        testService.updateAbout((String) session.getAttribute(LOGIN_MEMBER), about);

        return about;
    }

    @RequestMapping(value = "/login", method = {RequestMethod.GET, RequestMethod.POST})
    public boolean login_param(HttpServletRequest req) {
        String user_id = req.getParameter("user_id");
        String user_pw = req.getParameter("user_pw");

        if(!testService.getLogin(user_id, user_pw).isEmpty()){
            session = req.getSession(); // 세션에 로그인 회원 정보 보관
            session.setAttribute(LOGIN_MEMBER, user_id);
            System.out.println("login!!! "+session.getAttribute(LOGIN_MEMBER));
        }

        return !testService.getLogin(user_id, user_pw).isEmpty();
    }

    @RequestMapping(value = "/auth", method = {RequestMethod.GET, RequestMethod.POST})
    public Object userLogin() {
        return session.getAttribute(LOGIN_MEMBER);
    }
}