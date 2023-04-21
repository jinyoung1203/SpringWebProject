package kakaologin;

import com.github.scribejava.core.builder.api.DefaultApi20;

public class KakaoLoginApi extends DefaultApi20 {
    // single-ton pattern:
    // 객체1개만생성해서 지속적으로 서비스하자
    static KakaoLoginApi single = null;

    public static KakaoLoginApi getInstance() {
        //생성되지 않았으면 생성
        if (single == null)
            single = new KakaoLoginApi();
        //생성된 객체정보를 반환
        return single;
    } // end of getInstance()

    @Override
    public String getAccessTokenEndpoint() {
        return "https://kauth.kakao.com/oauth/token";
    }

    @Override
    protected String getAuthorizationBaseUrl() {
        return "https://kauth.kakao.com/oauth/authorize";
    }
} // end of class
