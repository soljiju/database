#날짜 : 2025/01/15
#이름 : 주솔지
#내용 : SQL 연습문제3

#실습3-1
create database `College`;
create user 'college'@'%' identified by '1234';
grant all privileges on `college`.* to 'college'@'%';
flush privileges;

use college;

#실습 3-2
create table `Student`(
	`stdNo`		char(8) primary key,
    `stdName`	varchar(20) not null,
    `stdHp`		char(13) unique not null,
    `stdYear`	int not null,
    `stdAddress`varchar(100) default NULL
    );
create table `Lecture`(
	`lecNo`		int primary key,
    `lecName`	varchar(20) not null,
    `lecCredit` int not null,
    `lecTime`	int not null,
    `lecClass`	varchar(10) default null
    );


create table `Register`(
	`regStdNo`		char(8) not null,
    `reglecNo`		int not null,
    `regMidScore`	int default NULL,
    `regFinalScore`	int	default NULL,
    `regTotalScore`	int default NULL,
    `regGrade`		char(1) default NULL
    );
#실습 3-3
insert into `Student` value ('20201016', '김유신', '010-1234-1001', 3, null);
insert into `Student` value ('20201126', '김춘추', '010-1234-1002', 3, '경상남도 경주시');
insert into `Student` value ('20210216', '장보고', '010-1234-1003', 2, '전라남도 완도시');
insert into `Student` value ('20210326', '강감찬', '010-1234-1004', 2, '서울시 영등포구');
insert into `Student` value ('20220416', '이순신', '010-1234-1005', 1, '부산시 부산진구');
insert into `Student` value ('20220521', '송상현', '010-1234-1006', 1, '부산시 동래구');

insert into `Lecture` value ( 159, '인지행동심리학', 3, 40, '본304');
insert into `Lecture` value ( 167, '운영체제론', 3, 25, '본B05');
insert into `Lecture` value ( 234, '중급 영문법', 3, 20, '본201');
insert into `Lecture` value ( 239, '세법개론', 3, 40, '본204');
insert into `Lecture` value ( 248, '빅데이터 개론', 3, 20, '본B01');
insert into `Lecture` value ( 253, '컴퓨팅사고와 코딩', 2, 10, '본B02');
insert into `Lecture` value ( 349, '사회복지 마케팅', 2, 50, '본301');

INSERT INTO `Register` (`regStdNo`, `reglecNo`) VALUES ( '20201126', 234);
INSERT INTO `Register` (`regStdNo`, `reglecNo`) VALUES ( '20201016', 248);
INSERT INTO `Register` (`regStdNo`, `reglecNo`) VALUES ( '20201016', 253);
INSERT INTO `Register` (`regStdNo`, `reglecNo`) VALUES ( '20201126', 239);
INSERT INTO `Register` (`regStdNo`, `reglecNo`) VALUES ( '20210216', 349);
INSERT INTO `Register` (`regStdNo`, `reglecNo`) VALUES ( '20210326', 349);
INSERT INTO `Register` (`regStdNo`, `reglecNo`) VALUES ( '20201016', 167);
INSERT INTO `Register` (`regStdNo`, `reglecNo`) VALUES ( '20220416', 349);


#실습 3-4

select * from `Lecture`;
#실습 3-5
select * from `Student`;
#실습 3-6
select * from `Register`;
#실습 3-7
select * from `Student` where `stdYear` = 3;
#실습 3-8
select * from `Lecture` where `lecCredit` = 2;
#실습 3-9
UPDATE `Register` SET `regMidScore` = 36, `regFinalScore` = 42 WHERE `regStdNo`='20201126' and `regLecNo`=234;
UPDATE `Register` SET `regMidScore` = 24, `regFinalScore` = 62 WHERE `regStdNo`='20201016' and `regLecNo`=248;
UPDATE `Register` SET `regMidScore` = 28, `regFinalScore` = 40 WHERE `regStdNo`='20201016' and `regLecNo`=253;
UPDATE `Register` SET `regMidScore` = 37, `regFinalScore` = 57 WHERE `regStdNo`='20201126' and `regLecNo`=239;
UPDATE `Register` SET `regMidScore` = 28, `regFinalScore` = 68 WHERE `regStdNo`='20210216' and `regLecNo`=349;
UPDATE `Register` SET `regMidScore` = 16, `regFinalScore` = 65 WHERE `regStdNo`='20210326' and `regLecNo`=349;
UPDATE `Register` SET `regMidScore` = 18, `regFinalScore` = 38 WHERE `regStdNo`='20201016' and `regLecNo`=167;
UPDATE `Register` SET `regMidScore` = 25, `regFinalScore` = 58 WHERE `regStdNo`='20220416' and `regLecNo`=349;
select * from `Register`;
#실습 3-10
UPDATE `Register` SET `regTotalScore`= `regMidScore` + `regFinalScore`,
        `regGrade` = if(`regTotalScore` >= 90, 'A',
					 if(`regTotalScore` >= 80, 'B',
                     if(`regTotalScore` >= 70, 'C',
                     if(`regTotalScore` >= 60, 'D', 'F'))));
                     

#실습 3-11
select * from `Register` order by `regTotalScore` desc;

#실습 3-12
select * from `Register` where `regLecNo` = 349 order by `regTotalScore` desc;

#실습 3-13
select * from `Lecture` where `lecTime` >= 30 ;
#실습 3-14
select `lecName`, `lecClass` from `Lecture`;
#실습 3-15
select `stdNo`, `stdName` from `Student`; 
#실습 3-16
select * from `Student` where `stdAddress` is null;
#실습 3-17
select * from `Student` where `stdAddress` like '부산%';
#실습 3-18
select * from `Student` AS a 
left join `Register` as b on
 a.stdNo = b.regStdNo;
#실습 3-19
select
	a.`stdNo`, 
    a.`StdName`,
    b.`regLecNo`,
    b.`regMidScore`,
    b.`regFinalScore`,
    b.`regTotalScore`,
    b.`regGrade`
    from `Student` as a, `Register` as b where a.stdNo = b.regStdNo;

#실습 3-20
select `stdName`, `stdNo`, `regLecNo`
from `Student` AS a
join `register` as b
on a.stdNo=b.regStdNo
where `regLecNo` = 349;
#실습 3-21
SELECT
	`stdNo`,
	`stdName`,
	COUNT(`stdNo`) AS `수강신청 건수`,
	SUM(`regTotalScore`) AS `종합점수`,
	SUM(`regTotalScore`) / COUNT(`stdNo`) AS `평균`
FROM `Student` AS a
JOIN `Register` AS b
ON a.stdNo = b.regStdNo
group by `stdNo`
order by `stdNo`;

#실습 3-22
select * from `Register` as a
join `Lecture` as b
on a.regLecNo = b.lecNo;

#실습 3-23
SELECT
	`regStdNo`,
	`regLecNo`,
	`lecName`,
	`regMidScore`,
	`regFinalScore`,
	`regTotalScore`,
	`regGrade`
FROM `Register` as a
join `lecture` as b
on a.regLecNo = b.lecNo;

#실습 3-24
select 
	count(*) as `사회복지 마케팅 수강 신청건수`,
    avg(`regTotalScore`) as `사회복지 마케팅 평균`
from `Register` as a 
join `Lecture` as b 
on a.regLecNo = b.lecNo
where `lecName` = '사회복지 마케팅';



#실습 3-25
select 
	`regStdNo`,
    `lecName`
from `Register` as a join `lecture` as b 
on  a.regLecNo = b.lecNo
where `regGrade` = 'A';



#실습 3-26
select * from `Student` as a 
join `Register` as b on a.stdNo = b.regStdNo
join `Lecture` as c on b.regLecNo = c.lecNo;



#실습 3-27
select
	`stdNo`,
	`stdName`,
	`lecNo`,
    `lecName`,
	`regMidScore`,
	`regFinalScore`,
	`regTotalScore`,
	`regGrade`
from `Student` as a
join `Register` as b on a.stdNo = b.regStdNo
join `Lecture` as c on b.regLecNo = c.lecNo;

;
#실습 3-28
select
	`stdNo`,
	`stdName`,
	`lecName`,
	`regTotalScore`,
	`regGrade`
from `Student` as a
join `Register` as b on a.stdNo = b.regStdNo
join `Lecture` as c on b.regLecNo = c.lecNo
where `regGrade`='F';

#실습 3-29
select
	`stdNo`,
    `stdName`,
    SUM(`lecCredit`) as `이수학점`
FROM `Student` as a
join `Register` as b on a.stdNo = b.regStdNo
join `Lecture` as c on b.regLecNo = c.lecNo
where `regGrade` < 'F'
group by`stdNo`;
;
#실습 3-30
select
	`stdNo`,
	`stdName`,
	group_concat(`lecName`) as `신청과목`,
	group_concat(if(`regTotalScore` >=60, `lecName`, null)) as `이수과목`
from `Student` as a
join `Register` as b on a.stdNo = b.regStdNo
join `Lecture` as c on b.regLecNo = c.lecNo
group by`stdNo`;

;