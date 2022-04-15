package caca.Illust_Select_User;

import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.stereotype.Service;

import java.io.ByteArrayOutputStream;
import java.io.IOException;

import com.jcraft.jsch.ChannelExec;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.Session;

@Service
public class KafkaConsumer {

    @KafkaListener(topics = "clonet1", groupId = "foo")
    public void listen(String msg) throws IOException {
        System.out.println(String.format("Consumed message : %s", msg));
    }

    @KafkaListener(topics = "piece_u", groupId = "foo")
    public String listenPieceNameMessage(String msg) throws IOException {
        System.out.println(String.format("Consumed message : %s", msg));

        // EC2 이미지 생성
        String cmd_rm = String.format("rm -rf /var/www/html/clonet-repo/%s", msg);
        // git clone test.git ../clonet-repo/test
        String cmd_clone = String.format("git clone /var/www/html/git-repositories/%s.git /var/www/html/clonet-repo/%s", msg, msg);
        // System.out.println(String.format("Consumed message : %s", cmd_clone));
        String cmd_ls = String.format("ls /var/www/html/clonet-repo/%s/", msg);
        // System.out.println(String.format("Consumed message : %s", cmd_ls));

        String host="13.209.116.111";
	    String username="ubuntu";
	    String password="qweR1234@";
        int port = 22;

        String Final_result = "";

        try {
            // EC2 Delete Repository
            listFolderStructure(username, password, host, port, cmd_rm);

            // EC2 Clone
            listFolderStructure(username, password, host, port, cmd_clone);

            // EC2 get Repository List
            String result = listFolderStructure(username, password, host, port, cmd_ls);
            String[] Result = result.split("\n");
            for (int i=0 ; i < Result.length; i++){
                // System.out.println(String.format("Consumed message : %s", String.format("%s/%s", msg, Result[i])));
                Final_result += String.format("%s/%s,", msg, Result[i]);
            }
            
            // System.out.println(Final_result);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return Final_result;
    }

    public static String listFolderStructure(String username, String password, String host, int port, String command) throws Exception {
      
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
        //   System.out.println(responseString);

          return responseString;


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