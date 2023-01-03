select customer_id, count(*) as count_no_trans
from Visits v
left join Transactions t on v.visit_id = t.visit_id
where t.amount is null
group by customer_id
