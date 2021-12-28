SELECT name,
  sex,
  age,
  rank() OVER (PARTITION BY sex ORDER BY age DESC) AS rnk
FROM address
;
