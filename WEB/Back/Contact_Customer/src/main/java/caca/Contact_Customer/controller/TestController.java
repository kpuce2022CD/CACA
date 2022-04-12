package caca.Contact_Customer.controller;

import caca.Contact_Customer.dto.TestDto;
import caca.Contact_Customer.service.TestService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequiredArgsConstructor
public class TestController {
    private final TestService testService;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public Object test(){
        return "Hello DB!";
    }

    @RequestMapping(value = "/user", method = RequestMethod.GET) public List<TestDto> getUser() { return testService.getUserList(); }
}
