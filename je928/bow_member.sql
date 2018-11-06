create table bow_member (
	m_no number primary key,
	m_email varchar2(50) not null unique,
	m_passwd varchar2(30) not null,
	m_nick varchar2(30) not null unique,
	m_reg_date date default sysdate,
	m_out_date date,
	m_del_yn char(1) default 'n'
);

select * from bow_member;

drop table bow_member;