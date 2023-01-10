# Sol 1 --> can not handle the case if there is a gap in id column
select distinct l1.num as ConsecutiveNums
from Logs l1, Logs l2, Logs l3
where l1.id - 1 = l2.id 
    and l2.id - 1 = l3.id
    and l1.num = l2.num
    and l2.num = l3.num

# Sol 2 
select distinct num as ConsecutiveNums
from (select *, 
    lag(num) over(order by id) as lag_num,
    lead(num) over(order by id) as lead_num
    from Logs) as T
where num = lag_num
    and lag_num = lead_num
