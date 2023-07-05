SELECT id,
       user_name,
       string_agg(pet_names, ', ') AS pet_names
FROM (SELECT id,
             info ->> 'name' AS user_name,
             jsonb_array_elements(info -> 'pets') ->> 'name' AS pet_names
      FROM users
      GROUP BY id, info ->> 'name') AS results
WHERE pet_names LIKE 'M%'
GROUP BY id, user_name
ORDER BY id ASC
