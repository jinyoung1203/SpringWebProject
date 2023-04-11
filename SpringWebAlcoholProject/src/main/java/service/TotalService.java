package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.UserDAO;
import vo.UserVO;

@Service
public class TotalService {

	private UserDAO userDao;

	@Autowired
	public TotalService(UserDAO userDao) {
		this.userDao = userDao;
		System.out.println("Service 생성자 : " + userDao);
	} // end of constructor

	public List<UserVO> selectList() {
		List<UserVO> list = userDao.selectList();
		return list;
	} // end of selectList()

} // end of class
