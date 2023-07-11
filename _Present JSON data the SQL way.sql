/* CHALLENGE: Present JSON data the SQL way
https://www.codewars.com/kata/5daf515c3affec002b2fb921

SOLUTION CODE:
*/

SELECT data->>'first_name' AS first_name,
       data->>'last_name' AS last_name,
       EXTRACT(YEAR FROM age((data->>'date_of_birth')::date)) AS age,
       CASE
        WHEN (data->>'private')::text = 'true' THEN 'Hidden'
        WHEN json_array_length(data->'email_addresses') = 0 THEN 'None'
        ELSE data->'email_addresses'->>0
       END AS email_address
       FROM users
ORDER BY first_name, last_name
