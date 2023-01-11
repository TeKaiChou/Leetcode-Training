# Sol 1 --> faster
select id, 
    case when p_id is null then 'Root'
         when id in (select p_id from Tree) then 'Inner'
         else 'Leaf' end as 'type'
from Tree

# Sol 2 
select distinct t1.id,
    case when t1.p_id is null then 'Root'
         when t2.id is null then 'Leaf'
         else 'Inner' end as 'type'
from Tree t1
left join Tree t2 on t1.id = t2.p_id
