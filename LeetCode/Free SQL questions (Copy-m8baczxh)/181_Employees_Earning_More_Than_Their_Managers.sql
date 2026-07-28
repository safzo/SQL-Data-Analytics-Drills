/* Write your T-SQL query statement below */
SELECT
    p.name as Employee
FROM Employee AS p 
    JOIN Employee AS q ON p.managerId = q.id
WHERE p.salary>q.salary;
