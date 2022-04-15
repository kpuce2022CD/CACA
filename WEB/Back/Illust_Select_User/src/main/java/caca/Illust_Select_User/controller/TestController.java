package caca.Illust_Select_User.controller;

import caca.Illust_Select_User.dto.TestDto;
import caca.Illust_Select_User.dto.RepoDto;
import caca.Illust_Select_User.KafkaProducer;
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

    private final KafkaProducer kafkaProducer;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public Object test() {
        return "Hello DB!";
    }

    @RequestMapping(value = "/user", method = RequestMethod.GET) 
    public List<TestDto> getUser() { 
        return testService.getUserList(); 
    }

    @RequestMapping(value = "/piece_u", method = {RequestMethod.GET, RequestMethod.POST})
    public void Repo_param(HttpServletRequest req) {
        String user_id = req.getParameter("user_id");
        List<RepoDto> RepoList = testService.getUserRepoList(user_id); // user_id의 RepoList DB에서 받아오기

        for (int i = 0; i < RepoList.size(); i++){
            kafkaProducer.sendPieceNameMessage(RepoList.get(i).getRepo_name());
        }




    }

    // @PostMapping("/piece")
	// public String sendPieceName(@RequestParam("piece") String arr){
	// 	kafkaProducer.sendPieceNameMessage(arr);
	// 	return "Succeess sendPieceName";
	// }

}