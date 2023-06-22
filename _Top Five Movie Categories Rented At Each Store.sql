/* CHALLENGE: Top Five Movie Categories Rented At Each Store 
https://www.codewars.com/kata/642d3e2c6555a30d83798f54

SOLUTION CODE:
*/

SELECT store_id, category, num_rentals FROM (
  SELECT store_id,
         c.name AS category,
         count(c.category_id) AS num_rentals,
         RANK() OVER (PARTITION BY store_id ORDER BY count(c.category_id) DESC, c.name ASC) AS rank
    FROM inventory i
  JOIN rental r ON i.inventory_id = r.inventory_id
  JOIN film_category fc ON i.film_id = fc.film_id
  JOIN category c ON fc.category_id = c.category_id
  GROUP BY store_id, category) result
WHERE rank <= 5;
