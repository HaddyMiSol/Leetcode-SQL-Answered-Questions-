-- 2356. Number of Unique Subjects Taught by Each Teacher
select distinct(teacher_id), count(distinct(subject_id)) cnt from teacher
group by teacher_id

-- 1141. User Activity for the Past 30 Days I
select  activity_date day, count(distinct user_id) active_users from activity
where activity_date between date_sub('2019-07-27', interval 29 day) and '2019-07-27'
group by activity_date
having activity_date <='2019-07-27'

-- 1070. Product Sales Analysis III
select fsd.product_id, first_year, quantity, price from 
(select product_id, min(year) first_year from sales group by product_id) fsd --first_sales_date
join sales s on fsd.product_id = s.product_id
and fsd.first_year = s.year

--OR

select fsd.product_id, year as first_year, quantity, price from 
(select product_id,year, quantity, price, rank() over (partition by product_id order by year)rnk_year from  sales) fsd
where rnk_year =1

-- 596. Classes More Than 5 Students
select class from courses
group by class
having count(student) >=5

-- 1729. Find Followers Count
select user_id, count(distinct follower_id) followers_count from followers
group by user_id

-- 619. Biggest Single Number
select max(num) num from MyNumbers
where num IN (
    select num from MyNumbers
    group by num
    having count(num) = 1
)

-- 1045. Customers Who Bought All Products
select customer_id from customer
group by customer_id
having count(distinct product_key) = (select count(distinct product_key) from product)
