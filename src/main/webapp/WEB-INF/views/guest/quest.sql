show tables;

create table guest2 (
	idx   int not null auto_increment primary key,
	name  varchar(20) not null,
	email  varchar(60),
	homepage varchar(60),
	vDate datetime default now(),
	hostIp varchar(50) not null,
	content text not null
	);
	
	insert into guest2 values (default,'관리자','cjsk1126@naver.com','blog.daum.net/cjsk1126',default,'192.168.50.20','방명록 서비스를 시작합니다.');
	insert into guest2 values (default,'홍길동','hkd1234@naver.com','blog.daum.net/hkd1234',default,'192.168.50.11','방명록 서비스를 시작합니다.');