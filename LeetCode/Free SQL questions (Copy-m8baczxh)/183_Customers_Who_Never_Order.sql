/* Write your T-SQL query statement below */
/* Solving this using the join method: */
SELECT p.name as Customers
FROM Customers as p
LEFT JOIN Orders as q ON p.id = q.customerId
WHERE (q.customerId IS NULL);

/* Solving this using the NOT IN method: */
SELECT name as Customers
FROM Customers
WHERE id NOT IN (SELECT customerid FROM Orders WHERE customerId IS NOT NULL);
