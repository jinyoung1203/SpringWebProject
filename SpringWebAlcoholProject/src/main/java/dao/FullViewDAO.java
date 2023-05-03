package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.FullViewVO;

@Repository("fullview_dao")
public class FullViewDAO {
	
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	public FullViewDAO(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
		System.out.println("DAO 생성자 : " + sqlSession);
	} // end of constructor
	
	public List<FullViewVO> selectList(){
		List<FullViewVO> list = sqlSession.selectList("p.product_list");
		return list;
	}
	
	public int selectCount() {
		int product_count = sqlSession.selectOne("p.product_count");
		return product_count;
	}
	
	public List<FullViewVO> search_select(String selections){
		System.out.println(selections);
		List<FullViewVO> list = sqlSession.selectList("p.product_search");
		return list;
	}

}
