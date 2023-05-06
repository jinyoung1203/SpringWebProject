package dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewLsjDAO {
    private SqlSessionTemplate sqlSession;

    @Autowired
    public ReviewLsjDAO(SqlSessionTemplate sqlSession) {
        this.sqlSession = sqlSession;
    } // end of constructor

    

} // end of class
