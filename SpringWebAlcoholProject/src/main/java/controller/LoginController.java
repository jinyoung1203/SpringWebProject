package controller;

import com.github.scribejava.core.model.OAuth2AccessToken;
import naverlogin.NaverLoginBO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import service.TotalService;
import util.Common;
import vo.UserVO;

import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
public class LoginController {

    private TotalService service;

    private NaverLoginBO naverLoginBO;
    private String apiResult = null;

    @Autowired
    public LoginController(TotalService service, NaverLoginBO naverLoginBO) {
        this.service = service;
        this.naverLoginBO = naverLoginBO;
        System.out.println("naverLoginBO 객체 : " + naverLoginBO);
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
        if(res == 1){
            check = 1;
        } else{
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
