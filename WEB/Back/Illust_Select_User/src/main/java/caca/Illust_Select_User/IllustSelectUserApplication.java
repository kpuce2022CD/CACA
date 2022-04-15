package caca.Illust_Select_User;

import java.util.ArrayList;
import java.util.List;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import caca.Illust_Select_User.KafkaProducer;
import caca.Illust_Select_User.KafkaConsumer;

@SpringBootApplication
@RestController
@RequiredArgsConstructor
public class IllustSelectUserApplication {

	private final KafkaProducer kafkaProducer;

	@GetMapping("/illust_select_user1")
	public String about_customer1() {
		return "Hello illust_select_user1 World";
	}

	@GetMapping("/illust_select_user2")
	public String about_customer2() { 
		return "Hello illust_select_user2 World";
	}

	@PostMapping("/kafka")
	public String sendMsg(@RequestParam("message") String message) {
		kafkaProducer.sendMessgae(message);
		return "Successful Sending!!";
	}

	@PostMapping("/piece")
	public String sendPieceName(@RequestParam("piece") ArrayList<String> arr){
		kafkaProducer.sendPieceNameMessage(arr);
		return "Succeess sendPieceName";
	}

	public static void main(String[] args) {
		SpringApplication.run(IllustSelectUserApplication.class, args);
	}

}
