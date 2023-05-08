package service;

import dao.DetailViewDAO;
import dao.FullViewDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vo.FullViewVO;

@Service
public class DetailService {
    private DetailViewDAO detailViewDAO;

    @Autowired
    public DetailService(DetailViewDAO detailViewDAO) {
        this.detailViewDAO = detailViewDAO;
    } // end of constructor

    public FullViewVO selectOne(int product_idx){
        FullViewVO vo = detailViewDAO.selectOne(product_idx);
        return vo;
    } // end of selectOne()

} // end of class
