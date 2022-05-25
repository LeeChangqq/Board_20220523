package com.its.board.controller;

import com.its.board.dto.BoardDTO;
import com.its.board.dto.CommentDTO;
import com.its.board.dto.PageDTO;
import com.its.board.service.BoardService;
import com.its.board.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/board") // 공통주소가 많을 경우 사용
public class BoardController {
    @Autowired
    BoardService boardService;
    @Autowired
    CommentService commentService;

    //  회원가입 : /member-save => /member/save
    //  글쓰기 : /board-save => /board/save
    @GetMapping("/save")
    public String save() {
        return "board/save"; // => views/board/save.jsp
    }

    @PostMapping("/save")
    public String save1(@ModelAttribute BoardDTO boardDTO) {
        boolean result = boardService.save(boardDTO);
        if (result) {
            return "redirect:/board/findAll"; //주소
        } else {
            return "board/save-fail"; //jsp파일
        }

    }

    // 목록 출력
    @GetMapping("/findAll")
    public String findAll(Model model) {
        List<BoardDTO> boardList = boardService.findAll();
        model.addAttribute("boardList", boardList);
        return "board/list";
    }

    @GetMapping("/detail")
    public String findById(@RequestParam("id") Long id, Model model,@RequestParam(value = "page", required = false, defaultValue = "1") int page) {
        BoardDTO boardDTO = boardService.findById(id);
        model.addAttribute("boardDTO", boardDTO);
        model.addAttribute("page", page);
        // 댓글 목록도 가져가야 함.
        List<CommentDTO> commentDTOList = commentService.findAll(id);
        model.addAttribute("commentList", commentDTOList);
        return "board/detail";
    }

    @GetMapping("/passwordCheck")
    public String passwordCheck(@RequestParam("id") Long id, Model model) {
        BoardDTO boardDTO = boardService.findById(id);
        model.addAttribute("board", boardDTO);
        return "board/passwordCheck";
    }

    @GetMapping("/delete")
    public String delete(@RequestParam("id") Long id) {
        boardService.delete(id);
        return "redirect:/board/findAll";
    }
    @GetMapping("/update")
    public String updateForm(@RequestParam Long id, Model model) {
        BoardDTO boardDTO = boardService.findById(id);
        model.addAttribute("board", boardDTO);
        return "board/update";
    }

    @PostMapping("/update")
    public String update(@ModelAttribute BoardDTO boardDTO, Model model){
        boolean result = boardService.update(boardDTO);
        model.addAttribute("board", boardDTO);
        if(result) {
            // 해당 회원이 상세정보
            return "redirect:/board/detail?id=" + boardDTO.getId(); // 수정처리 후 상세페이지 요청
        }else {
            return "update-fail";
        }

    }

    @GetMapping("/saveFile")
    public String saveFileForm() {
        return "board/saveFile";
    }

    @PostMapping("/saveFile")
    public String saveFile(@ModelAttribute BoardDTO boardDTO) throws IOException {
        boardService.saveFile(boardDTO);
        return "redirect:/board/findAll";
    }
    @GetMapping("/paging")
    // /board/paging>page=1
    // required=false로 하면 /board/paging 요청도 가능
    // 별도의 페이지 값을 요청하지 않으면 첫페이지(page=1)을 보요주자.
    public String paging(@RequestParam(value="page", required=false, defaultValue="1") int page, Model model) {
        List<BoardDTO> boardList = boardService.pagingList(page);
        PageDTO paging = boardService.paging(page);
        model.addAttribute("boardList", boardList);
        model.addAttribute("paging", paging);
        return "board/pagingList";
    }

    // 검색처리
    @GetMapping("/search")
    public String search(@RequestParam("searchType") String searchType, @RequestParam("q") String q, Model model){
        List<BoardDTO> searchList = boardService.search(searchType, q);
        model.addAttribute("boardList", searchList);
        return "board/list";
    }

}