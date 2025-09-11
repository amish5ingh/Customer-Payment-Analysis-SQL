                        --Customer-Payment-Analysis-SQL

create table customer(customer_id int, first_name varchar(20),last_name varchar(20),address varchar(20))
select * from  customer

--Tables ke ander ke sabi data delete ka command h truncate
TRUNCATE TABLE customer;

--Table No.1 customer
insert into customer values
(5,'Karan','Singh','Noida'),
(1,'Mary','Smith','Delhi'),
(2,'Linda','Williams','Punjab'),
(3,'Barbara','jones','Bihar'),
(4,'Maden','mohan','UP');

create table payment
(customer_id int, amount bigint, mode varchar(20),payment_date date)

select * from payment

--Table No-2 payment
insert into payment values
(1,60,'cash','2020-09-24'),
(2,30,'credit card','2020-04-27'),
(3,110,'cash','2021-01-26'),
(4,70,'mobile payments','2021-02-28'),
(11,80,'cash','2021-03-01');




--first two name in asc order
select first_name from customer
order by first_name asc limit 2; 

--max salary in customer column 
select amount from payment
order by amount desc 
limit 1;

--where clause 
select first_name,last_name,address from customer
where customer_id=5;

SELECT first_name as Important_Name,address FROM customer  
WHERE last_name = 'Williams';

--OR without as use (column name output change name with the help of 'as')
SELECT first_name, address FROM customer  
WHERE last_name = 'Williams';

-- limt clause
select * from customer
limit 2


--Upper case
select upper(first_name) from customer
--length count
select length(first_name),first_name from customer
--substring
select substring(first_name,1,3),first_name from customer



--Aggregate function

--sum()
select max(amount) 
from payment

--count()
select count(amount) 
from payment

--min()
select min(amount) 
from payment

-- avg()
select avg(amount) as Average_Amount
from payment

--round()
select round(avg(amount),2) as Average_Amount
from payment



--Group By used in Aggregate function

 select mode,sum(amount)
 from payment
 group by mode

--ya other method
select mode,sum(amount) as Total
from payment
group by mode
order by Total; -- order by total se total ke asc ke hisaab se o/p dega


--HAVING CLAUSE

select mode,sum(amount) as Total
from payment
group by mode
having count(amount)>=3  
order by Total desc;


--TIMESTAMP Functions

show timezone;

select now();

select timeofday();

select current_time;

 select current_date;


 --EXTRACT() Function

--month  extract
select extract(month from payment_date)as payment_month,payment_date
from payment

--date(day) extract
select extract(day from payment_date)as payment_date,payment_date
from payment

--year extract
select extract(year from payment_date)as payment_year,payment_date
from payment 

--Quarter extract 
select extract(quarter from payment_date)as payment_quarter,payment_date
from payment

--week extract
select extract(week from payment_date)as payment_week,payment_date
from payment

--DOW (day of Week) extract
select extract(DOW from payment_date)as payment_DayOfWeek,payment_date
from payment

--DOY (day of Year) extract
select extract(DOY from payment_date)as payment_DayOfYear,payment_date
from payment


--Joins (All Joins Queries)


--inner joins

--All common show (inner Join)
select * from customer as c
inner join payment as p
on
c.customer_id=p.customer_id;

--selection some row in boths table with the help of inner join
select first_name,mode,amount from customer as c
inner join payment as p
on
c.customer_id=p.customer_id;

----Left Join
select c.first_name,p.amount  from 
customer as c
left join
payment as p
on c.customer_id=p.customer_id;

--OR without condition
select * from 
customer as c
left join
payment as p
on c.customer_id=p.customer_id;


---Right join 
select c.first_name,p.amount  from 
customer as c
right join
payment as p
on c.customer_id=p.customer_id;

--OR without condition
select * from 
customer as c
right join
payment as p
on c.customer_id=p.customer_id;


-- full outer join
select c.first_name,p.amount  from 
customer as c
full outer join
payment as p
on c.customer_id=p.customer_id;

 
--OR without condition
select * from 
customer as c
full outer join
payment as p
on c.customer_id=p.customer_id;


--Self Join
select * from 
payment as c1
join
payment as c2
on c1.customer_id=c2.amount


--Union
--custA Table
create table custA(cust_name varchar(20),cust_amount bigint)
--Value insert into custA
insert into custA values
('Madan Mohan',2100),
('Gopi Nath',1200),
('Govind Dev', 5000);
select * from custA;

--custB Table
create table custB(cust_name varchar(20),cust_amount bigint)
--Values insert into custB
insert into custB values
('Gopal Bhat',1500),
('Madan Mohan',2100),
('Aman', 5000);
select * from custB;


--Union Example (Not Give a Duplicate data or keeps unique records )
select cust_name,cust_amount
from custA
union
select cust_name,cust_amount
from custB

--Union ALL Example (All records and including duplicates)
select cust_name,cust_amount
from custA
union all
select cust_name,cust_amount
from custB

--SUB QUERY
select * from payment

--find the average Value
select avg(amount) as Average from payment
--filter the customer data > avg value 
select * from payment
where amount > 70 
 
--Sub Quesries
select * from payment
where amount > (select avg(amount) from payment)
 


-- Sub Query Logical operator use
select customer_id from customer

select customer_id,amount,mode
from payment
where customer_id in (select customer_id from customer)

 












 

