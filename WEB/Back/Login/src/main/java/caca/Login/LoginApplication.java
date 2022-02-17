package caca.Login;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class LoginApplication {

	@GetMapping("/login1")
	public String about_customer1() {
		return "Hello login1 World";
	}

	@GetMapping("/login2")
	public String about_customer2() { 
		return "Hello login2 World";
	}

	public static void main(String[] args) {
		SpringApplication.run(LoginApplication.class, args);
	}

}
