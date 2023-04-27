package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import service.TotalService;
import util.Common;
import vo.ProductListTestVO;

import java.util.List;

@Controller
public class ProductViewController {

    private TotalService service;

    @Autowired
    public ProductViewController(TotalService service) {
        this.service = service;
        System.out.println("----- ProductViewController 생성자 -----");
        System.out.println("service : " + service);
    } // end of constructor

    @RequestMapping("/productList.do")
    public String product_list(Model model){
        List<ProductListTestVO> product_list = service.selectList();
        model.addAttribute("product_list", product_list);

        return Common.Product.VIEW_PATH + "product_list.jsp";
    } // end of product_list

} // end of class
