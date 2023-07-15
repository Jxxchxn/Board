package com.board.dto;

public class ReplyDTO {

	private int rno;			// 댓글 번호
	private int rbno;			// 원글 번호
	private String rwriter;		// 댓글 작성자
	private String rcontent;	// 댓글 내용
	private String rdate;		// 댓글 작성일
	
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getRbno() {
		return rbno;
	}
	public void setRbno(int rbno) {
		this.rbno = rbno;
	}
	public String getRwriter() {
		return rwriter;
	}
	public void setRwriter(String rwriter) {
		this.rwriter = rwriter;
	}
	public String getRcontent() {
		return rcontent;
	}
	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	@Override
	public String toString() {
		return "ReplyDTO [rno=" + rno + ", rbno=" + rbno + ", rwriter=" + rwriter + ", rcontent=" + rcontent
				+ ", rdate=" + rdate + "]";
	}

}

//rno number generated always as identity,
//rbno number,
//rwriter nvarchar2(20),
//rcontent nvarchar2(500),
//rdate date,