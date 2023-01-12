select 
    d.name as 'Department',
    T.name as 'Employee',
    salary as 'Salary'
from 
(select *, dense_rank() over(partition by departmentId order by salary desc) as 'sub_rank'
from employee) as T
left join Department d on T.departmentId = d.id
where sub_rank <= 3
