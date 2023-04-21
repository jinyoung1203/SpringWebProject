package naverlogin;

import com.github.scribejava.core.builder.api.DefaultApi20;

public class NaverLoginApi extends DefaultApi20 {
    protected NaverLoginApi() {}

    private static class InstanceHolder{
        private static final NaverLoginApi INSTANCE = new NaverLoginApi();
    }

    public static NaverLoginApi getInstance(){
        return InstanceHolder.INSTANCE;
    }

    /*// single-ton pattern:
    // 객체1개만생성해서 지속적으로 서비스하자
    static NaverLoginApi single = null;

    public static NaverLoginApi getInstance() {
        //생성되지 않았으면 생성
        if (single == null)
            single = new NaverLoginApi();
        //생성된 객체정보를 반환
        return single;
    } // end of getInstance()*/

    @Override
    public String getAccessTokenEndpoint() {
        return "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code";
    }

    @Override
    protected String getAuthorizationBaseUrl() {
        return "https://nid.naver.com/oauth2.0/authorize";
    }
} // end of class
