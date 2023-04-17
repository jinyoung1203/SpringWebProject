package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import util.Common;

@Controller
public class LoginController {
    @RequestMapping("/register.do")
    public String register(){

        return Common.Login.VIEW_PATH + "register.jsp";
    } // end of register()

    @RequestMapping("/register_detail.do")
    public String register_detail(){
        return Common.Login.VIEW_PATH + ".jsp";
    } // end of register_detail()register_detail




} // end of class
