select *
from Cinema
where mod(id, 2) = 1 and description != "boring" #i%2
order by rating desc;
