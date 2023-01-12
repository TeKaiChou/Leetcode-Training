select id, visit_date, people
from 
(select *,
    lead(people) over() as lead_people,
    lead(people, 2) over() as lead2_people,
    lag(people) over() as lag_people,
    lag(people, 2) over() as lag2_people

from stadium) as T
where (people >= 100 and
    lead_people >= 100 and
    lead2_people >= 100) or 
    (people >= 100 and
    lag_people >= 100 and
    lag2_people >= 100)
order by visit_date
