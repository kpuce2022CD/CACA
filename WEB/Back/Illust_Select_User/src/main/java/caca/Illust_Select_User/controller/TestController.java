package caca.Illust_Select_User.controller;

import caca.Illust_Select_User.dto.TestDto;
import caca.Illust_Select_User.dto.RepoDto;
// import caca.Illust_Select_User.KafkaConsumer;
import caca.Illust_Select_User.KafkaProducer;
import caca.Illust_Select_User.service.TestService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.CrossOrigin;

import java.util.Collections;
import java.util.List;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.kafka.clients.consumer.ConsumerRecord;
import org.apache.kafka.clients.consumer.ConsumerRecords;
import org.apache.kafka.clients.consumer.Consumer;
import org.apache.kafka.clients.consumer.ConsumerConfig;
import org.apache.kafka.clients.consumer.KafkaConsumer;


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
    public String Repo_param(HttpServletRequest req) {
        String Final_Result = "";
        
        String user_id = req.getParameter("user_id");
        List<RepoDto> RepoList = testService.getUserRepoList(user_id); // user_id의 RepoList DB에서 받아오기

        for (int i = 0; i < RepoList.size(); i++){
            kafkaProducer.sendPieceNameMessage(RepoList.get(i).getRepo_name());
        }

        Properties props = new Properties();
        props.put("bootstrap.servers", "172.18.0.44:9092");
        props.put("group.id", "foo");
        props.put("key.deserializer", "org.apache.kafka.common.serialization.StringDeserializer");
        props.put("value.deserializer", "org.apache.kafka.common.serialization.StringDeserializer");


        KafkaConsumer<String, String> kafkaConsumer = new KafkaConsumer<>(props);
        kafkaConsumer.subscribe(Collections.singletonList("piece_u"));

        try {
            while (true) {
                ConsumerRecords<String, String> records = kafkaConsumer.poll(100);
                for (ConsumerRecord<String, String> record : records){
                    System.out.println(record.value());
                    Final_Result += record.value().toString();
                }
            }
        } finally {
            kafkaConsumer.close();
            System.out.println("message: " + Final_Result);
            return Final_Result;
        }
    }

    // @PostMapping("/piece")
	// public String sendPieceName(@RequestParam("piece") String arr){
	// 	kafkaProducer.sendPieceNameMessage(arr);
	// 	return "Succeess sendPieceName";
	// }

}