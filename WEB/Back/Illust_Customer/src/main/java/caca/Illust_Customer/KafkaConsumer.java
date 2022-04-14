package caca.Illust_Customer;

import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.stereotype.Service;

import java.io.IOException;

@Service
public class KafkaConsumer {

    @KafkaListener(topics = "clonet", groupId = "foo")
    public void listen(String msg) throws IOException {
        System.out.println(String.format("Consumed message : %s", msg));
    }

    @KafkaListener(topics = "piece", groupId = "foo")
    public void listenPieceNameMessage(String msg) throws IOException {
        System.out.println(String.format("Consumed message : %s", msg));
    }
}