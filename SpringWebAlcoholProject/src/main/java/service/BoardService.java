package service;

import dao.BoardDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vo.BoardVO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class BoardService {
    private BoardDAO boardDAO;

    @Autowired
    public BoardService(BoardDAO boardDAO) {
        this.boardDAO = boardDAO;
    } // end of constructor

    public Map<String, Object> board_list(){
        Map<String, Object> board_map = boardDAO.board_list();
        return board_map;
    } // end of board_list()

    public int getRowTotal(HashMap<String, Object> map){
        int res = boardDAO.getRowTotal(map);
        return res;
    } // end of getRowTotal()

    public int board_insert(BoardVO vo){
        int res = boardDAO.board_insert(vo);
        return res;
    } // end of board_insert()

} // end of class
