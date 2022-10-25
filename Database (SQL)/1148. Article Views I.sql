# select author_id as 'id'
# from Views
# where author_id = viewer_id
# group by author_id
# having count(viewer_id) > 0
# order by id;

select distinct(author_id) as 'id'
from Views
where author_id = viewer_id
order by id;
