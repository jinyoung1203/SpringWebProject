package controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import service.TotalService;
import util.Common;
import vo.UserVO;

@Controller
public class UserController {
	// test
	// test입니다!!!!!!
	// develop2

	@Autowired
	HttpServletRequest request;

	@Autowired
	ServletContext app;

	private TotalService service;

	@Autowired
	public UserController(TotalService service) {
		this.service = service;
		System.out.println("Controller 생성자 : " + service);
	} // end of constructor

} // end of class
