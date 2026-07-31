/* Write your T-SQL query statement below */
SELECT email as Email
From Person
Group By email
Having count(email)>1;
