package caca.Illust_Select_User;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLDecoder;
import java.net.URLEncoder;

@Controller
public class urlDecode {
    @GetMapping("parameterEncode")
    public static String main(Model model) throws UnsupportedEncodingException, MalformedURLException {
        // URL
//        String baseurl = "https://www.javaguides.net/search?q=";
        String baseurl = "https://localhost:8080/";

        // given
//        String query = "core+java+tutorial";
        String query = "encode+ㅇㄹㄴㄹㅁㅇㄴㄹㄴㅇㄹㄹ";


        System.out.println("URL without encoding :");
        URL url = new URL(baseurl + query);
        System.out.println(url);

        // encode
        String encodedStr = URLEncoder.encode(query, "UTF-8");
        url = new URL(baseurl + encodedStr);
        System.out.println("Encoded URL :");
        System.out.println(baseurl + encodedStr);

        // decode
        System.out.println("Decoded URL :");
        String decode = URLDecoder.decode(encodedStr, "UTF-8");
        System.out.println(baseurl + decode);

        model.addAttribute("encode_URL", url);
        return "encode";
//        return url;
    }
}
