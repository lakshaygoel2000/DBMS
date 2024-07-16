SELECT Name
FROM Employee
WHERE Salary > (SELECT Salary FROM Employee WHERE EmpId = 104);

SELECT Name, Salary, JobId
FROM Employee
WHERE JobId = (SELECT JobId FROM Employee WHERE EmpId = 103);

SELECT Name, Salary, JobId
FROM Employee
WHERE Salary = (SELECT MIN(Salary) FROM Employee);

SELECT *
FROM Employee
WHERE DOJ = (SELECT DOJ FROM Employee WHERE EmpId = 106);

SELECT *
FROM Employee
WHERE DOJ > (SELECT DOJ FROM Employee WHERE EmpId = 102);