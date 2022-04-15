package caca.Illust_Select_User;

import lombok.RequiredArgsConstructor;

import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class KafkaProducer {

    private final KafkaTemplate<String, String> kafkaTemplate;

    public void sendMessgae(String msg) {
        String TOPIC = "clonet1";
        System.out.println(String.format("Produce message : %s", msg));
        kafkaTemplate.send(TOPIC, msg);
    }

    public void sendPieceNameMessage(String repoName) {
        String TOPIC = "piece_u";
        System.out.println(String.format("Produce Piece message : %s", repoName));
        kafkaTemplate.send(TOPIC, repoName.toString());
    }
}