/* CHALLENGE: Calculating Running Total
https://www.codewars.com/kata/589cf45835f99b2909000115

SOLUTION CODE:
*/

SELECT date(created_at) AS date,
       count(id) AS count,
       (sum(count(id)) OVER (ORDER BY date(created_at) ASC))::int AS total
  FROM posts
GROUP BY date
ORDER BY date ASC;
