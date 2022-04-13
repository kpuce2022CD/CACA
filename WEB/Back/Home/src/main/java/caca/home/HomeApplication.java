package caca.home;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class HomeApplication {

	@GetMapping("/home1")
	public String home1() {
		return "Hello home1 World";
	}

	@GetMapping("/home2")
	public String home2() {
		return "Hello home2 World";
	}

	@GetMapping("/about_edit_user1")
	public String about_edit_user1() {
		return "Hello about_edit_user1 World";
	}

	@GetMapping("/about_edit_user2")
	public String about_edit_user2() {
		return "Hello about_edit_user2 World";
	}

	@GetMapping("/contact_edit_user1")
	public String contact_edit_user1() {
		return "Hello contact_edit_user1 World";
	}

	@GetMapping("/contact_edit_user2")
	public String contact_edit_user2() {
		return "Hello contact_edit_user2 World";
	}

	@GetMapping("/login1")
	public String login1() {
		return "Hello login1 World";
	}

	@GetMapping("/login2")
	public String login2() {
		return "Hello login2 World";
	}

	public static void main(String[] args) {
		SpringApplication.run(HomeApplication.class, args);
	}

}
