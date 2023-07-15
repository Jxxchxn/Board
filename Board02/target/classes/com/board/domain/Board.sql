create table tbl_board(
	bno int not null auto_increment,
	btitle varchar(50) not null,
	bcontent text not null,
	bwriter varchar(50) not null,
	bdate timestamp default now(),
	bcount int default 0,
	primary key(bno)
);


	insert into tbl_board(btitle, bcontent, bwriter)
  	values('테스트 제목1', '테스트 내용1', '작성자1');

	insert into tbl_board(btitle, bcontent, bwriter)
	values('테스트 제목2', '테스트 내용2', '작성자2');

	insert into tbl_board(btitle, bcontent, bwriter)
	values('테스트 제목3', '테스트 내용3', '작성자3');

	insert into tbl_board(btitle, bcontent, bwriter)
  	values('테스트 제목4', '테스트 내용4', '작성자4');

  	drop table tbl_board;
  	
	select * from tbl_board;

	select count(bno) from tbl_board;
	
	insert into tbl_board(btitle, bcontent, bwriter)
	select btitle, bcontent, bwriter from tbl_board;
	
	select bno, btitle, bwriter, bdate, bcount
	from tbl_board
	order by bno desc
	limit 20, 10
	
	select bno, btitle, bcontent, bwriter, bdate, bcount
	from tbl_board
	where btitle like '%테스트%'
	or bcontent like '%test%'
	
create table tbl_reply (
    rno int not null auto_increment,
    bno int not null,
    rwriter varchar(30) not null,
    rcontent text not null,
    rdate timestamp not null default now(),
    primary key(rno, bno),
    foreign key(bno) REFERENCES tbl_board(bno)
);

commit;

	insert into tbl_reply(bno,rwriter, rcontent, rdate)
  	values(1, '댓글 작성자1', '댓글 내용1', sysdate());

  	select * from tbl_reply;

