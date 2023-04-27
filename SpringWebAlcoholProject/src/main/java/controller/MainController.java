package controller;

import naverlogin.NaverLoginBO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import util.Common;

import javax.servlet.http.HttpSession;

@Controller
public class MainController {

    @RequestMapping(value = {"/", "/main.do"})
    public String main() {
        return Common.Main.VIEW_PATH + "main.jsp";
    } // end of main()

} // end of class
