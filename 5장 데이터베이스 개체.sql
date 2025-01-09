#날짜 : 2025/01/09
#이름 : 주솔지
#내용 : 5장 데이터베이스 개체

#실습 5-1
show index from `User1`;
show index from `User2`;
show index from `User3`;

#실습 5-2
create index `idx_user1_uid` on `User1` (`uid`);
analyze table `User1`;

#실습 5-3
drop index `idx_user1_uid` on `User1`;


#실습 5-4
CREATE VIEW `vw_user1` as (select `name`, `hp`, `age` from `User1`);
create view `vw_user4_age_under30` as(select * from `User4` where `age` < 30);
CREATE VIEW `vw_member_with_sales` AS (
 SELECT
	a.`uid` 	AS `직원아이디`,
	b.`name` 	AS `직원이름`,
	b.`pos` 	AS `직급`,
	c.`name` 	AS `부서명`,
	a.`year`	AS `매출년도`,
	a.`month`	AS `월`,
	a.`sale` 	AS `매출액`
 FROM `Sales` 	AS a
 JOIN `Member` 	AS b ON a.uid = b.uid
 JOIN `Department` AS c ON b.dep = c.depNo
    );
#실습 5-5
#실습 5-6
#실습 5-7
DELIMITER $$
	CREATE PROCEDURE proc_test1()
    BEGIN
		SELECT * FROM `Member`;
        SELECT * FROM `Department`;
	END $$
DELIMITER ;

CALL proc_test1();

DELIMITER $$
	CREATE PROCEDURE prod_test1()
    BEGIN
		SELECT * FROM `Member`;
        SELECT * FROM `Department`;
	END $$
    DELIMITER ;
    
CALL prod_test();

DELIMITER $$
	CREATE PROCEDURE proc_test2(IN_userName VARCHAR(10))
    BEGIN
		SELECT * FROM `Member` WHERE `name`=_userName;
	END $$
    DELIMITER ;

CALL proc_test2(‘김유신’);

DELIMITER $$
	CREATE PROCEDURE proc_test3(IN _pos VARCHAR(10), IN _dep TINYINT)
	BEGIN
		SELECT * FROM `Member` WHERE `pos`=_pos AND `dep`=_dep;
	END $$
	DELIMITER ;
 CALL proc_test3(‘차장’, 101);

 DELIMITER $$
	CREATE PROCEDURE proc_test4(IN _pos VARCHAR(10), OUT _count INT)
	BEGIN
		SELECT COUNT(*) INTO _count FROM `Member` WHERE `pos`=_pos ;
	END $$
	DELIMITER ;
 CALL proc_test4(‘대리’, @_count);
 SELECT CONCAT('_count : ', @_count)


    
    
