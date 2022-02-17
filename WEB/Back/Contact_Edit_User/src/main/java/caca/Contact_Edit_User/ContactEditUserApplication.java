package caca.Contact_Edit_User;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class ContactEditUserApplication {

	@GetMapping("/contact_edit_user1")
	public String about_customer1() {
		return "Hello contact_edit_user1 World";
	}

	@GetMapping("/contact_edit_user2")
	public String about_customer2() { 
		return "Hello contact_edit_user2 World";
	}

	public static void main(String[] args) {
		SpringApplication.run(ContactEditUserApplication.class, args);
	}

}
