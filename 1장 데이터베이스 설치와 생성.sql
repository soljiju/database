##날짜 : 2025/01/06
#이름 : 주솔지
#내용 : 1장 데이터베이스 설치와 생성 

#실습 1-1
CREATE DATABASE `StudyDB`;
DROP DATABASE `StudyDB`;

#실습 1-2
CREATE USER 'soljiju'@'%' identified by '1234';
GRANT ALL privileges on StudyDB.* to 'soljiju'@'%'
flush privileges;

#실습 1-3
alter USER 'soljiju'@'%' identified by ""
drop user 'soljiju'@'%';
flush privileges;