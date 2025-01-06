#날짜 : 2025/01/06
#이름 : 주솔지
#내용 : 2장 SQL 기초

#실습 2-1
use StudyDB;
CREATE TABLE `User1` (
	`uid`	VARCHAR(10),
    `name`  VARCHAR(10),
    `hp`	CHAR(13),
    `age`	INT
    );
 
 DROP TABLE `User1`; 

#실습 2-2
INSERT INTO `User1` VALUES ('A101', '김유신', '010-1234-1111', 25);
INSERT INTO `User1` VALUES ('A102', '김춘추', '010-1234-2222', 23);
INSERT INTO `User1` VALUES ('A103', '장보고', '010-1234-3333', 32);
INSERT INTO `User1` (`uid`, `name`, `age`) VALUES ('A104', '강감찬', 45);
INSERT INTO `User1` SET `uid`='A105', `name`='이순신', `hp`='010-1234-5555';

#실습 2-3
SELECT * FROM ``;
SELECT * FROM `` WHERE ``='';
SELECT * FROM `` WHERE ``='';
SELECT * FROM `` WHERE `` <  ;
SELECT * FROM `` WHERE `` >=  ;
SELECT ``, ``, `` FROM ``;
#실습 2-4
#실습 2-5