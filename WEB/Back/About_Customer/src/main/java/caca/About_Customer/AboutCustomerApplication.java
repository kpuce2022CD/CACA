package caca.About_Customer;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class AboutCustomerApplication {
	@RequestMapping("/")
	public String home() {
		return "Hello About Customer World";
	}
	public static void main(String[] args) {
		SpringApplication.run(AboutCustomerApplication.class, args);
	}

}
