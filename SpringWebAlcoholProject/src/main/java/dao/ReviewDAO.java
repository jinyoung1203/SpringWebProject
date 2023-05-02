package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.ReviewVO;
import vo.UserVO;

@Repository("reviewDao")
public class ReviewDAO {
	private SqlSessionTemplate sqlSession;

	@Autowired
	public ReviewDAO(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
		System.out.println("DAO 생성자 : " + sqlSession);
	} // end of constructor

	public List<ReviewVO> selectList() {
		List<ReviewVO> list = sqlSession.selectList("r.review_list");
		return list;
	} // end of selectList()

	public int insert(ReviewVO vo) {
		int res = sqlSession.insert("r.review_insert", vo);
		return res;
	}// end of insert
	
	public ReviewVO selectOne( int user1_idx ) {
		System.out.println("----- ReviewDAO -----");
		System.out.println("user1_idx : " + user1_idx);
		ReviewVO vo = sqlSession.selectOne("r.review_selectOne", user1_idx);
		System.out.println("vo : " + vo);
		return vo;
	}
	
	
}
