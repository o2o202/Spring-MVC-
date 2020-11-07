DROP table sy_user;
drop sequence sy_user;
create sequence sy_users;
create table sy_user(
	sy_user_no number primary key,
	sy_user_id varchar2(1000) not null unique,
	sy_user_pw varchar2(1000) not null,
	sy_user_name varchar2(1000) not null,
	sy_user_phone varchar2(1000) not null unique
);

select * from sy_user;
insert into sy_user values(sy_users.NEXTVAL,'user','123','±è¼Ò¿¬','010-2222-2222');
