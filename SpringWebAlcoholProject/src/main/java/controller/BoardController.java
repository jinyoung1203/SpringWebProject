package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import service.BoardService;
import util.Common;
import util.Paging;
import vo.BoardVO;

import javax.servlet.ServletContext;
import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class BoardController {
    private BoardService service;

    @Autowired
    private ServletContext app;

    @Autowired
    public BoardController(BoardService service) {
        this.service = service;
    } // end of constructor

    @RequestMapping("board_list.do")
    public String board_list(Model model, String page, String search, String search_text){
        System.out.println("===== board_list.do =====");
        Map<String, Object> board_map = service.board_list();
        System.out.println("board_map : " + board_map);
        System.out.println("board_list : " + board_map.get("board_list"));
        System.out.println("user_list : " + board_map.get("user_list"));

        int nowPage = 1;

        if(page != null && !page.isEmpty()) {
            nowPage = Integer.parseInt(page);
        }

        // 한 페이지에 표시될 게시물의 시작과 끝 번호를 계산
        // 1페이지 : 1 ~ 5 까지의 게시글
        // 2페이지 : 6 ~ 10 까지의 게시글
        int start = (nowPage - 1) * Common.Board.BLOCKLIST + 1;
        int end = start + Common.Board.BLOCKLIST - 1;

        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("start", start);
        map.put("end", end);

        // 페이지 메뉴 생성
        int row_total = service.getRowTotal(map);

        String search_param = String.format("search=%s&search_text=%s", search, search_text);

        String pageMenu = Paging.getPaging("board_list.do", nowPage, row_total, search_param, Common.Board.BLOCKLIST, Common.Board.BLOCKPAGE);

        model.addAttribute("pageMenu", pageMenu);
        model.addAttribute("board_map", board_map);

        return Common.Board.VIEW_PATH + "board_list.jsp";
    }

    @RequestMapping("board_write.do")
    public String board_write(){
        return Common.Board.VIEW_PATH + "board_write.jsp";
    } // end of board_write()


    @RequestMapping("board_insert.do")
    public String board_insert(BoardVO board_vo){
        System.out.println("===== board_insert =====");
        System.out.println("board_vo : " + board_vo);
        System.out.println("user1_idx : " + board_vo.getUser1_idx());

        String webPath = "/resources/upload/";
        String savePath = app.getRealPath(webPath);
        System.out.println("절대경로 : " + savePath);

        // 업로드된 파일 정보
        MultipartFile board_photo = board_vo.getBoard_photo();

        String board_filename = "no_file";

        if(!board_photo.isEmpty()){
            // DB에 추가할 실제 파일 이름
            board_filename = board_photo.getOriginalFilename();

            // 파일을 저장할 절대경로
            File saveFile = new File(savePath, board_filename);
            if(!saveFile.exists()){
                saveFile.mkdirs(); // 절대경로에 upload라는 이름의 폴더를 생성한다.
                // 그냥 두면 이미지 파일이 만들어 지는게 아니라 폴더로 다 만들어 진다.
            } else {
                // 동일파일일 경우 현재 업로드 시간을 붙여서 이름변경
                long time = System.currentTimeMillis();
                board_filename = String.format("%d_%s", time, board_filename);
                saveFile = new File(saveFile, board_filename);
            }

            try {
                // 업로드를 요청한 파일은 MultipartResolver클래스가 임시저장소에 보관한다.
                // 임시 저장소에 보관된 파일은 일정 시간이 지나면 사라지므로, 절대경로 위치에
                // 이미지를 물리적으로 복사해 넣어야 한다.
                board_photo.transferTo(saveFile);

            } catch (Exception e){
                e.printStackTrace();
            }
        }

        int user1_idx = board_vo.getUser1_idx();
        System.out.println("board_subject : " + board_vo.getBoard_subject());
        System.out.println("board_content : " + board_vo.getBoard_content());
        System.out.println("board_readhit : " + board_vo.getBoard_readhit());
        System.out.println("board_ref : " + board_vo.getBoard_ref());
        System.out.println("board_step : " + board_vo.getBoard_step());
        System.out.println("board_depth : " + board_vo.getBoard_depth());

        board_vo.setBoard_filename(board_filename);
        int res = service.board_insert(board_vo);
        System.out.println("res : " + res);

        return "redirect:/main.do";
    } // end of board_insert()

} // end of class
