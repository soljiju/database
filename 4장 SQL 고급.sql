#날짜 : 2025/01/08
#이름 : 주솔지
#내용 : 4장 SQL 고급 

#실습 4-1
create table `Member` (
	`uid`	varchar(10) primary key,
    `name`	varchar(10) not null,
    `hp`	varchar(13) unique not null,
    `pos`	varchar(10) default '사원',
    `dep`	int,
    `rdate`	datetime not null
);

create table `Department` (
	`depNo` int primary key,
    `name`	varchar(10) not null,
    `tel`	char(12) not null
);

create table `Sales` (
	`seq` 	int auto_increment primary key,
    `uid`	varchar(10) not null,
    `year`	year not null,
    `month` tinyint not null,
    `sale`	int
);

insert into `Member` values ('a101', '박혁거세', '010-1234-1001', '부장', 101, now());
insert into `Member` values ('a102', '김유신', '010-1234-1002', '차장', 101, now());
insert into `Member` values ('a103', '김춘추', '010-1234-1003', '사원', 101, now());
insert into `Member` values ('a104', '장보고', '010-1234-1004', '대리', 102, now());
insert into `Member` values ('a105', '강감찬', '010-1234-1005', '과장', 102, now());
insert into `Member` values ('a106', '이성계', '010-1234-1006', '차장', 103, now());
insert into `Member` values ('a107', '정철', '010-1234-1007', '차장', 103, now());
insert into `Member` values ('a108', '이순신', '010-1234-1008', '부장', 104, now());
insert into `Member` values ('a109', '허균', '010-1234-1009', '부장', 104, now());
insert into `Member` values ('a110', '정약용', '010-1234-1010', '사원', 105, now());
insert into `Member` values ('a110', '박지원', '010-1234-1011', '사원', 105, now());

insert into `Department` values(101, '영업1부', '051-512-1001');
insert into `Department` values(102, '영업2부', '051-512-1002');
insert into `Department` values(103, '영업3부', '051-512-1003');
insert into `Department` values(104, '영업4부', '051-512-1004');
insert into `Department` values(105, '영업5부', '051-512-1005');
insert into `Department` values(106, '영업지원부', '051-512-1006');
insert into `Department` values(107, '인사부', '051-512-1007');


insert into `sales` (`uid`, `year`, `month`, `sales`) values ('a101', 2018, 1, 98100);
insert into `sales` (`uid`, `year`, `month`, `sales`) values ('a102', 2018, 1, 136000);
insert into `sales` (`uid`, `year`, `month`, `sales`) values ('a103', 2018, 1, 80100);
insert into `sales` (`uid`, `year`, `month`, `sales`) values ('a104', 2018, 1, 78000);
insert into `sales` (`uid`, `year`, `month`, `sales`) values ('a105', 2018, 1, 93000);

insert into `sales` (`uid`, `year`, `month`, `sales`) values ('a101', 2018, 1, 23500);
insert into `sales` (`uid`, `year`, `month`, `sales`) values ('a102', 2018, 1, 126000);
insert into `sales` (`uid`, `year`, `month`, `sales`) values ('a103', 2018, 1, 18500);
insert into `sales` (`uid`, `year`, `month`, `sales`) values ('a105', 2018, 1, 19000);
insert into `sales` (`uid`, `year`, `month`, `sales`) values ('a106', 2018, 1, 53000);

insert into `sales` (`uid`, `year`, `month`, `sales`) values ('a101', 2019, 1, 24000);
insert into `sales` (`uid`, `year`, `month`, `sales`) values ('a102', 2019, 1, 109000);
insert into `sales` (`uid`, `year`, `month`, `sales`) values ('a103', 2019, 1, 101000);
insert into `sales` (`uid`, `year`, `month`, `sales`) values ('a104', 2019, 1, 53500);
insert into `sales` (`uid`, `year`, `month`, `sales`) values ('a107', 2019, 1, 24000);

insert into `sales` (`uid`, `year`, `month`, `sales`) values ('a102', 2019, 1, 160000);
insert into `sales` (`uid`, `year`, `month`, `sales`) values ('a103', 2019, 1, 101000);
insert into `sales` (`uid`, `year`, `month`, `sales`) values ('a104', 2019, 1, 43000);
insert into `sales` (`uid`, `year`, `month`, `sales`) values ('a105', 2019, 1, 24000);
insert into `sales` (`uid`, `year`, `month`, `sales`) values ('a106', 2019, 1, 109000);


insert into `sales` (`uid`, `year`, `month`, `sales`) values ('a102', 2020, 1, 201000);
insert into `sales` (`uid`, `year`, `month`, `sales`) values ('a104', 2020, 1, 63000);
insert into `sales` (`uid`, `year`, `month`, `sales`) values ('a105', 2020, 1, 74000);
insert into `sales` (`uid`, `year`, `month`, `sales`) values ('a106', 2020, 1, 122000);
insert into `sales` (`uid`, `year`, `month`, `sales`) values ('a107', 2020, 1, 111000);

insert into `sales` (`uid`, `year`, `month`, `sales`) values ('a102', 2020, 1, 120000);
insert into `sales` (`uid`, `year`, `month`, `sales`) values ('a103', 2020, 1, 93000);
insert into `sales` (`uid`, `year`, `month`, `sales`) values ('a104', 2020, 1, 84000);
insert into `sales` (`uid`, `year`, `month`, `sales`) values ('a105', 2020, 1, 180000);
insert into `sales` (`uid`, `year`, `month`, `sales`) values ('a108', 2020, 1, 76000);

#실습 4-3
select * from `Member` where `name` = '김유신';
select * from `Member` where `pos`='차장' AND dep=101;
select * from `Member` where `pos`='차장' OR dep=101;
select * from `Member` where `name` != '김춘추';
select * from `Member` where `name` <> '김춘추';
select * from `Member` where `pos`='사원' OR `pos`='대리';
select * from `Member` where `pos` IN ('사원', '대리');
select * from `Member` where `dep` IN (101, 102, 103);
select * from `Member` where `name` like '%신';
select * from `Member` where `name` like '김%';
select * from `Member` where `name` like '김__';
select * from `Member` where `name` like '_성_';
select * from `Member` where `name` like '정_';
select * from `Sales` where `Sales` > 50000;
select * from `Sales` where `Sales` >= 50000 AND `sale` < 100000 AND `month`=1;
select * from `Sales` where `Sales` between 50000 AND 100000;
select * from `Sales` where `Sales` NOT BETWEEN 50000 AND 100000;
select * from `Sales` where `year` IN(2020);
select * from `Sales` where `month` IN(1,2);

#실습 4-4
select * from `Sales` order by `sale`;
select * from `Sales` order by `sale` ASC;
select * from `Sales` order by `sale` DESC;
select * from `Member` order by `name`;
select * from `Member` order by `name` DESC;
select * from `Member` order by `rdate` ASC;
select * from `Sales` where `sale` > 50000 ORDER BY `sale` DESC;

#실습4-5
SELECT *FROM Sales LIMIT 3;
SELECT *FROM Sales LIMIT 0, 3;
SELECT *FROM Sales LIMIT 1, 2;
SELECT *FROM Sales LIMIT 5, 3;
SELECT *FROM Sales ORDER BY `sale` DESC LIMIT 3,5;
SELECT *FROM Sales WHERE `sale` < 50000 ORDER BY `SALE DESC LIMIT 3;
SELECT *FROM Sales WHERE `sale` > 50000
ORDER BY `year` DESC, `month`, `sale` DESC
LIMIT 5;

#실습 4-6

#실습 4-7
select sum(`sale`) as `2018 1월 매출 총합 from `Sales` where `year`=2018

#실습 4-8
select
	SUM(`sale`) as `총합`,
    AVG(`sale`) as `평균` 
	from 
		`Sales`
	where
		`year`=2019 and
        `month`=2 and
        `sale` >= 50000;
        
#실습 4-9 
select 
	MIN(`sale`) as `최저`,
    MAX(`sale`) as `최고`

 from 
	`Sales` 
where 
	`year`=2020
 

