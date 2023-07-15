package com.board.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.board.dao.BoardDAO;
import com.board.dto.BoardDTO;
import com.board.dto.ReplyDTO;

@Service
public class BoardService {

	@Autowired
	private BoardDAO bdao;
	
	@Autowired
	private ServletContext context;
	
	/************* 게시글 *************/
	// 게시글 조회
	public ArrayList<BoardDTO> getBoardList() {
		ArrayList<BoardDTO> boardList = bdao.selectBoardList();
		
		return boardList;
	}
	
	// 게시글 등록
	public int boardWrite(BoardDTO writeBoard) throws IllegalStateException, IOException {	
		int insertResult = 0;
		try {
			insertResult = bdao.insertBoard(writeBoard);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return insertResult;
	}
	
	// 상세 보기
	public BoardDTO getBoardView(int viewBno) {
		// 1. 조회수 증가
		bdao.updateBoardCount(viewBno);
		// 2. 상세 보기
		BoardDTO board = bdao.selectBoardView(viewBno);
		
		return board;
	}

	// 게시글 수정
	public int boardModify(BoardDTO modBoard) {
		int updateResult = 0;
		try {
			updateResult = bdao.updateBoard(modBoard);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return updateResult;
	}
	
	// 게시글 삭제
	public int boardDelete(int delBno) {
		int deleteResult = bdao.deleteBoard(delBno);
		
		return deleteResult;
	}
	
	
	/************* 댓글 *************/
	// 댓글 조회
	public ArrayList<ReplyDTO> getReplyList(int viewBno) {
		ArrayList<ReplyDTO> replyList = bdao.selectReplyList(viewBno);
		
		return replyList;
	}
	
	// 댓글 작성
	public int replyWrite(ReplyDTO writeReply) {
		int insertResult = 0;
		try {
			insertResult = bdao.insertReply(writeReply);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return insertResult;
	}
	
	// 댓글 삭제
	public int replyDelete(int delRno) {
		int deleteResult = bdao.deleteReply(delRno);
		return deleteResult;
	}
	
}
