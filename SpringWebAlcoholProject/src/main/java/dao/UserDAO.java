package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.UserVO;

@Repository("userDao")
public class UserDAO {
	
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	public UserDAO(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
		System.out.println("DAO 생성자 : " + sqlSession);
	} // end of constructor
	
	public List<UserVO> selectList(){
		List<UserVO> list = sqlSession.selectList("u.user_list");
		return list;
	} // end of selectList()

} // end of class
