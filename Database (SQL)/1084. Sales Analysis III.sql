# select distinct p.product_id, p.product_name
# from Sales s
# left join Product p on s.product_id = p.product_id
# where s.product_id not in (
#     select product_id 
#     from Sales 
#     where sale_date not between '2019-01-01' and '2019-03-31'
# )

select distinct p.product_id, p.product_name
from Sales s
left join Product p on s.product_id = p.product_id
group by s.product_id
having max(s.sale_date) <= '2019-03-31'
    and min(s.sale_date) >= '2019-01-01'
