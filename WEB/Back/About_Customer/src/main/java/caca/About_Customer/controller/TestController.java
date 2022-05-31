package caca.About_Customer.controller;

import caca.About_Customer.dto.TestDto;
import caca.About_Customer.service.TestService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
@RequiredArgsConstructor
@CrossOrigin("*")
//@RequestMapping("/api")
public class TestController {
    @Autowired
    private final TestService testService;
    private static final String userID ="";
    String pieceList = "";
    private HttpSession session;

    @RequestMapping(value = "/", method = {RequestMethod.GET, RequestMethod.POST})
    public List<TestDto> getUser(HttpServletRequest req) {
        String user_id = req.getParameter("user_id");
        String piece = req.getParameter("piece");

        session = req.getSession();

        session.setAttribute(userID, user_id);
        pieceList = piece;
//        session.setAttribute(pieceList, piece);
        return testService.getUserList(user_id);
    }

    @RequestMapping(value = "/user", method = RequestMethod.GET)
    public List<TestDto> getUserID(HttpServletRequest req) {
        return testService.getUserList((String) session.getAttribute(userID));
    }

    @RequestMapping(value="/link", method= {RequestMethod.GET, RequestMethod.POST})
    public String getUserLink(){
        String Link = "http://localhost:8006/piece?user_id=" + (String) session.getAttribute(userID) +"&piece=" + pieceList;
        System.out.println(Link);
        return Link;
    }

}