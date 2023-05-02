package controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import service.FullViewService;
import util.Common;
import vo.FullViewVO;

@Controller
public class FullViewController {
	
	@Autowired
	HttpServletRequest request;

	@Autowired
	ServletContext app;

	
	private FullViewService service;
	
	@Autowired
	public FullViewController(FullViewService service) {
		this.service = service;
		System.out.println("FullViewController : " + service );
	}
	
	@RequestMapping("/fullview.do")
	public String selectList(Model model) {
		List<FullViewVO> product_list = service.selectList();
		int product_count = service.selectCount();
		model.addAttribute("product_count", product_count);
		model.addAttribute("product_list", product_list);
		return Common.full_view.VIEW_PATH + "full_view_lsj.jsp";
	}
	
	

}
