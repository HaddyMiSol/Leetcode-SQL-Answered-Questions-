-- 620. Not Boring Movies
select id, movie, description, rating from cinema
where id % 2 = 1 and description != 'boring'
order by rating desc

-- 1251. Average Selling Price
select p.product_id, ifnull(round(sum((u.units * price))/sum((u.units)),2),0) average_price from prices p
left join unitsSold u on p.product_id = u.product_id and u.purchase_date between  p.start_date and p.end_date
group by p.product_id

-- 1075. Project Employees I
select p.project_id, ifnull(round((sum(e.experience_years)/count(p.project_id)),2),0) average_years from project p
join employee e on p.employee_id = e.employee_id
group by p.project_id

-- 1633. Percentage of Users Attended a Contest
select r.contest_id, round(
        (count(distinct r.user_id) * 100.0) / (select count(distinct user_id) from users),2)  percentage
from register r
group by r.contest_id
order by percentage desc, r.contest_id asc;

-- 1211. Queries Quality and Percentage
select query_name, round(avg(rating/position),2) quality, round(sum(case when rating < 3 then 1 else 0 end) * 100.0 / count(*), 2) poor_query_percentage
from queries
group by query_name

-- 1193. Monthly Transactions I
select DATE_FORMAT(trans_date, '%Y-%m') as month, country, count(*) trans_count, 
sum(case when state ='approved' then 1 else 0 end) approved_count, 
sum(amount) trans_total_amount, 
sum(case when state ='approved' then amount else 0 end) approved_total_amount
from transactions
group by month, country

-- 1174. Immediate Food Delivery II
select
    round(avg(case when customer_pref_delivery_date = order_date then 1.0 else 0 end) * 100, 2) immediate_percentage
from delivery
where (customer_id, order_date) in (
    select customer_id, MIN(order_date)
    from delivery
    group by customer_id)

-- 550. Game Play Analysis IV
