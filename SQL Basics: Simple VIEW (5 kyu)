CHALLENGE:
https://www.codewars.com/kata/5811527d9d278b242f000006

SOLUTION CODE:

CREATE VIEW members_approved_for_voucher AS
SELECT  member_id AS id,
        members.name AS name,
        email,
        sum(price) AS total_spending
  FROM sales
JOIN members
  ON sales.member_id = members.id
JOIN products
  ON sales.product_id = products.id
JOIN departments
  ON sales.department_id = departments.id
WHERE departments.name IN (SELECT departments.name FROM sales
                           JOIN products ON sales.product_id = products.id
                           JOIN departments ON sales.department_id = departments.id
                           GROUP BY departments.name, department_id
                           HAVING sum(price) > 10000)
GROUP BY member_id,
         members.name,
         email
HAVING sum(price) > 1000
ORDER BY id;

SELECT id,
       name,
       email,
       total_spending
  FROM members_approved_for_voucher
