-- 1045. Customers Who Bought All Products
select e.employee_id, e.name, count(ee.reports_to) reports_count, round(avg(ee.age),0) average_age from employees e
join employees ee on e.employee_id = ee.reports_to
group by e.employee_id
order by e.employee_id

-- 1789. Primary Department for Each Employee
select employee_id, department_id from employee e
where primary_flag = 'Y'
union
select employee_id, department_id from employee e
where employee_id in (
    select employee_id from employee
    group by employee_id
    having count(employee_id) =1
)

-- 610. Triangle Judgement
select x,y,z , 
    case when x+y >z and x+z >y and y+z>x then 'Yes' else 'No' end as triangle from Triangle

-- 180. Consecutive Numbers
select distinct num  ConsecutiveNums
from (select
        num,
        LAG(num, 1) over (order by id) AS p1,
        LAG(num, 2) over (order by id) AS p2
    from Logs) nm
WHERE num = p1 and num = p2;

--OR

select num ConsecutiveNums 
from (select num, 
           row_number() over (order by id) - row_number() over (partition by num order by id) as diff
    from logs) subquery
group by num, diff
having count(*) >= 3;

-- 1907. Count Salary Categories
select case 
            when income < 20000 then 'Low Salary'  
            when income >=20000 and income <=50000 then 'Average Salary'
            else 'High Salary' 
            end as category,
            count(*) accounts_count from accounts
group by category
UNION ALL
select 'Low Salary' AS category, 0 as accounts_count
where (select count(*) from Accounts where income < 20000) = 0
UNION ALL
select 'Average Salary' as category, 0 as accounts_count
where (select count(*) from Accounts where income >= 20000 AND income <=50000) = 0
UNION ALL
select 'High Salary' as category, 0 as accounts_count
where (select count(*) from Accounts where income > 50000) = 0;

-- 1204. Last Person to Fit in the Bus
select person_name from 
(select person_name, sum(weight) over (order by turn) as cum_wgt from queue) cumm_wgt
where cum_wgt <=1000
order by cum_wgt desc
limit 1
