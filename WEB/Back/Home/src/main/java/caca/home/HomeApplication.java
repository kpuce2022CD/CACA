package caca.home;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class HomeApplication {

	@GetMapping("/home1")
	public String about_customer1() {
		return "Hello home1 World";
	}

	@GetMapping("/home2")
	public String about_customer2() { 
		return "Hello home2 World";
	}

	public static void main(String[] args) {
		SpringApplication.run(HomeApplication.class, args);
	}

}
