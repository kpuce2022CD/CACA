package caca.Illust_Customer;

import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.stereotype.Service;

import java.io.ByteArrayOutputStream;
import java.io.IOException;

import com.jcraft.jsch.ChannelExec;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.Session;

@Service
public class KafkaConsumer {

    @KafkaListener(topics = "clonet", groupId = "foo")
    public void listen(String msg) throws IOException {
        System.out.println(String.format("Consumed message : %s", msg));
    }

    @KafkaListener(topics = "piece", groupId = "foo")
    public void listenPieceNameMessage(String msg) {
        System.out.println(String.format("Consumed message : %s", msg));

        // EC2 이미지 생성
        // git clone test.git ../clonet-repo/test
        String cmd = String.format("git clone /var/www/html/git-repositories/%s.git /var/www/html/clonet-repo/%s", msg, msg);
        System.out.println(String.format("Consumed message : %s", cmd));

        String host="13.209.116.111";
	    String username="ubuntu";
	    String password="@";
        int port = 22;

        try {
            listFolderStructure(username, password, host, port, cmd);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public static void listFolderStructure(String username, String password, 
    String host, int port, String command) throws Exception {
      
      Session session = null;
      ChannelExec channel = null;
      
      try {
          session = new JSch().getSession(username, host, port);
          session.setPassword(password);
          session.setConfig("StrictHostKeyChecking", "no");
          session.connect();
          
          channel = (ChannelExec) session.openChannel("exec");
          channel.setCommand(command);
          ByteArrayOutputStream responseStream = new ByteArrayOutputStream();
          channel.setOutputStream(responseStream);
          channel.connect();
          
          while (channel.isConnected()) {
              Thread.sleep(100);
          }
          
          String responseString = new String(responseStream.toByteArray());
          System.out.println(responseString);
      } finally {
          if (session != null) {
              session.disconnect();
          }
          if (channel != null) {
              channel.disconnect();
          }
      }
  }
}