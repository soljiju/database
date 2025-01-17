#날짜 : 2025/01/17
#이름 : 주솔지
#내용 : SQL 연습문제 5

#실습 5-1
create database `BookStore`;
create user 'bookstore'@'%' identified by '1234';
grant all privileges on `BookStore`.* TO 'bookstore'@'%';
flush privileges