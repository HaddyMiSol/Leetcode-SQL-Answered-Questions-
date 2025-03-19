-- 1978. Employees Whose Manager Left the Company
select employee_id from employees
where salary < 30000 and  manager_id not in (select employee_id from employees)
order by employee_id;

-- 626. Exchange Seats 
select if (id < (select max(id) from seat), --if this condition is satisfied,
       if (id%2 =0, id-1, id+1),            -- do this,
       if (id%2=0, id-1,id)) as id, student from seat   --else, do this
order by id

-- 1341. Movie Rating
(select u.name as results from users u
join movierating m
on u.user_id = m.user_id
group by u.user_id
order by count(m.user_id) desc, u.name asc
limit 1)

UNION ALL

(select mm.title from movies mm
join movierating m
on mm.movie_id = m.movie_id
where m.created_at >= '2020-02-01' and m.created_at < '2020-03-01'
group by m.movie_id
order by avg(rating) desc, mm.title asc
limit 1
)

-- 1321. Restaurant Growth
with daycum as 
(select visited_on,sum(amount) as amount from customer group by visited_on)

select a.visited_on, round(sum(b.amount),2) amount, round(avg(b.amount),2) average_amount
from daycum a, daycum b
where datediff(a.visited_on, b.visited_on) between 0 and 6
group by a.visited_on
having count(*) >6
order by a.visited_on
