-- 1978. Employees Whose Manager Left the Company
select employee_id from employees
where salary < 30000 and  manager_id not in (select employee_id from employees)
order by employee_id;

-- 626. Exchange Seats 
select if (id < (select max(id) from seat), --if this condition is satisfied,
       if (id%2 =0, id-1, id+1),            -- do this,
       if (id%2=0, id-1,id)) as id, student from seat   --else, do this
order by id

-- 
