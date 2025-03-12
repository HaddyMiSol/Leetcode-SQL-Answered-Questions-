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
