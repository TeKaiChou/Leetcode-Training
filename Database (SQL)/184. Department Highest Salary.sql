select d.name as 'Department', e.name as 'Employee', Salary
from Employee e
left join Department d on e.departmentId = d.id
where (e.departmentId, salary) in 
(select departmentId, max(salary) as h_salary
    from Employee
    group by departmentId) 

