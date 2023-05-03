package dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.FullViewVO;

@Repository
public class BuyDAO {
	@Autowired
	private SqlSessionTemplate session;
	
	public FullViewVO selectProduct(int product_idx){
		return session.selectOne("b.select_product", product_idx);
	}
	
}
