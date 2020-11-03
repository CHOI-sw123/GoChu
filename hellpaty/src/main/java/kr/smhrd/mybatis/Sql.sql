DROP TABLE company cascade constraints;

CREATE TABLE company
(code varchar2(10) not null,
company_name varchar2(100) not null,
constraints company_code_pk primary key(code)
);

DROP TABLE employees cascade constraints;

CREATE TABLE employees
(enumber varchar2(20) not null,
dept_name varchar2(100) not null,
name varchar2(32) not null,
sex varchar2(5) not null,
entry_date date not null,
code varchar2(10) not null,
constraints employees_enumber_pk primary key(enumber),
constraints employees_code_fk foreign key(code) references company(code)
);

DROP TABLE manager cascade constraints;

CREATE TABLE manager
(id varchar2(20) not null,
pw varchar2(20) not null,
enumber varchar2(20) not null,
code varchar2(20) not null,
constraints manager_id_pk primary key(id),
constraints manager_enumber_fk foreign key(enumber) references employees(enumber),
constraints manager_code_fk foreign key(code) references company(code)
);

DROP TABLE candidates cascade constraints;

CREATE TABLE candidates
(cnumber varchar2(20) not null,
name varchar2(20) not null,
sex varchar2(5) not null,
handwriting_c varchar2(100) not null,
apply_date date not null,
code varchar2(10) not null,
constraints candidates_cnumber_pk primary key(cnumber),
constraints candidates_code_fk foreign key(code) references company(code)
);

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