package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import util.Common;

@Controller
public class MainController {
    @RequestMapping(value = {"/", "/main.do"})
    public String main() {
        return Common.Main.VIEW_PATH + "main.jsp";
    } // end of main()

    @RequestMapping("/login.do")
    public String login() {
        return Common.Login.VIEW_PATH + "login.jsp";
    } // end of login()

} // end of class
