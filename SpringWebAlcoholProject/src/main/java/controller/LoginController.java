package controller;

import com.github.scribejava.core.model.OAuth2AccessToken;
import naverlogin.NaverLoginBO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import service.IKakaoLoginService;
import service.TotalService;
import util.Common;
import vo.UserVO;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@Controller
public class LoginController {

    private TotalService service;

    private NaverLoginBO naverLoginBO;
    private String apiResult = null;

    private IKakaoLoginService iKakaoLoginService;

    @Autowired
    public LoginController(TotalService service, NaverLoginBO naverLoginBO, IKakaoLoginService iKakaoLoginService) {
        this.service = service;
        this.naverLoginBO = naverLoginBO;
        this.iKakaoLoginService = iKakaoLoginService;
        System.out.println("naverLoginBO 객체 : " + naverLoginBO);
        System.out.println("iKakaoLoginService 객체 : " + iKakaoLoginService);
    } // end of constructor

    @RequestMapping(value = "/login.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String login(Model model, HttpSession session) {
        /* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
        String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);

        //https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
        //redirect_uri=192.168.3.3%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
        System.out.println("네이버 : " + naverAuthUrl);

        // 네이버
        model.addAttribute("naverUrl", naverAuthUrl);

        return Common.Login.VIEW_PATH + "login.jsp";
    } // end of login()

    @RequestMapping(value = "/navarCallback.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws IOException {
        System.out.println("callBack 실행됨");
        OAuth2AccessToken oauthToken;
        oauthToken = naverLoginBO.getAccessToken(session, code, state);
        // 로그인 사용자 정보를 읽어온다.
        apiResult = naverLoginBO.getUserProfile(oauthToken);
        model.addAttribute("model", apiResult);

        return Common.Login.VIEW_PATH + "callback.jsp";
    } // end of callback()


    @RequestMapping(value = "/kakaoLogin.do", method = RequestMethod.GET)
    public ModelAndView kakaoLogin(@RequestParam(value = "code", required = false) String code) throws Throwable {
        // 1. 카카오톡에 사용자 코드 받기(login.jsp의 카카오로그인 버튼에 href 경로 있음)
        System.out.println("code : " + code);

        // 2. 받은 code를 iKakaoS.getAccessToken로 보냄 ###access_Token###로 찍어서 잘 나오면은 다음단계진행
        String access_token = iKakaoLoginService.getAccessToken(code);
        System.out.println("###access_token### : " + access_token);
        // 위의 access_Token 받는 걸 확인한 후에 밑에 진행

        // 3. 받은 access_Token를 iKakaoLoginService.getUserInfo로 보냄 userInfo받아옴, userInfo에 nickname, email정보가 담겨있음
        HashMap<String, Object> userInfo =  iKakaoLoginService.getUserInfo(access_token);
        System.out.println("###nickname#### : " + userInfo.get("nickname"));
        System.out.println("###email#### : " + userInfo.get("email"));

        return null;
    } // end of kakaoLogin()

    @RequestMapping("/register_form.do")
    public String register_form() {

        return Common.Login.VIEW_PATH + "register_form.jsp";
    } // end of register()

    @RequestMapping("/register_detail_form.do")
    public String register_detail_form(Model model, UserVO vo) {
        model.addAttribute("vo", vo);
        return Common.Login.VIEW_PATH + "register_detail.jsp";
    } // end of register_detail()register_detail

    @RequestMapping("/register.do")
    public String register(Model model, UserVO vo) {
        int res = service.insert(vo);
        int check = 0;
        // 회원가입 성공, 실패, 첫 로드 확인
        if (res == 1) {
            check = 1;
        } else {
            check = 2;
        }
        model.addAttribute("check", check);
        return Common.Login.VIEW_PATH + "login.jsp";
    } // end of register()


    @RequestMapping("/test.do")
    public String test() {
        return Common.Login.VIEW_PATH + "test.jsp";
    }


} // end of class
