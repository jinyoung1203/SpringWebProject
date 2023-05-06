package service;

import dao.ReviewLsjDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReviewLsjService {
    private ReviewLsjDAO reviewLsjDAO;

    @Autowired
    public ReviewLsjService(ReviewLsjDAO reviewLsjDAO) {
        this.reviewLsjDAO = reviewLsjDAO;
    } // end of constructor



} // end of class
