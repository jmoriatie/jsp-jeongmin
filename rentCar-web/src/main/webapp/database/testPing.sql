CREATE DATABASE rentcardb04;

USE rentcardb04;

CREATE TABLE rentcar(
	no INT,
    name VARCHAR(20),
    category INT,
    price INT,
    use_people INT,
    company VARCHAR(50),
    img VARCHAR(50),
    info VARCHAR(500)
);
DESC rentcar;

CREATE TABLE member(
	id VARCHAR(20),
    pw1 VARCHAR(20),
    email VARCHAR(50),
    tel VARCHAR(20),
    hobby VARCHAR(60),
    job VARCHAR(15),
    age INT,
    info VARCHAR(50)
);
DESC member; 

CREATE TABLE car_reserve(
	reserve_seq INT,
    no INT,
    id VARCHAR(50),
    qty INT,
    d_day INT,
    r_day VARCHAR(50),
    use_in INT,
    use_wifi INT,
    use_navi INT,
    use_seat INT
);
DESC car_reserve;

create table board(
	no integer primary key auto_increment,
    id varchar(20) not null,
    pw varchar(20) not null,
    title varchar(50) not null,
    content varchar(1000) not null,
    likes int(10) default 0,
    regdate datetime not null,
    comments varchar(200)
);