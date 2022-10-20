# select name as Customers
# from Customers c
# left join Orders o on c.id = o.customerid
# where o.id is null

select name as Customers
from Customers C
where C.id not in (select customerId from Orders);
