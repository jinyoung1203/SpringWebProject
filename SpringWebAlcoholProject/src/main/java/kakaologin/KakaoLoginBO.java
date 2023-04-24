package kakaologin;

import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;
import org.springframework.util.StringUtils;

import javax.servlet.http.HttpSession;
import java.util.UUID;

public class KakaoLoginBO {
    // 카카오 로그인 정보
    private final static String KAKAO_CLIENT_ID = "3951fe07922dbdbd33f02177d181a7ba";
    private final static String KAKAO_CLIENT_SECRET = "a2HkDXc8LoDCXMq2rg3foyLhmWKSP3Wv";
    private final static String KAKAO_REDIRECT_URI = "http://localhost:9090/kakaoCallback.do";
    private final static String SESSION_STATE = "oauth_state_kakao";
    private final static String PROFILE_API_URL = "https://kapi.kakao.com/v2/user/me";

    public String getAuthorizationUrl(HttpSession session) {
        String state = generateRandomString();
        setSession(session, state);
        System.out.println("----- getAuthorizationUrl 메서드 -----");
        System.out.println("state : " + state);
        OAuth20Service oAuth20Service = new ServiceBuilder()
                .apiKey(KAKAO_CLIENT_ID)
                .apiSecret(KAKAO_CLIENT_SECRET)
                .callback(KAKAO_REDIRECT_URI)
                .state(state).build(KakaoLoginApi.getInstance());
        return oAuth20Service.getAuthorizationUrl();
    } // end of getAuthorizationUrl()

    public OAuth2AccessToken getAccessToken(HttpSession session, String code, String state) throws Exception {
        String sessionState = getSession(session);
        System.out.println("------ getAccessToken 메서드 ------");
        System.out.println("sessionState : " + sessionState);
        System.out.println("state : " + state);
        if (StringUtils.pathEquals(sessionState, state)) {
            OAuth20Service oAuth20Service = new ServiceBuilder()
                    .apiKey(KAKAO_CLIENT_ID)
                    .apiSecret(KAKAO_CLIENT_SECRET)
                    .callback(KAKAO_REDIRECT_URI)
                    .build(KakaoLoginApi.getInstance());
            OAuth2AccessToken accessToken = oAuth20Service.getAccessToken(code);
            System.out.println("if문 안으로 들어와서 getAccessToken 메서드 실행됨");
            return accessToken;
        }
        return null;
    } // end of getAccessToken()

    public String getUserProfile(OAuth2AccessToken oAuth2AccessToken) throws Exception {
        OAuth20Service oAuth20Service = new ServiceBuilder()
                .apiKey(KAKAO_CLIENT_ID)
                .apiSecret(KAKAO_CLIENT_SECRET)
                .callback(KAKAO_REDIRECT_URI)
                .build(KakaoLoginApi.getInstance());
        OAuthRequest request = new OAuthRequest(Verb.GET, PROFILE_API_URL, oAuth20Service);
        oAuth20Service.signRequest(oAuth2AccessToken, request);
        Response response = request.send();
        return response.getBody();
    } // end of getUserProfile()

    public String generateRandomString() {
        return UUID.randomUUID().toString();
    } // end of generateRandomString()

    public void setSession(HttpSession session, String state) {
        session.setAttribute(SESSION_STATE, state);
    } // end of setSession()

    public String getSession(HttpSession session) {
        return (String) session.getAttribute(SESSION_STATE);
    } // end of getSession()

} // end of class
