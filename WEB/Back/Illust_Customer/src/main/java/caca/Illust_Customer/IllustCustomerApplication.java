package caca.Illust_Customer;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

// import caca.Illust_Customer.KafkaConsumer;
// import caca.Illust_Customer.KafkaProducer;

@SpringBootApplication
@RestController
@RequiredArgsConstructor
@CrossOrigin("*")
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

	// @PostMapping("/kafka")
    // public String sendMsg(@RequestParam("message") String message) {
    //     kafkaProducer.sendMessgae(message);
    //     return "img-12.jpg,img-11.jpg,img-10.jpg";
    // }

	@RequestMapping(value = "/piece", method = {RequestMethod.GET, RequestMethod.POST})
	public String sendPieceName(@RequestParam("piece") String arr){
		kafkaProducer.sendPieceNameMessage(arr);
		return arr.toString();
	}

	public static void main(String[] args) {
		SpringApplication.run(IllustCustomerApplication.class, args);
	}

}
