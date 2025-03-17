-- 1045. Customers Who Bought All Products
select e.employee_id, e.name, count(ee.reports_to) reports_count, round(avg(ee.age),0) average_age from employees e
join employees ee on e.employee_id = ee.reports_to
group by e.employee_id
order by e.employee_id

-- 
