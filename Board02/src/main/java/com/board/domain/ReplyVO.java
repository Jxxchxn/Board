package com.board.domain;

import java.util.Date;

public class ReplyVO {

	private int rno;
	private int bno;
	private String rwriter;
	private String rcontent;
	private Date rdate;
	
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
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
	public Date getRdate() {
		return rdate;
	}
	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}


//		    rno int not null auto_increment,
//		    bno int not null,
//		    rwriter varchar(30) not null,
//		    rcontent text not null,
//		    rdate timestamp not null default now(),
//		    primary key(rno, bno),
//		    foreign key(bno) REFERENCES tbl_board(bno)

}
