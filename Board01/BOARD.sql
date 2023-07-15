create table tbl_board(
    bno number generated always as identity, --글번호(PK)
    btitle nvarchar2(50) not null,  --글제목
    bwriter nvarchar2(20),          --글작성자
    bcontent nvarchar2(2000),       --글내용
    bdate date,                     --글작성일(SYSDATE)
    bcount number default 0,        --글조회수(초기값 0)
    primary key(bno)
);

insert into tbl_board(btitle, bwriter, bcontent, bdate) values('테스트 제목1', '테스트 작성자1', '테스트 내용1', sysdate);
insert into tbl_board(btitle, bwriter, bcontent, bdate) values('테스트 제목2', '테스트 작성자2', '테스트 내용2', sysdate);
insert into tbl_board(btitle, bwriter, bcontent, bdate) values('테스트 제목3', '테스트 작성자3', '테스트 내용3', sysdate);

select * from tbl_board;

commit;


create table tbl_reply(
    rno number generated always as identity, -- 댓글 번호(PK)
    rbno number,                -- 원글 번호
    rwriter nvarchar2(20),     -- 댓글 작성자
    rcontent nvarchar2(500),  -- 댓글 내용
    rdate date,                -- 댓글 작성일(SYSDATE)
    primary key(rno),
    constraint fk_rbno foreign key(rbno) references tbl_board(bno)
);

insert into tbl_reply(rbno, rwriter, rcontent, rdate) values(1, '댓글 테스트1', '댓글 테스트1', sysdate);
insert into tbl_reply(rbno, rwriter, rcontent, rdate) values(1, '댓글 테스트2', '댓글 테스트2', sysdate);

select * from tbl_reply;

commit;