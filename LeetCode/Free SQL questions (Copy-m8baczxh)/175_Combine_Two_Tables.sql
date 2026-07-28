/* Write your T-SQL query statement below */
SELECT 
    p.firstName, 
    p.lastName, 
    q.city, 
    q.state
FROM Person AS p
LEFT JOIN Address AS q 
    ON p.personId = q.personId;
