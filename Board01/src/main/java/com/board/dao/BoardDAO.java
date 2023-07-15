package com.board.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.board.dto.BoardDTO;
import com.board.dto.ReplyDTO;

public interface BoardDAO {

	/********** 게시글 **********/
	// 게시글 조회
	@Select("select * from tbl_board order by bno desc")
	ArrayList<BoardDTO> selectBoardList();

	// 게시글 작성
	@Insert("insert into tbl_board(btitle, bwriter, bcontent, bdate) "
		  + "values(#{btitle}, #{bwriter}, #{bcontent}, sysdate)")
	int insertBoard(BoardDTO writeBoard);
	
	// 게시글 상세보기
	@Select("select * from tbl_board where bno = #{viewBno}")
	BoardDTO selectBoardView(int viewBno);
	
	// 게시글 수정
	@Update("update tbl_board set btitle = #{btitle}, bcontent = #{bcontent}, bwriter = #{bwriter} where bno = #{bno}")
	int updateBoard(BoardDTO modBoard);
	
	// 게시글 삭제
	@Delete("delete from tbl_board where bno = #{delBno}")
	int deleteBoard(int delBno);
	
	// 조회수 증가
	@Update("update tbl_board set bcount = bcount + 1 where bno = #{viewBno}")
	void updateBoardCount(int viewNumber);
	
	
	/********** 댓글 **********/
	// 댓글 조회
	@Select("select * from tbl_reply where rbno = #{viewBno} order by rno desc")
	ArrayList<ReplyDTO> selectReplyList(int viewBno);
	
	// 댓글 작성
	@Insert("insert into tbl_reply(rno, rbno, rwriter, rcontent, rdate) "
		  + "values( #{rno}, #{rbno}, #{rwriter}, #{rcontent}, SYSDATE ) ")
	int insertReply(ReplyDTO writeReply);
	
	// 댓글 삭제
	@Delete("delete from tbl_reply where rno = #{delBno}")
	int deleteReply(int delRno);
	
}
