package kakaologin;

import com.github.scribejava.core.builder.api.DefaultApi20;

public class KakaoLoginApi extends DefaultApi20 {
    protected KakaoLoginApi() {} // end of constructor

    private static class InstanceHolder {
        private static final KakaoLoginApi INSTANCE2 = new KakaoLoginApi();
    }

    public static KakaoLoginApi getInstance(){
        return InstanceHolder.INSTANCE2;
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
