#날짜 : 2025/01/16
#이름 : 주솔지
#내용 : SQL 연습문제 4


#실습4-1
create database `Theater`;
create user 'theater'@'%' identified by '1234';
grant all privileges on `Theater`.* to 'theater'@'%';
flush privileges;



#실습4-2

create table `Movies`(
		`movie_id`		int auto_increment primary key,
        `title`			varchar(30) not null,
        `genre`			varchar(10) not null,
        `release_date`	date not null
     
     );
     
 create table `Customer`(
	`customer_id`	int auto_increment primary key,
	`name`			varchar(20) not null,
	`email`			varchar(50) not null,
	`phone`			char(13) not null
 
 );
 
 create table `Bookings`(
		`booking_id`	int primary key,
        `customer_id`	int not null,
        `movie_id`		int not null,
        `num_tickets`	int not null,
		`booking_date`	datetime not null
     );

#실습4-3
insert into `Movies` (`title`, `genre`, `release_date`) values ('쇼생크의 탈출', '드라마', '1994-10-14');
insert into `Movies` (`title`, `genre`, `release_date`) values ('타이타닉', '로맨스', '1997-03-24');
insert into `Movies` (`title`, `genre`, `release_date`) values ('탑건', '액션', '1987-07-16');
insert into `Movies` (`title`, `genre`, `release_date`) values ('쥬라기공원', '액션', '1994-02-11');
insert into `Movies` (`title`, `genre`, `release_date`) values ('글래디에이터', '액션', '2000-05-03');
insert into `Movies` (`title`, `genre`, `release_date`) values ('시네마천국', '드라마', '1995-04-12');
insert into `Movies` (`title`, `genre`, `release_date`) values ('미션임파서블', '액션', '1995-11-11');
insert into `Movies` (`title`, `genre`, `release_date`) values ('노트북', '로맨스', '2003-08-23');
insert into `Movies` (`title`, `genre`, `release_date`) values ('인터스텔라', 'SF', '2011-05-26');
insert into `Movies` (`title`, `genre`, `release_date`) values ('아바타', 'SF', '2010-02-10');

insert into `Customer` (`name`, `email`, `phone`) values ('김유신', 'kys@example.com', '010-1234-1001');
insert into `Customer` (`name`, `email`, `phone`) values ('김춘추', 'kcc@example.com', '010-1234-1002');
insert into `Customer` (`name`, `email`, `phone`) values ('장보고', 'jbg@example.com', '010-1234-1003');
insert into `Customer` (`name`, `email`, `phone`) values ('강감찬', 'kgc@example.com', '010-1234-1004');
insert into `Customer` (`name`, `email`, `phone`) values ('이순신', 'lss@example.com', '010-1234-1005');

insert into `Bookings` values ('101', 1, 1, 2, '2023-01-10 00:00:00');
insert into `Bookings` values ('102', 2, 2, 3, '2023-01-11 00:00:00');
insert into `Bookings` values ('103', 3, 2, 2, '2023-01-13 00:00:00');
insert into `Bookings` values ('104', 4, 3, 1, '2023-01-17 00:00:00');
insert into `Bookings` values ('105', 5, 5, 2, '2023-01-21 00:00:00');
insert into `Bookings` values ('106', 3, 8, 2, '2023-01-21 00:00:00');
insert into `Bookings` values ('107', 1, 10, 4, '2023-01-21 00:00:00');
insert into `Bookings` values ('108', 2, 9, 1, '2023-01-22 00:00:00');
insert into `Bookings` values ('109', 5, 7, 2, '2023-01-23 00:00:00');
insert into `Bookings` values ('110', 3, 4, 2, '2023-01-23 00:00:00');
insert into `Bookings` values ('111', 1, 6, 1, '2023-01-24 00:00:00');
insert into `Bookings` values ('112', 3, 5, 3, '2023-01-25 00:00:00');

#실습4-4
select title from `Movies`;

#실습4-5
select * from Movies where `genre`='로맨스';

#실습4-6
select 
	title,
    release_date
from Movies where `release_date` > '2010-01-01';

#실습4-7
select 
	booking_id, booking_date
from bookings where `num_tickets` >=3;
	
#실습4-8
select * From Bookings where `booking_date` < '2023-01-20';

#실습4-9
select * from Movies where release_date between '1990-01-01' and '1999-12-31';

#실습4-10
select * from Bookings order by booking_date desc limit 3;

#실습4-11
select title, release_date from movies order by release_date asc limit 1;

#실습4-12
select 
	concat(title, ' - ', release_date) as movie_info
from Movies
where `genre`='액션' and `title` like '%공원%'
order by release_date asc
limit 1;

#실습4-13
select booking_date, title
from Bookings
JOIN Movies
on Bookings.movie_id = movies.movie_id
where customer_id = 2;

select booking_date, title
from Bookings
JOIN Movies
using(`movie_id`)
where customer_id = 2;

#실습4-14
select
	c.`name`,
	c.`phone`,
	b.`booking_date`,
	m.`title`
from bookings B
join Customers C on B.customer_id = C.customer_id
join Movies M ON B.movie_id = M.movie_id;




#실습4-15
select
	m.genre,
    avg(B.num_tickets) as avg_tickets
from bookings B
join Movies M ON B.movie_id = M.movie_id
group by m.`genre`;


#실습4-16
select
	C.name,
    AVG(B.num_tickets) as avg_tickets
from Bookings B
Join Customers C on B.customer_id = C.customer_id
group by c.`name`;

#실습4-17
select
	C.NAME,
    SUM(B.NUM_TICKETS)AS `전체 예매 티켓 수`
FROM bookings B
JOIN Customer C ON B.customer_id = C.customer_id
group by C.`customer_id`
ORder by `전체 예매 티켓 수` desc;

#실습4-18
select
	B.booking_id, B.movie_id, C.name, B.booking_date
from Bookings B
Join Customers C on B.customer_id = C.customer_id
order by B.booking_date ASC
LIMIT 1;

#실습4-19
select
	genre, title, release_date
From Movies
WHERE (genre, release_date) 
IN (select genre, max(release_date)
    from Movies
    group by `genre`
    );

#실습4-20
select * from Movies
where movie_id IN(
	select movie_id from Bookings
    where customer_id = (select customer_id from Customers where `name`='김유신'));
#실습4-21
select name, email from Customers
where customer_id = (
	select customer_id
    from Bookings
    Group by customer_id
    order by sum(num_tickets) desc
    limit 1
    );
    
#실습4-22
select * from bookings
where num_tickets > (select avg(`num_tickets`) from Bookings);

#실습4-23
select 
	m.title, sum(B.num_tickets) as total_tickets
from Bookings B
join Movies M on B.movie_id + M.movie_id
group by M.`movie_id`;

#실습4-24
select
	c.name,
	sum(b.num_tickets) as total_tickets,
    avg(b.num_tickets) as ave_tickets
from Bookings b
join Customers c on b.customer_id = c.custotmer_id
group by C.`customer_id`;

#실습4-25
select
	c.custotmer_id,
    c.name,
    c.email,
    sum(b.num_tickets) as `예매 티켓수`
from bookings b
join Customers c ON b.customer_id = c.customer_id
group by C.`customer_id`
order by `예매 티켓수` desc;

#실습4-26
select
	c.name,
    m.title,
    
from bookings b
join customers c on b.customer_id = c.customer_id
join movies m on b.movie_id=m.movie_id
order by num_tickets desc;
#실습4-27
select
	M.tile,
    M.genre,
    sum(b.num_tickets) as `예매 티켓 수`,
    avg(b.num_tickets) as `평균 티켓 수`
from bookings B
join Movies M on B.moivie_id = M.movie_id
where M.genre = '액션'
group by M`movie_id`
order by `평균 티켓 수` desc;

#실습4-28
select
	B.customer_id,
    C.name,
    SUM(`num_tickets`) as `ticket_total`
from bookings B
JOIN Customers C on B.customer_id = C.customer_id
group by C.customer_id
order by ticket_total desc;

#실습4-29
select
	B.booking_id,
    B.customer_id,
    B.movie_id,
    MaxTickets.max(num_tickets) as max_tickets
From Booking B
join(
	select movie_id, max(num_tickets) as max_tickets
    from bookings
    group by movie_id
) as MaxTickets
on B.movie_id = MaxTickets.movie_id and B.num_tickets=MaxTickets.max_tickets;    

#실습4-30
select @@sql_mode
set session sql_mode = `ST
select
	B.booing_id,
    B.customer_id,
    C.name,
    M.title,
    M.genre,
    SUM(B.num_ticket) as `예매 티켓 수`
    
From bookings bookings
join movies M on b.movie_id+m.movie_id
join customers c on b.customer_id=c.customer_id
group by m.title
having `예매 티켓 수`=(
select max(total_tickets)
from(
		select sum(B2.num_tickets) as total_tickets
        FROM Bookings B2
        Join Movies M2 on B2.movie_id=m2.movie_id
        where m2.genre=M.genre
        group by m2.title
        )as selectMAX
        )
        order by `예매 티켓 수` desc;