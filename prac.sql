SELECT name, age,
  RANK() OVER (ORDER BY age)
FROM Address;
