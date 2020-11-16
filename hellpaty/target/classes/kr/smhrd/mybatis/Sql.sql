DROP TABLE company cascade constraints;
--사용기업 테이블
CREATE TABLE company
(code varchar2(10) not null, --회사별 구분 코드
company_name varchar2(100) not null, --회사이름
constraints company_code_pk primary key(code)
);
---------------------------------------------------------------
DROP TABLE manager cascade constraints;
--해당 서비스 관리자 테이블
CREATE TABLE manager

(mngid varchar2(20) not null, --관리자 아이디
mngpw varchar2(20) not null,  --관리자 비밀번호
constraints manager_id_pk primary key(mngid)
);
---------------------------------------------------------------
DROP TABLE companyUser cascade constraints;
--해당 서비스 사용자 테이블
CREATE TABLE companyUser
(cpuid varchar2(20) not null, --사용자 아이디
cpupw varchar2(20) not null,  --사용자 비밀번호
code varchar2(10) not null,   --사용자 기업 코드
constraints companyUser_id_pk primary key(cpuid),
constraints companyUser_code_fk foreign key(code) references company(code)
);
---------------------------------------------------------------
DROP TABLE characters cascade constraints;
--성향테이블
CREATE TABLE characters
(char_id varchar2(10) not null, --성향 고유번호
charimg_1 varchar2(1000) not null,  --1번성향 설명이미지
charimg_2 varchar2(1000) not null,  --2번성향 설명이미지
charimg_3 varchar2(1000) not null,  --3번성향 설명이미지
charimg_4 varchar2(1000) not null,  --4번성향 설명이미지
charimg_5 varchar2(1000) not null,  --5번성향 설명이미지
charimg_6 varchar2(1000) not null,  --6번성향 설명이미지
charimg_7 varchar2(1000) not null,  --7번성향 설명이미지
charimg_8 varchar2(1000) not null,  --8번성향 설명이미지
charimg_9 varchar2(1000) not null,  --9번성향 설명이미지
constraints characters_char_id_pk primary key(char_id)
);
---------------------------------------------------------------
DROP TABLE employees cascade constraints;
drop sequence employees_seq;
CREATE SEQUENCE  employees_seq MINVALUE 1 MAXVALUE 10000 INCREMENT BY 1 START WITH 1 ;
-- 해당 기업 현직자 테이블
CREATE TABLE employees
(enumber number not null,              --현직자 고유번호
duty varchar2(30) not null,            --현직자 직무
name varchar2(20) not null,            --현직자 이름
sex varchar2(10) not null,             --현직자 성별
handwriting_e varchar2(1000) not null, --현직자 필체이미지
char_1 number not null,                --현직자 1번성향 점수
char_2 number not null,                --현직자 2번성향 점수
char_3 number not null,                --현직자 3번성향 점수
char_4 number not null,                --현직자 4번성향 점수
char_5 number not null,                --현직자 5번성향 점수
char_6 number not null,                --현직자 6번성향 점수
char_7 number not null,                --현직자 7번성향 점수
char_8 number not null,                --현직자 8번성향 점수
char_9 number not null,                --현직자 9번성향 점수
code varchar2(10) not null,            --현직자 기업 코드
char_id varchar2(10) not null,               --성향 고유번호
constraints employees_enumber_pk primary key(enumber),
constraints employees_code_fk foreign key(code) references company(code),
constraints employees_char_id_fk foreign key(char_id) references characters(char_id)
);
---------------------------------------------------------------
DROP TABLE candidates cascade constraints;
drop sequence candidates_seq;
CREATE SEQUENCE candidates_seq MINVALUE 1 MAXVALUE 10000 INCREMENT BY 1 START WITH 1 ;
--해당 기업 지원자 테이블
CREATE TABLE candidates
(cnumber number not null,    --지원자 고유번호
name varchar2(20) not null,  --지원자 이름
sex varchar2(5) not null,    --지원자 성별
handwriting_c varchar2(1000), --지원자 필체이미지
code varchar2(10) not null,  --지원한 기업 코드
constraints candidates_cnumber_pk primary key(cnumber),
constraints candidates_code_fk foreign key(code) references company(code)
);
---------------------------------------------------------------
DROP TABLE result cascade constraints;
--유사도분석 결과 테이블
CREATE TABLE result
(
cnumber number not null,         --지원자 고유번호
dutySimilarity1 number not null, --직무별결과1
dutySimilarity2 number not null, --직무별결과2
dutySimilarity3 number not null, --직무별결과3
dutySimilarity4 number not null, --직무별결과4
dutySimilarity5 number not null, --직무별결과5
dutySimilarity6 number not null, --직무별결과6
dutySimilarity7 number not null, --직무별결과7
enumber number not null,         --현직자 고유번호 : 성향점수가 필요
code varchar2(10) not null,            --기업 코드
constraints result_cnumber_pk primary key(cnumber),
constraints result_cnumber_fk foreign key(cnumber) references candidates(cnumber),
constraints result_enumber_fk foreign key(enumber) references employees(enumber),
constraints result_code_fk foreign key(code) references company(code)
);

commit

select * from company;
select * from employees;
select * from manager;
select * from companyUser;
select * from characters;
select * from candidates;
select * from result;


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