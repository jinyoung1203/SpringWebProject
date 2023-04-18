package controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import util.Common;
import vo.UserVO;

@Controller
public class LoginController {
    @RequestMapping("/register.do")
    public String register(){

        return Common.Login.VIEW_PATH + "register.jsp";
    } // end of register()

    @RequestMapping("/register_detail.do")
    public String register_detail(Model model, UserVO vo){
        model.addAttribute("vo", vo);
        return Common.Login.VIEW_PATH + "register_detail.jsp";
    } // end of register_detail()register_detail



    @RequestMapping("/test.do")
    public String test(){
        return Common.Login.VIEW_PATH + "test.jsp";
    }




} // end of class
