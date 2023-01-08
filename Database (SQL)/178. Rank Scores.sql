# Sol 1
select score,
    dense_rank() over(order by score desc) as 'rank'
from Scores

# Sol 2
SELECT S.Score, COUNT(S2.Score) AS Rank FROM Scores S,
(SELECT DISTINCT Score FROM Scores) S2
WHERE S.Score<=S2.Score
GROUP BY S.Id 
ORDER BY S.Score DESC;
