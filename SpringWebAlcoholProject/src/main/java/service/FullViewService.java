package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.FullViewDAO;
import vo.FullViewVO;

@Service
public class FullViewService {
	
	private FullViewDAO fullview_dao;
	
	@Autowired
	public FullViewService(FullViewDAO fullview_dao) {
		this.fullview_dao = fullview_dao;
		System.out.println("fullviewService");
	}
	
	public List<FullViewVO> selectList(){
		List<FullViewVO> list = fullview_dao.selectList();
		return list;
	}
	
	public int selectCount() {
		int product_count = fullview_dao.selectCount();
		return product_count;
	}
	

}
