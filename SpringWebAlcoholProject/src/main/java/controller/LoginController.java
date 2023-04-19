package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import service.TotalService;
import util.Common;
import vo.UserVO;

@Controller
public class LoginController {
    TotalService service;

    @Autowired
    public LoginController(TotalService service) {
        this.service = service;
    } // end of constructor

    @RequestMapping("/register_form.do")
    public String register_form(){

        return Common.Login.VIEW_PATH + "register_form.jsp";
    } // end of register()

    @RequestMapping("/register_detail_form.do")
    public String register_detail_form(Model model, UserVO vo){
        model.addAttribute("vo", vo);
        return Common.Login.VIEW_PATH + "register_detail.jsp";
    } // end of register_detail()register_detail

    @RequestMapping("/register.do")
    public String register(UserVO vo){
            int res = service.insert(vo);
        System.out.println(res);
        if(res == 1){
            return Common.Login.VIEW_PATH + "login.jsp";
        } else {
            return Common.Login.VIEW_PATH + "login.jsp";
        }
    } // end of register()



    @RequestMapping("/test.do")
    public String test(){
        return Common.Login.VIEW_PATH + "test.jsp";
    }




} // end of class
