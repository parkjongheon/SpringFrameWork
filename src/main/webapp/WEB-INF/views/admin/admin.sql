show tables;

create table admin2 (
	idx   int not null auto_increment primary key,
	mid  varchar(20) not null,
	pwd  varchar(200) not null,
	adKey int not null
	);

create table adkey2 (
	idx int not null auto_increment primary key,
	keyValue  varchar(200) not null
	);
insert into adkey2 values (default,'6504E3B2');
insert into adkey2 values (default,'379619AA');
insert into adkey2 values (default,'CAC736F');
insert into adkey2 values (default,'5E265BA4');
insert into adkey2 values (default,'156643D4');
insert into adkey2 values (default,'123A439B');
insert into adkey2 values (default,'7DE26DB8');
insert into adkey2 values (default,'1175E2DB');
insert into adkey2 values (default,'36AA7BC2');
insert into adkey2 values (default,'76CCD017');
insert into adkey2 values (default,'182DECDB');
insert into adkey2 values (default,'26F0A63F');
insert into adkey2 values (default,'4361BD48');
insert into adkey2 values (default,'53BD815B');
insert into adkey2 values (default,'2401F4C3');
insert into adkey2 values (default,'7637F22');
insert into adkey2 values (default,'4926097B');
insert into adkey2 values (default,'762EFE5D');
insert into adkey2 values (default,'5D22BBB7');
insert into adkey2 values (default,'41A4555E');
insert into adkey2 values (default,'3830F1C0');
insert into adkey2 values (default,'39ED3C8D');
insert into adkey2 values (default,'71DAC704');
insert into adkey2 values (default,'123772C4');
insert into adkey2 values (default,'2D363FB3');
insert into adkey2 values (default,'7D6F77CC');
insert into adkey2 values (default,'5AAA6D82');
insert into adkey2 values (default,'73A28541');
insert into adkey2 values (default,'6F75E721');
insert into adkey2 values (default,'69222C14');
insert into adkey2 values (default,'606D8ACF');
insert into adkey2 values (default,'782830E');
insert into adkey2 values (default,'470E2030');
insert into adkey2 values (default,'3FB4F649');
insert into adkey2 values (default,'33833882');
insert into adkey2 values (default,'200A570F');
insert into adkey2 values (default,'16B3FC9E');
insert into adkey2 values (default,'E2D56BF');
insert into adkey2 values (default,'244038D0');
insert into adkey2 values (default,'5680A178');
insert into adkey2 values (default,'5FDEF03A');
insert into adkey2 values (default,'3B22CDD0');
insert into adkey2 values (default,'1E81F4DC');
insert into adkey2 values (default,'4D591D15');
insert into adkey2 values (default,'65AE6BA4');
insert into adkey2 values (default,'48CF768C');
insert into adkey2 values (default,'59F95C5D');
insert into adkey2 values (default,'5CCD43C2');
insert into adkey2 values (default,'4AA8F0B4');
insert into adkey2 values (default,'7960847B');
	
drop table adkey2;
select * from adkey2;
	insert into guest2 values (default,'홍길동','hkd1234@naver.com','blog.daum.net/hkd1234',default,'192.168.50.11','방명록 서비스를 시작합니다.');