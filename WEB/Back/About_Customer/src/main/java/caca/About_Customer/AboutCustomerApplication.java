package caca.About_Customer;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class AboutCustomerApplication {
	@GetMapping("/about_customer")
	public String home() {
		return "Hello About Customer World";
	}

	@GetMapping("/asdf")
	public String asdf() { return "asdf";}


	public static void main(String[] args) {
		SpringApplication.run(AboutCustomerApplication.class, args);
	}

}
