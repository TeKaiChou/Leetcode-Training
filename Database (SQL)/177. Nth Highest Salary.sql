# Sol 1
CREATE FUNCTION getNthHightestSalary(N INT) RETURNS INT
BEGIN
set N = N-1;
    RETURN(
        select distinct(salary)
        from Employee
        order by salary desc
        limit 1 offset N
    );
END

# Sol 2 
CREATE FUNCTION getNthHightestSalary(N INT) RETURNS INT
BEGIN
    RETURN(
        select dinstinct(salary) 
        from 
        (select salary, dense_rank() over(order by salary desc) as rk
        from Employee) as T
        where rk = N
    );
END
