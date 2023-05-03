package dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import vo.FullViewVO;

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

} // end of class
