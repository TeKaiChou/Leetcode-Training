# Sol 1
select request_at as 'Day', 
    round(sum(if(status like 'cancelled%', 1, 0))/count(status), 2) as "Cancellation Rate"
from 
(select request_at, status
from Trips t, Users u1, Users u2
where t.client_id = u1.users_id and 
      t.driver_id = u2.users_id and
      u1.banned = 'No' and 
      u2.banned = 'No' and
      request_at between '2013-10-01' and '2013-10-03') as T
group by request_at
order by 'Day'

# Sol 2 
select 
    request_at as "Day",
    round(
        (sum(case when status = "cancelled_by_driver" or status = "cancelled_by_client" then 1 else 0 end) / count(status)), 2
    ) as "Cancellation Rate"
from
    Trips
where 
    client_id not in (select users_id from Users where role = 'client' and banned ='Yes') 
and 
    driver_id not in (select users_id from Users where role = 'driver' and banned ='Yes') 
and 
    request_at >= "2013-10-01" and request_at <= "2013-10-03"
group by 
    request_at
