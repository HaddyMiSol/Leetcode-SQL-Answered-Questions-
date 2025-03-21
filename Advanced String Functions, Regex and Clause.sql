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
