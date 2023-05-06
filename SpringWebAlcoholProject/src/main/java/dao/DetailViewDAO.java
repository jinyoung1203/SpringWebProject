package dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import vo.FullViewVO;
import vo.ReviewLsjVO;

import java.util.List;

@Repository
public class DetailViewDAO {
    private SqlSessionTemplate sqlSession;

    @Autowired
    public DetailViewDAO(SqlSessionTemplate sqlSession) {
        this.sqlSession = sqlSession;
    } // end of constructor

    public FullViewVO selectOne(int product_idx){
        FullViewVO vo = sqlSession.selectOne("p.product_selectOne", product_idx);
        return vo;
    } // end of selectOne()

    // review select
    public List<ReviewLsjVO> review_selectList(int product_idx){
        List<ReviewLsjVO> reviewList = sqlSession.selectList("p.review_selectList", product_idx);
        return reviewList;
    } // end of review_selectList()

} // end of class
