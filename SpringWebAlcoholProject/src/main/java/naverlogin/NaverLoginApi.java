package naverlogin;

import com.github.scribejava.core.builder.api.DefaultApi20;

public class NaverLoginApi extends DefaultApi20 {
    protected NaverLoginApi() {} // end of constructor
    private static class InstanceHolder{
        private static final NaverLoginApi INSTANCE = new NaverLoginApi();
    } // end of InstanceHolder class

    public static NaverLoginApi getInstance(){
        return InstanceHolder.INSTANCE;
    } // end of getInstance;

    @Override
    public String getAccessTokenEndpoint() {
        return "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code";
    }

    @Override
    protected String getAuthorizationBaseUrl() {
        return "https://nid.naver.com/oauth2.0/authorize";
    }
} // end of class
