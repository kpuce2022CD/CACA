package caca.Illust_Customer;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import caca.Illust_Customer.KafkaConsumer;
import caca.Illust_Customer.KafkaProducer;

@SpringBootApplication
@RestController
@RequiredArgsConstructor
public class IllustCustomerApplication {

	private final KafkaProducer kafkaProducer;

	@GetMapping("/illust_customer1")
	public String about_customer1() {
		return "Hello illust_customer1 World";
	}

	@GetMapping("/illust_customer2")
	public String about_customer2() { 
		return "Hello illust_customer2 World";
	}

	@PostMapping("/kafka")
    public String sendMsg(@RequestParam("message") String message) {
        kafkaProducer.sendMessgae(message);
        return "Successful Sending!!";
    }

	public static void main(String[] args) {
		SpringApplication.run(IllustCustomerApplication.class, args);
	}

}
