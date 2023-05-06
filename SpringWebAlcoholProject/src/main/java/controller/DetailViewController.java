package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import service.DetailService;
import util.Common;
import vo.FullViewVO;
import vo.ReviewLsjVO;

import java.util.List;

@Controller
public class DetailViewController {

    private DetailService detailService;

    @Autowired
    public DetailViewController(DetailService detailService) {
        this.detailService = detailService;
    } // end of constructor

    @RequestMapping("/detailview.do")
    public String detailview(Model model, FullViewVO vo){
        System.out.println("------ detailView.do ------");
        System.out.println("vo.getProduct_idx() : " + vo.getProduct_idx());
        FullViewVO vo1 = detailService.selectOne(vo.getProduct_idx());
        List<ReviewLsjVO> review_list = detailService.review_selectList(vo.getProduct_idx());
        System.out.println("vo1 : " + vo1);
        System.out.println("review_list : " + review_list);
        


        model.addAttribute("vo1", vo1);
        model.addAttribute("review_list", review_list);

        return Common.Detail_view.VIEW_PATH + "product_detail_view.jsp";
    } // end of detailview()

} // end of class
