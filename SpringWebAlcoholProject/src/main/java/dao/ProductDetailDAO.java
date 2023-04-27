package dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import vo.ProductListTestVO;

import java.util.List;

@Repository("productDetailDao")
public class ProductDetailDAO {
    private SqlSessionTemplate sqlsession;

    @Autowired
    public ProductDetailDAO(SqlSessionTemplate sqlsession) {
        this.sqlsession = sqlsession;
    } // end of constructor

    public List<ProductListTestVO> selectList(){
        List<ProductListTestVO> product_list = sqlsession.selectList("p.select_list");
        return product_list;
    } // end of selectList()


} // end of class
