/* CHALLENGE: SQL Basics: Simple PIVOTING data
https://www.codewars.com/kata/58126aa90ea99769e7000119

SOLUTION CODE:
*/

CREATE EXTENSION tablefunc;

SELECT * FROM crosstab(
    'SELECT name, detail, count(detail) FROM products
    JOIN details ON products.id = details.product_id
    GROUP BY name, detail
    ORDER BY name, detail'
) AS ct (name text, bad bigint, good bigint, ok bigint)
