package caca.Contact_Customer;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class ContactCustomerApplication {
	@GetMapping("/contact_customer1")
	public String about_customer1() {
		return "Hello contact_customer1 World";
	}

	@GetMapping("/contact_customer2")
	public String about_customer2() { 
		return "Hello contact_customer2 World";
	}
	public static void main(String[] args) {
		SpringApplication.run(ContactCustomerApplication.class, args);
	}

}
