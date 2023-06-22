/* CHALLENGE: SQL Bug Fixing: Fix the QUERY - Totaling
https://www.codewars.com/kata/582cba7d3be8ce3a8300007c

SOLUTION CODE:
*/

SELECT 
  CAST(s.transaction_date AS date) AS day,
  d.name AS department,
  COUNT(s.id) AS sale_count
  FROM department d
INNER JOIN sale s ON d.id = s.department_id
GROUP BY day, department
ORDER BY day ASC, department ASC;
