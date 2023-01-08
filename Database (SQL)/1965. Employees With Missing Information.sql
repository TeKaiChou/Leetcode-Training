select employee_id
from(
select * 
from Employees 
left join Salaries using(employee_id)
Union 
select * 
from Employees 
right join Salaries using(employee_id)
) as T
where name is null or salary is null
order by employee_id
