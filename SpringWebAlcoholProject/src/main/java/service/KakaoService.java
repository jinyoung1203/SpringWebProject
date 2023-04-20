package service;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.springframework.stereotype.Service;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

@Service
public class KakaoService implements IKakaoLoginService {
    BufferedWriter bw;
    BufferedReader br;
    @Override
    public String getAccessToken(String authorize_code) throws Throwable {
        String access_token = "";
        String refresh_token = "";
        String reqUrl = "https://kauth.kakao.com/oauth/token";

        try {
            URL url = new URL(reqUrl);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

            // POST 요청을 위해 기본값이 false인 setDoOutput을 true로
            conn.setRequestMethod("post");
            conn.setDoOutput(true);

            // POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
            bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            StringBuilder sb = new StringBuilder();
            sb.append("grant_type=authorization_code");
            sb.append("&client_id=3951fe07922dbdbd33f02177d181a7ba"); // REST_API키 본인이 발급받은 key 넣어주기
            sb.append("&redirect_uri=https://192.168.3.3:9090/kakaoLogin.do"); // REDIRECT_URI 본인이 설정한 주소 넣어주기
            sb.append("&code=" + authorize_code);

            bw.write(sb.toString());
            bw.flush();

            // 결과 코드가 200이라면 성공
            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);

            // 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
            br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line = "";
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            } // end of while
            System.out.println("result : " + result);

            // jackson objectmapper 객체 생성
            ObjectMapper objectMapper = new ObjectMapper();

            // JSON String -> Map
            Map<String, Object> jsonMap = objectMapper.readValue(result, new TypeReference<Map<String, Object>>() {
            });

            access_token = jsonMap.get("access_token").toString();
            refresh_token = jsonMap.get("refresh_token").toString();

            System.out.println("access_token : " + access_token);
            System.out.println("refresh_token : " + refresh_token);
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            br.close();
            bw.close();
        }

        return access_token;
    } // end of getAccessToken;

    @SuppressWarnings("unchecked")
    @Override
    public HashMap<String, Object> getUserInfo(String access_token) throws Throwable {
        // 요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
        HashMap<String, Object> userInfo = new HashMap<String, Object>();
        String reqUrl = "https://kapi.kakao.com/v2/user/me";

        try {
            URL url = new URL(reqUrl);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("get");

            // 요청에 필요한 Header에 포함될 내용
            conn.setRequestProperty("Authorization", "Bearer " + access_token);

            int responseCode = conn.getResponseCode();
            System.out.println(responseCode);

            br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line = "";
            String result = "";

            while ((line = br.readLine()) != null){
                result += line;
            } // end of while
            System.out.println("response body : " + result);
            System.out.println("result type : " + result.getClass().getName()); // java.lang.String

            // jackson objectmapper 객체 생성
            ObjectMapper objectMapper = new ObjectMapper();

            // JSON String -> Map
            Map<String, Object> jsonMap = objectMapper.readValue(result, new TypeReference<Map<String, Object>>(){
            });

            System.out.println(jsonMap.get("properties"));

            Map<String, Object> properties = (Map<String, Object>) jsonMap.get("properties");
            Map<String, Object> kakao_account = (Map<String, Object>) jsonMap.get("kakao_account");

            System.out.println(properties.get("nickname"));
            System.out.println(kakao_account.get("email"));

            String nickname = properties.get("nickname").toString();
            String email = kakao_account.get("email").toString();

            userInfo.put("nickname", nickname);
            userInfo.put("email", email);
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            br.close();
        }

        return userInfo;
    } // end of getUserInfo()
} // end of class
