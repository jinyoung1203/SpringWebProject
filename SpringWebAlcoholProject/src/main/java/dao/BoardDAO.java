package dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import vo.BoardVO;
import vo.UserVO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class BoardDAO {
    private SqlSessionTemplate sqlSession;

    @Autowired
    public BoardDAO(SqlSessionTemplate sqlSession) {
        this.sqlSession = sqlSession;
    } // end of constructor

    public Map<String, Object> board_list(){
        Map<String, Object> board_map = new HashMap<String, Object>();
        List<BoardVO> board_list = sqlSession.selectList("b.board_list1");
        List<UserVO> user_list = sqlSession.selectList("b.board_list2");

        board_map.put("board_list", board_list);
        board_map.put("user_list", user_list);

        return board_map;
    } // end of board_list()

    public int getRowTotal(HashMap<String, Object> map){
        int res = sqlSession.selectOne("b.board_count", map);
        return res;
    } // end of getRowTotal()

    public int board_insert(BoardVO vo){
        int res = sqlSession.insert("b.board_insert", vo);
        return res;
    } // end of board_insert()

} // end of class
