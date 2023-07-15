create table tbl_board(
    bno number generated always as identity, --�۹�ȣ(PK)
    btitle nvarchar2(50) not null,  --������
    bwriter nvarchar2(20),          --���ۼ���
    bcontent nvarchar2(2000),       --�۳���
    bdate date,                     --���ۼ���(SYSDATE)
    bcount number default 0,        --����ȸ��(�ʱⰪ 0)
    primary key(bno)
);

insert into tbl_board(btitle, bwriter, bcontent, bdate) values('�׽�Ʈ ����1', '�׽�Ʈ �ۼ���1', '�׽�Ʈ ����1', sysdate);
insert into tbl_board(btitle, bwriter, bcontent, bdate) values('�׽�Ʈ ����2', '�׽�Ʈ �ۼ���2', '�׽�Ʈ ����2', sysdate);
insert into tbl_board(btitle, bwriter, bcontent, bdate) values('�׽�Ʈ ����3', '�׽�Ʈ �ۼ���3', '�׽�Ʈ ����3', sysdate);

select * from tbl_board;

commit;


create table tbl_reply(
    rno number generated always as identity, -- ��� ��ȣ(PK)
    rbno number,                -- ���� ��ȣ
    rwriter nvarchar2(20),     -- ��� �ۼ���
    rcontent nvarchar2(500),  -- ��� ����
    rdate date,                -- ��� �ۼ���(SYSDATE)
    primary key(rno),
    constraint fk_rbno foreign key(rbno) references tbl_board(bno)
);

insert into tbl_reply(rbno, rwriter, rcontent, rdate) values(1, '��� �׽�Ʈ1', '��� �׽�Ʈ1', sysdate);
insert into tbl_reply(rbno, rwriter, rcontent, rdate) values(1, '��� �׽�Ʈ2', '��� �׽�Ʈ2', sysdate);

select * from tbl_reply;

commit;