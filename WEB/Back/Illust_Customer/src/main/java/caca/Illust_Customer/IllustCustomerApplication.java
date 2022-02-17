package caca.Illust_Customer;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class IllustCustomerApplication {

	@GetMapping("/illust_customer1")
	public String about_customer1() {
		return "Hello illust_customer1 World";
	}

	@GetMapping("/illust_customer2")
	public String about_customer2() { 
		return "Hello illust_customer2 World";
	}

	public static void main(String[] args) {
		SpringApplication.run(IllustCustomerApplication.class, args);
	}

}
