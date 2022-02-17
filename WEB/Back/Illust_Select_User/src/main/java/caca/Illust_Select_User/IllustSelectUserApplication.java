package caca.Illust_Select_User;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class IllustSelectUserApplication {

	@GetMapping("/illust_select_user1")
	public String about_customer1() {
		return "Hello illust_select_user1 World";
	}

	@GetMapping("/illust_select_user2")
	public String about_customer2() { 
		return "Hello illust_select_user2 World";
	}

	public static void main(String[] args) {
		SpringApplication.run(IllustSelectUserApplication.class, args);
	}

}
