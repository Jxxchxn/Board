package com.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.board.dto.BoardDTO;
import com.board.dto.ReplyDTO;
import com.board.service.BoardService;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class BoardController {

	@Autowired
	private BoardService bsvc;
	
	/************ 게시글 ************/
	/* 게시글 목록 */
	@RequestMapping(value = "/boardList")
	public ModelAndView boardList() {
		ModelAndView mav = new ModelAndView();
		// 1. 글 목록 조회 호출
		ArrayList<BoardDTO> boardList = bsvc.getBoardList();
		// 2. 글 목록 ModelAndView 저장
		mav.addObject("boardList", boardList);
		// 3. 이동할 페이지 설정
		mav.setViewName("board/boardList");
		
		return mav;
	}
	
	
	/* 게시글 작성 */
	@RequestMapping(value = "/boardWriteForm")
	public ModelAndView boardWriteForm() {
		ModelAndView mav = new ModelAndView();
		//이동할 페이지 설정
		mav.setViewName("board/boardWriteForm");
		
		return mav;
	}	
	
	@RequestMapping(value = "/boardWrite")
	public ModelAndView boardWrite(BoardDTO writeBoard) throws IllegalStateException, IOException {
		ModelAndView mav = new ModelAndView();
		// 글 등록 서비스 호출
		int writeResult = bsvc.boardWrite(writeBoard);
		if(writeResult > 0) {
			System.out.println("글 등록 성공");
			mav.setViewName("redirect:/boardList");
		} else {
			System.out.println("글 등록 실패");
			mav.setViewName("redirect:/boardWriteForm");
		}
		
		return mav;
	}
	
	
	
	/* 글 상세 보기 */
	@RequestMapping(value = "/boardView")
	public ModelAndView boardView(int viewBno) {
		ModelAndView mav = new ModelAndView();
		//1. 상세 보기 호출
		BoardDTO board = bsvc.getBoardView(viewBno);
		mav.addObject("board", board);
		// (+) 댓글 목록 조회
		ArrayList<ReplyDTO> replyList = bsvc.getReplyList(viewBno);
		mav.addObject("replyList",replyList);
		//2. 이동할 페이지 설정
		mav.setViewName("board/boardView");
		
		return mav;	
	}

	
	
	/* 게시글 수정 */
	@RequestMapping(value = "/boardModifyForm")
	public ModelAndView boardModifyForm(int viewBno) {
		ModelAndView mav = new ModelAndView();
		//1. 상세 보기 호출
		BoardDTO board = bsvc.getBoardView(viewBno);
		mav.addObject("board", board);
		mav.setViewName("board/boardModifyForm");
		
		return mav;	
	}
	
	@RequestMapping(value = "/boardModify")
	public ModelAndView boardModify(BoardDTO modBoard, RedirectAttributes ra) throws IllegalStateException, IOException {
		ModelAndView mav = new ModelAndView();
		//2. 글 수정 기능 호출
		int modifyResult = bsvc.boardModify(modBoard);
		if(modifyResult > 0) {
			ra.addFlashAttribute("boardMsg", "글이 수정 되었습니다.");
		} else {
			ra.addFlashAttribute("boardMsg", "글이 수정에 실패하였습니다.");
		}
		mav.setViewName("redirect:/boardView?viewBno="+modBoard.getBno());
		
		return mav;
	}
	
	
	
	/* 게시글 삭제 */
	@RequestMapping(value = "/boardDelete")
	public ModelAndView boardDelete(int delBno) {
		ModelAndView mav = new ModelAndView();
		// 1. 글 삭제 서비스 호출
		int result = bsvc.boardDelete(delBno);
		// 2. 이동할 페이지 설정
		mav.setViewName("redirect:/boardList");
		
		return mav;
	}
	
	
	
	/************ 댓글 ************/
	/* 댓글 작성 */
	@RequestMapping(value = "/replyWrite")
	public ModelAndView replyWrite(ReplyDTO writeReply) {
		ModelAndView mav = new ModelAndView();
		// 1. 댓글 작성 서비스 호출
		int writeResult = bsvc.replyWrite(writeReply);
		// 2. 이동할 페이지 설정
		mav.setViewName("redirect:/boardView?viewBno="+writeReply.getRbno());
		
		return mav;
	}
	
	
	
	/* 댓글 삭제 */
	@RequestMapping(value = "/replyDelete")
	public ModelAndView replyDelete(int delRno, int viewBno) {
		ModelAndView mav = new ModelAndView();
		// 1. 댓글 삭제 서비스 호출
		int result = bsvc.replyDelete(delRno);
		// 2. 이동할 페이지 설정
		mav.setViewName("redirect:/boardView?viewBno="+viewBno);
		
		return mav;
	}
}
