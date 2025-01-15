#날짜 : 2025/01/13
#이름 : 주솔지
#내용 : SQL 연습문제1

#실습 1-1
create database `Shop`;
create user 'shop'@'%' identified by '1234';
grant all privileges on Shop.* to 'shop'@'%';
flush privileges;

#실습 1-2
CREATE TABLE `Customer`(
	`custid`		VARCHAR(10) PRIMARY KEY,
    `name`			VARCHAR(10) NOT NULL,
    `hp`			CHAR(13)	UNIQUE,
    `addr`			VARCHAR(100)DEFAULT NULL,
    `rdate`			DATE        NOT NULL
    );
    
CREATE TABLE `Product`(
	`prodNo`		int 		PRIMARY KEY,
    `prodName`		VARCHAR(10) NOT NULL,
    `stock`			int 		DEFAULT 0,
    `price`			int			DEFAULT NULL,
    `company`		VARCHAR(20) NOT NULL
    );
    
CREATE TABLE `Order`(
`orderNo`		int AUTO_INCREMENT  PRIMARY KEY,
`orderId`		VARCHAR(10) NOT NULL,
`orderProduct`	int 		NOT NULL,
`orderCount`	int 		DEFAULT 1,
`orderDate`		datetime 	NOT NULL
);
    
#실습 1-3
INSERT INTO `Customer` VALUES ('c101', '김유신', '010-1234-1001', '김해시 봉황동', 2022-01-01);
INSERT INTO `Customer` VALUES ('c102', '김춘추', '010-1234-1002', '경주시 보문동', 2022-01-02);
INSERT INTO `Customer` VALUES ('c103', '장보고', '010-1234-1003', '완도군 청산면', 2022-01-03);
INSERT INTO `Customer` VALUES ('c104', '강감찬', '010-1234-1004', '서울시 마포구', 2022-01-04);
INSERT INTO `Customer` VALUES ('c105', '이성계', null, null, 2022-01-05);
INSERT INTO `Customer` VALUES ('c106', '정철', '010-1234-1006', '경기도 용인시', 2022-01-06);
INSERT INTO `Customer` VALUES ('c107', '허준', null, null, 2022-01-07);
INSERT INTO `Customer` VALUES ('c108', '이순신', '010-1234-1008', '서울시 영등포구', 2022-01-08);
INSERT INTO `Customer` VALUES ('c109', '송상현', '010-1234-1009', '부산시 동래구', 2022-01-09);
INSERT INTO `Customer` VALUES ('c110', '정약용', '010-1234-1010', '경기도 광주시', 2022-01-10);


INSERT INTO `Product` VALUES ('1', '새우깡', '5000', '1500', '농심');
INSERT INTO `Product` VALUES ('2', '초코파이', '2500', '2500', '오리온');
INSERT INTO `Product` VALUES ('3', '포카칩', '3600', '1700', '오리온');
INSERT INTO `Product` VALUES ('4', '양파링', '1250', '1800', '농심');
INSERT INTO `Product` VALUES ('5', '죠리퐁', '2200', null, '크라운');
INSERT INTO `Product` VALUES ('6', '마가렛트', '3500', '3500', '롯데');
INSERT INTO `Product` VALUES ('7', '뿌셔뿌셔', '1650', '1200', '오뚜기');

INSERT INTO `Order` VALUES ('1', 'c102', '3', '2', now());
INSERT INTO `Order` VALUES ('2', 'c101', '4', '1', now());
INSERT INTO `Order` VALUES ('3', 'c108', '1', '1', now());
INSERT INTO `Order` VALUES ('4', 'c109', '6', '5', now());
INSERT INTO `Order` VALUES ('5', 'c102', '2', '1', now());
INSERT INTO `Order` VALUES ('6', 'c101', '7', '3', now());
INSERT INTO `Order` VALUES ('7', 'c110', '1', '2', now());
INSERT INTO `Order` VALUES ('8', 'c104', '2', '4', now());
INSERT INTO `Order` VALUES ('9', 'c102', '1', '3', now());
INSERT INTO `Order` VALUES ('10', 'c107', '6', '1', now());

#실습 1-4 
SELECT * FROM `Customer`

#실습 1-5 
SELECT `custId`, `name`, `hp` FROM `Customer`;

#실습 1-6
SELECT * FROM `Product`;
#실습 1-7
SELECT `company` FROM `Product`;
#실습 1-8
SELECT distinct `company` FROM `Product`;
#실습 1-9
SELECT `prodName`, `price` FROM `Product`
#실습 1-10
SELECT `prodName`, `price` + 500 as `조정단가` FROM `Product`;
#실습 1-11
SELECT `prodName`, `stock`, `price` FROM `Product` WHERE `company` = '오리온'
#실습 1-12
SELECT `orderProduct`, `orderCount`, `orderDate` FROM `Order` where `orderId`='c102'
#실습 1-13
SELECT `orderProduct`, `orderCount`, `orderDate` FROM `Order` where `orderId`='c102'AND `orderCount` >= 2;
#실습 1-14
SELECT * FROM `Product` WHERE `price` >= 1000 and `price` <= 2000;
SELECT * FROM `Product` WHERE `price` between 1000 and `price` <= 2000;
#실습 1-15
SELECT `custid`, `name`, `hp`, `addr` FROM `Customer` where `name` like '김%';
#실습 1-16
SELECT `custid`, `name`, `hp`, `addr` FROM `Customer` where `name` like '__';
#실습 1-17
SELECT * FROM `Customer` WHERE `hp` is null;
#실습 1-18
SELECT * FROM `Customer` WHERE `addr` is not null;
#실습 1-19
SELECT * FROM `Customer` order by `rdate` desc;
#실습 1-20
SELECT * FROM `Order` WHERE `orderCount` >= 3 order by `orderCount` desc, `orderProduct` asc;
#실습 1-21
SELECT AVG(`price`) FROM `Product`;
#실습 1-22
SELECT SUM(`stock`) AS `재고량 합계` FROM `Product` WHERE `company`='농심';
#실습 1-23
SELECT COUNT(*) AS `고객수` FROM `Customer`;
#실습 1-24 중복제거
SELECT COUNT(distinct `company`) AS `제조업체 수` FROM `Product`;
#실습 1-25
SELECT `orderProduct` AS `주문 상품번호`, SUM(`orderCount`) AS `총 주문수량` FROM
`Order` group by `orderProduct` order by `주문 상품번호`;
#실습 1-26
SELECT `company` AS `제조업체`, COUNT(*) AS `제품수`, MAX(`price`) AS `최고가` FROM
`Product` group by `company` order by `제조업체`;
#실습 1-27
SELECT `company` AS `제조업체`, COUNT(*) AS `제품수`, MAX('price') AS `최고가` FROM
`Product` GROUP BY `company` having `제품수` >=2;
#실습 1-28
SELECT * FROM `Order`;
SELECT `orderProduct`, `orderId`, SUM(`orderCount`) AS `총 주문수량` FROM `Order`
group by `orderProduct`, `orderId`
order by `orderProduct`;
#실습 1-29
SELECT a.orderId, b.prodName FROM `Order` AS a 
JOIN `Product` as b
ON a.orderProduct = b.prodNo
WHERE `orderid` = 'c102';
#실습 1-30
SELECT `orderid`, `name`, `prodName`, `orderDate` FROM `Order` AS a
JOIN `Customer` AS b
ON a.orderId = b.coutId
JOIN `Product` AS c
ON a.orderProduct = c.prodNo
WHERE substr(`orderDate`, 1, 10) ='2022-07-03';
