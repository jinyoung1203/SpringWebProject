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

	public int insert(UserVO vo){
		int res = sqlSession.insert("u.user_insert", vo);
		return res;
	} // end of insert()



} // end of class
