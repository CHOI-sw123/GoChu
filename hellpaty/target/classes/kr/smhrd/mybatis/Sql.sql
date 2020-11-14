select * from all_objects where object_type = 'TABLE'

DROP TABLE company cascade constraints;

CREATE TABLE company
(code varchar2(10) not null,
company_name varchar2(100) not null,
constraints company_code_pk primary key(code)
);

DROP TABLE employees cascade constraints;
drop sequence employees_seq;
CREATE SEQUENCE  employees_seq MINVALUE 1 MAXVALUE 10000 INCREMENT BY 1 START WITH 1 ;

CREATE TABLE employees
(enumber number not null,
dept_name varchar2(100) not null,
name varchar2(32) not null,
sex varchar2(10) not null,
entry_date varchar2(100) not null,
code varchar2(10) not null,
constraints employees_enumber_pk primary key(enumber),
constraints employees_code_fk foreign key(code) references company(code)
);

select * from employees
delete from employees

DROP TABLE companyUser cascade constraints;
--enumber number not null,--

CREATE TABLE companyUser
(cpuid varchar2(20) not null,
cpupw varchar2(20) not null,
code varchar2(20) not null,
constraints companyUser_id_pk primary key(cpuid),
constraints companyUser_code_fk foreign key(code) references company(code)
);

select * from companyUser

DROP TABLE manager cascade constraints;

CREATE TABLE manager
(mngid varchar2(20) not null,
mngpw varchar2(20) not null,
constraints manager_id_pk primary key(mngid)
);

DROP TABLE candidates cascade constraints;
drop sequence candidates_seq;
CREATE SEQUENCE  candidates_seq MINVALUE 1 MAXVALUE 10000 INCREMENT BY 1 START WITH 1 ;

CREATE TABLE candidates
(cnumber number not null,
name varchar2(20) not null,
sex varchar2(5) not null,
--handwriting_c varchar2(100),
apply_date varchar2(100) not null,
code varchar2(10) not null,
constraints candidates_cnumber_pk primary key(cnumber),
constraints candidates_code_fk foreign key(code) references company(code)
);

select * from candidates

DROP TABLE characters cascade constraints;

CREATE TABLE characters
(enumber varchar2(20) not null,
performance varchar2(10) not null,
handwriting_e varchar2(100) not null,
mci_a number(10) not null,
mci_b number(10) not null,
mci_c number(10) not null,
mci_d number(10) not null,
mci_e number(10) not null,
mci_f number(10) not null,
constraints characters_enumber_fk foreign key(enumber) references employees(enumber),
constraints characters_enumber_pk primary key(enumber)
);

DROP TABLE result cascade constraints;

CREATE TABLE result
(
cnumber varchar(20) not null,
similarity varchar(20) not null,
constraints result_cnumber_pk primary key(cnumber),
constraints result_cnumber_fk foreign key(cnumber) references candidate(cnumber)
);


-- 연습해본거
--SELECT enumber,dept_name,name,sex, entry_date
--		FROM (SELECT * FROM employees ORDER BY enumber DESC) a
--		WHERE rownum BETWEEN 1 AND 3
--		
--
--  SELECT *
--		FROM (SELECT rownum as rnum, e.* FROM employees e ORDER BY enumber DESC) a
--		WHERE rnum BETWEEN 11 AND 20
--		ORDER BY enumber DESC
				
--				select * 
--from (select ROWNUM as rnum, e.* 
--from (select * from employees order by ROWNUM desc) e)
--where rnum BETWEEN 1 AND 3
--						SELECT COUNT(enumber)
--		   FROM employees
--		   WHERE enumber > 0
				
commit