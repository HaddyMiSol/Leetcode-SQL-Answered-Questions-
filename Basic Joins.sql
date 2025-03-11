
-- 1378. Replace Employee ID With The Unique Identifier
select case when eu.id = e.id then unique_id
            when eu.id != e.id then NULL end as unique_id, e.name from employees e
left join employeeuni eu on e.id = eu.id;

-- 1068. Product Sales Analysis I
select p.product_name, s.year, s.price from sales s
inner join product p on s.product_id = p.product_id
where s.sale_id is not null;

-- 1581. Customer Who Visited but Did Not Make Any Transactions
select v.customer_id, count(v.visit_id) count_no_trans from visits v
left join transactions t on v.visit_id = t.visit_id
where t.visit_id is null
group by v.customer_id;

-- 197. Rising Temperature
SELECT
    w1.id
FROM
    Weather w
JOIN
    Weather w1 ON DATE_ADD(w.recordDate, INTERVAL 1 DAY) = w1.recordDate
WHERE
    w1.temperature > w.temperature;

-- 1661. Average Time of Process per Machine
select machine_id,round(avg(end_timestamp - start_timestamp),3) processing_time from
(select machine_id, process_id,max(case when activity_type = 'start' then timestamp else NULL END) as start_timestamp,
                               max(case when activity_type = 'end' then timestamp else NULL END) as end_timestamp
from activity group by machine_id, process_id) processingtime
group by machine_id

--OR
SELECT a.machine_id, 
       ROUND(AVG(a1.timestamp - a.timestamp), 3) AS processing_time
FROM Activity a
JOIN Activity a1
ON a.machine_id = a1.machine_id 
AND a.process_id = a1.process_id 
AND a.activity_type = 'start' 
AND a1.activity_type = 'end'
GROUP BY a.machine_id;


-- 577. Employee Bonus
select e.name, b.bonus from employee e
left join bonus b on e.empid = b.empid
where b.bonus < 1000 or b.bonus is null

-- 1280. Students and Examinations
select s.student_id, s.student_name, sj.subject_name, count(e.student_id) attended_exams from students s
cross join subjects sj 
left join examinations e on e.student_id = s.student_id and sj.subject_name = e.subject_name
group by  s.student_id, sj.subject_name
order by s.student_id, sj.subject_name

-- 570. Managers with at Least 5 Direct Reports
SELECT
    e.name
FROM
    Employee e
JOIN
    Employee e1 ON e.id = e1.managerId
WHERE e1.managerId is not null
GROUP BY
    e.id, e.name
HAVING
    COUNT(DISTINCT e1.id) >= 5;

-- 1934. Confirmation Rate
select s.user_id, round(IFNULL(sum(cc.confirmed_action) / NULLIF(sum(cc.all_action), 0), 0), 2) confirmation_rate from signups s
left join (select user_id, (case when action = 'confirmed' then 1 else 0 end)confirmed_action,
                            (case when action = 'confirmed' or action = 'timeout'  then 1 else 0 end) all_action 
from confirmations c ) cc
on s.user_id = cc.user_id
group by s.user_id

-- Note: Difference between IFNULL and NULLIF
-- With IFNULL, your decide what the replacement value should be if null while with NULLIF, if the result matches what you ask it to check, it returns null
-- example of NULLIF; NULLIF(Age, 0): If Age is 0, it will be replaced with NULL else it will return Age
-- example of IFNULL; IFNULL(salary, 0): If salary is NULL, it will be replaced with 0 else it will return salary

