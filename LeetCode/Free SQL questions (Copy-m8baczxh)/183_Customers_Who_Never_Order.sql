/* Write your T-SQL query statement below */
SELECT p.name as Customers
FROM Customers as p
LEFT JOIN Orders as q ON p.id = q.customerId
WHERE (q.customerId IS NULL);
