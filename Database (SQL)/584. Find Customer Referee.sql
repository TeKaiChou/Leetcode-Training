select name
from Customer
where referee_id != 2 or referee_id is null;
# where coalesce(referee_id, 0) != 2;
