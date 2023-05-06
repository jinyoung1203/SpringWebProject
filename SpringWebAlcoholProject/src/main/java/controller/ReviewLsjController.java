package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import service.ReviewLsjService;
import util.Common;

@Controller
public class ReviewLsjController {

    private ReviewLsjService ReviewService;

    @Autowired
    public ReviewLsjController(ReviewLsjService reviewService) {
        ReviewService = reviewService;
    } // end of constructor

    @RequestMapping("user_reviewList.do")
    public String user_reviewList(){
        return Common.Review_view2.VIEW_PATH + "review_test.jsp";
    } // end of user_reviewList()

    @RequestMapping("review_write.do")
    public String review_write(Model model, int product_idx){
        return Common.Review_view2.VIEW_PATH + "review_write.jsp";
    } // end of review_write()

} // end of class
