-- 1667. Fix Names in a Table
select user_id, concat(upper(substring(name, 1,1)), lower(substring(name, 2))) name from users 
order by user_id

-- 1527. Patients With a Condition
select patient_id, patient_name, conditions from patients
where conditions like 'DIAB1%' 
or conditions like '% DIAB1%'

-- 196. Delete Duplicate Emails
delete p2
from person p1 join person p2
on p1.email = p2.email
and p1.id < p2.id

-- 176. Second Highest Salary
select max(salary) secondhighestsalary
from employee
where salary not in (select max(salary) from employee)

-- 1484. Group Sold Products By The Date
select sell_date, count(distinct product) as num_sold, 
group_concat(distinct product order by product asc) products from activities
group by sell_date
order by sell_date

-- 1327. List the Products Ordered in a Period
select p.product_name, sum(o.unit) unit from products p
join orders o on p.product_id = o.product_id
where o.order_date >= '2020-02-01' and o.order_date < '2020-03-01'
group by p.product_name
having unit >=100

-- 1517. Find Users With Valid E-Mails
select user_id, name, mail from users
where mail REGEXP '^[a-zA-Z][a-zA-Z0-9_.-]*@leetcode\\.com$'
