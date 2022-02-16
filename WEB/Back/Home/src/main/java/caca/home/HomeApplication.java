package caca.home;

//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.RestController;
//
//@RestController
//public class HomeApplication {
//	@GetMapping("/home")
//	public String getHome(){
//		return "Home";
//	}
//}

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.Date;

@SpringBootApplication
@RestController
public class HomeApplication {

	@GetMapping("/test")
	public String time(){
		return "안녕하세요. 현재 서버의 시간은 " + new Date() + " 입니다!";
	}

	@GetMapping("/home")
	public String home() {
		return "Home Front & Back";
	}

	public static void main(String[] args) {
		SpringApplication.run(HomeApplication.class, args);
	}

}
