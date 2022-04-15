package caca.Illust_Customer;

import lombok.RequiredArgsConstructor;

import java.util.ArrayList;
import java.util.List;

import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class KafkaProducer {
    
    private final KafkaTemplate<String, String> kafkaTemplate;

    public void sendMessgae(String msg) {
        String TOPIC = "clonet";
        System.out.println(String.format("Produce message : %s", msg));
        kafkaTemplate.send(TOPIC, msg);
    }

    public void sendPieceNameMessage(String arr) {
        String TOPIC = "piece";

        String[] array = arr.split(",");

        for(String s : array){
            // splitArray[0] = RepositoryName, splitArray[1] = Filename
            String[] splitArray = s.split("/");
            System.out.println(String.format("Produce Piece message : %s", splitArray[0]));
            kafkaTemplate.send(TOPIC, splitArray[0]);
        }
    }
}