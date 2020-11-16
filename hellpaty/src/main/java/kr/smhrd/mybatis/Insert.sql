insert into company values('test1','testcom1');
insert into company values('test2','testcom2');

insert into characters values('char_id','image1','image2','image3','image4','image5','image6','image7','image8','image9');

insert into employees values(employees_seq.nextval,'개발','sungwo','남','sungwo',30,28,32,35,43,20,25,31,43,'test1','char_id');
insert into employees values(employees_seq.nextval,'기획','hansung','여','hansung',20,18,22,25,33,15,15,21,33,'test1','char_id');
insert into employees values(employees_seq.nextval,'디자인','huyngjun','남','huyngjun',40,38,42,45,33,30,35,41,18,'test2','char_id');
insert into employees values(employees_seq.nextval,'개발','jungwook','여','jungwook',25,15,45,25,35,35,40,21,23,'test2','char_id');

insert into companyUser values('testid1',1234,'test1');
insert into companyUser values('testid2',1234,'test2');

commit

insert into managers values('testid',1234);

select * from company
select * from EMPLOYEES