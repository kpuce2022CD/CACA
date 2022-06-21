package caca.Illust_Select_User.controller;

import caca.Illust_Select_User.dto.TestDto;
import caca.Illust_Select_User.dto.RepoDto;
// import caca.Illust_Select_User.KafkaConsumer;
import caca.Illust_Select_User.KafkaProducer;
import caca.Illust_Select_User.service.TestService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.CrossOrigin;

import java.io.ByteArrayOutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.jcraft.jsch.ChannelExec;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.Session;


@RestController
@RequiredArgsConstructor
@CrossOrigin("*")
public class TestController {
    private final TestService testService;
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
    public String Repo_param(HttpServletRequest req) throws Exception {
        String Final_result = "";
        
        String user_id = req.getParameter("user_id");
        List<RepoDto> RepoList = testService.getUserRepoList(user_id); // user_id의 RepoList DB에서 받아오기

        for (int i = 0; i < RepoList.size(); i++){
            kafkaProducer.sendPieceNameMessage(RepoList.get(i).getRepo_name());
        }

        // EC2 get Repository List
        String host="3.35.46.50";
	    String username="ubuntu";
	    String password="qweR1234@";
        int port = 22;

        Thread.sleep(3000);

        for (int i = 0; i < RepoList.size(); i++){
            String cmd_ls = String.format("ls /var/www/html/clonet-repo/%s/", RepoList.get(i).getRepo_name());
            String result = listFolderStructure(username, password, host, port, cmd_ls);
            String[] Result = result.split("\n");

            for (int j=0 ; j < Result.length; j++){
                Final_result += String.format("%s/%s,", RepoList.get(i).getRepo_name(), Result[j]);
            }
        }
            
        System.out.println("Final message : " + Final_result);

        return Final_result;

    }

    public static String listFolderStructure(String username, String password, String host, int port, String command) throws Exception {
      
        Session session = null;
        ChannelExec channel = null;
        
        try {
            session = new JSch().getSession(username, host, port);
            session.setPassword(password);
            session.setConfig("StrictHostKeyChecking", "no");
            session.connect();
            
            channel = (ChannelExec) session.openChannel("exec");
            channel.setCommand(command);
            ByteArrayOutputStream responseStream = new ByteArrayOutputStream();
            channel.setOutputStream(responseStream);
            channel.connect();
            
            while (channel.isConnected()) {
                Thread.sleep(100);
            }
            
            String responseString = new String(responseStream.toByteArray());
          //   System.out.println(responseString);
  
            return responseString;
  
  
          } finally {
              if (session != null) {
                  session.disconnect();
              }
              if (channel != null) {
                  channel.disconnect();
              }
          }
      }

    // @PostMapping("/piece")
	// public String sendPieceName(@RequestParam("piece") String arr){
	// 	kafkaProducer.sendPieceNameMessage(arr);
	// 	return "Succeess sendPieceName";
	// }

}