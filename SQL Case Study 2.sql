---------------SIMPLE QUERIES---------------

--- 1.List all the employee details. */
SELECT *
FROM EMPLOYEE;

--- 2. List all the department details
SELECT *
FROM DEPARTMENT;

--- 3. List all job details
SELECT *
FROM JOB;

--- 4. List all the locations.
SELECT *
FROM LOCATION;

--- 5. List out the First Name, Last Name, Salary, Commission for all Employees.
SELECT
FIRST_NAME, 
LAST_NAME,
SALARY, 
COMMISSION
FROM EMPLOYEE;

/* 6. List out the Employee ID, Last Name, Department ID for all employees and
alias Employee ID as "ID of the Employee", Last Name as "Name of the
Employee", Department ID as "Dep_id"*/
SELECT 
EMPLOYEE_ID   AS  ID_OF_THE_EMPLOYEE,
LAST_NAME     AS  NAME_OF_THE_EMPLOYEE,
DEPARTMENT_ID AS  DEP_ID
FROM EMPLOYEE;

--- 7. List out the annual salary of the employees with their names only.
SELECT
LAST_NAME,
FIRST_NAME,
MIDDLE_NAME,
SALARY
FROM EMPLOYEE

SELECT CONCAT(FIRST_NAME, ' ', MIDDLE_NAME, ' ', LAST_NAME) AS NAME, SALARY
FROM EMPLOYEE


---------------WHERE CONDITION---------------

--- 1. LIST THE DETAILS ABOUT SMITH
SELECT *
FROM EMPLOYEE
WHERE LAST_NAME = 'SMITH';

--- 2. List out the employees who are working in department 20.
SELECT LAST_NAME, FIRST_NAME, MIDDLE_NAME
FROM EMPLOYEE
WHERE DEPARTMENT_ID = 20;

--- 3. List out the employees who are earning salaries between 3000 and 4500
SELECT LAST_NAME, FIRST_NAME, MIDDLE_NAME
FROM EMPLOYEE
WHERE SALARY BETWEEN 3000 AND 4500;

--- 4. List out the employees who are working in department 10 or 20
SELECT LAST_NAME, FIRST_NAME, MIDDLE_NAME
FROM EMPLOYEE
WHERE DEPARTMENT_ID IN (10, 20);

--- 5. Find out the employees who are not working in department 10 or 30.
SELECT LAST_NAME, FIRST_NAME, MIDDLE_NAME
FROM EMPLOYEE
WHERE DEPARTMENT_ID IN (10, 30);

--- 6. List out the employees whose name starts with 'S'.
SELECT LAST_NAME, FIRST_NAME, MIDDLE_NAME
FROM EMPLOYEE
WHERE LAST_NAME LIKE 'S%';

--- 7. List out the employees whose name starts with 'S' and ends with 'H'.
SELECT LAST_NAME, FIRST_NAME, MIDDLE_NAME
FROM EMPLOYEE
WHERE LAST_NAME LIKE 'S%' AND LAST_NAME LIKE '%H';

--- 8. List out the employees whose name length is 4 and start with 'S'.
SELECT LAST_NAME, FIRST_NAME, MIDDLE_NAME
FROM EMPLOYEE
WHERE LAST_NAME LIKE 'S%'AND LEN(LAST_NAME) = 4;

--- 9. List out employees who are working in department 10 and draw salaries more than 3500.
SELECT LAST_NAME, FIRST_NAME, MIDDLE_NAME
FROM EMPLOYEE
WHERE DEPARTMENT_ID IN (10) AND SALARY > 3500;

--- 10. List out the employees who are not receiving commission.
SELECT LAST_NAME, FIRST_NAME, MIDDLE_NAME
FROM EMPLOYEE
WHERE COMMISSION IS NOT NULL;

---------------ORDER BY CLAUSE---------------

--- 1. List out the Employee ID and Last Name in ascending order based on the Employee ID.
SELECT EMPLOYEE_ID, LAST_NAME
FROM EMPLOYEE 
ORDER BY EMPLOYEE_ID;

--- 2. List out the Employee ID and Name in descending order based on salary
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, MIDDLE_NAME
FROM EMPLOYEE 
ORDER BY SALARY DESC;

--- 3. List out the employee details according to their Last Name in ascending order.
SELECT  *
FROM EMPLOYEE 
ORDER BY LAST_NAME;

--- 4. List out the employee details according to their Last Name in ascending order and then Department ID in descending order.
SELECT  *
FROM EMPLOYEE 
ORDER BY LAST_NAME ASC, DEPARTMENT_ID DESC;


---------------GROUP BY and HAVING CLAUSE---------------

--- 1. How many employees are in different departments in the organization?

SELECT COUNT(LAST_NAME) AS NO_OF_PEOPLE, DEPARTMENT_ID
FROM EMPLOYEE
GROUP BY DEPARTMENT_ID;

--- 2. List out the department wise maximum salary, minimum salary and average salary of the employees.

SELECT DEPARTMENT_ID,
MAX(SALARY) AS MAXIMUM_SALARY, 
MIN(SALARY) AS MINIMUM_SALARY, 
AVG(SALARY) AS AVERAGE_SALARY
FROM EMPLOYEE
GROUP BY DEPARTMENT_ID;

--- 3.List out the job wise maximum salary, minimum salary and average salary of the employees.

SELECT JOB_ID,
MAX(SALARY) AS MAXIMUM_SALARY, 
MIN(SALARY) AS MINIMUM_SALARY, 
AVG(SALARY) AS AVERAGE_SALARY
FROM EMPLOYEE
GROUP BY JOB_ID

--- 4. List out the number of employees who joined each month in ascending order
SELECT COUNT(*) NO_OF_EMPLOYEE, DATENAME(MM, HIRE_DATE) MONTH
FROM EMPLOYEE
GROUP BY DATENAME(MM, HIRE_DATE)
ORDER BY DATENAME(MM, HIRE_DATE);

--- 5.List out the number of employees for each month and year in ascending order based on the year and month.

SELECT COUNT(*) NO_OF_EMPLOYEES , DATENAME(MM,HIRE_DATE) MONTH, DATENAME(YYYY, HIRE_DATE) YEAR
FROM EMPLOYEE
GROUP BY DATENAME (YYYY, HIRE_DATE), DATENAME (MM,HIRE_DATE)
ORDER BY DATENAME (YYYY, HIRE_DATE), DATENAME (MM,HIRE_DATE);

--- 6. List out the Department ID having at least four employees

SELECT COUNT(*) AS NO_OF_EMPLOYEE, DEPARTMENT_ID
FROM EMPLOYEE
GROUP BY DEPARTMENT_ID
HAVING COUNT(*) >= 4;

--- 7. How many employees joined in the month of January?
SELECT COUNT(LAST_NAME) NO_OF_EMPLOYEE, DATENAME(MM,HIRE_DATE) AS MONTH 
FROM EMPLOYEE 
WHERE MONTH(HIRE_DATE) = 1
GROUP BY DATENAME(MM, HIRE_DATE);

--- 8. How many employees joined in the month of January or September?
SELECT COUNT(LAST_NAME) NO_OF_EMPLOYEE, DATENAME(MM,HIRE_DATE) AS MONTH 
FROM EMPLOYEE 
WHERE MONTH(HIRE_DATE) IN (1, 9)
GROUP BY DATENAME(MM, HIRE_DATE);

--- 9. How many employees joined in 1985?
SELECT COUNT(LAST_NAME) NO_OF_EMPLOYEE 
FROM EMPLOYEE 
WHERE YEAR(HIRE_DATE) IN ('1985')
GROUP BY YEAR(HIRE_DATE);

--- 10. How many employees joined each month in 1985?
SELECT COUNT(LAST_NAME) NO_OF_EMPLOYEE , DATENAME(MM,HIRE_DATE) MONTH
FROM EMPLOYEE 
WHERE YEAR (HIRE_DATE) IN ('1985')
GROUP BY DATENAME(MM, HIRE_DATE);

--- 11. How many employees joined in March 1985?
SELECT COUNT(LAST_NAME) NO_OF_EMPLOYEE
FROM EMPLOYEE 
WHERE (YEAR(HIRE_DATE) IN ('1985')) AND (MONTH(HIRE_DATE) IN (3))
GROUP BY YEAR(HIRE_DATE);

--- 12. Which is the Department ID having greater than or equal to 3 employees joining in April 1985?
SELECT COUNT(DEPARTMENT_ID) AS NO_OF_EMPLOYEES , DATENAME (MM,HIRE_DATE) AS MONTH 
FROM EMPLOYEE
WHERE MONTH(HIRE_DATE) IN (4) AND YEAR(HIRE_DATE) IN ('1985')
GROUP BY DATENAME (MM,HIRE_DATE)
HAVING COUNT(DEPARTMENT_ID) >= 3;


---------------JOINS---------------

--- 1. List out employees with their department names

SELECT 
e.LAST_NAME, 
e.FIRST_NAME,
e.MIDDLE_NAME,
d.NAME
FROM EMPLOYEE e
INNER JOIN DEPARTMENT d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID;

--- 2. Display employees with their designations.

SELECT 
e.LAST_NAME, 
e.FIRST_NAME,
e.MIDDLE_NAME,
j.DESIGNATION
FROM EMPLOYEE e
INNER JOIN JOB j ON e.JOB_ID = j.JOB_ID;

--- 3. Display the employees with their department names and regional groups

SELECT e.LAST_NAME, e.FIRST_NAME, e.MIDDLE_NAME, d.NAME, l.CITY
FROM EMPLOYEE e
INNER JOIN DEPARTMENT d ON e.DEPARTMENT_ID = d. DEPARTMENT_ID
INNER JOIN LOCATION l on d.LOCATION_ID = l.LOCATION_ID;

--- 4. How many employees are working in different departments? Display with department names.

SELECT 
COUNT(e.LAST_NAME) AS NO_OF_EMPLOYEES, 
d.NAME
FROM EMPLOYEE e
INNER JOIN DEPARTMENT d ON d.DEPARTMENT_ID = e.DEPARTMENT_ID
GROUP BY NAME;

--- 5. How many employees are working in the sales department?

SELECT 
COUNT(e.LAST_NAME) AS NO_OF_EMPLOYEES, 
d.NAME
FROM EMPLOYEE e
INNER JOIN DEPARTMENT d ON d.DEPARTMENT_ID = e.DEPARTMENT_ID
WHERE d.NAME = 'SALES'
GROUP BY d.NAME;

--- 6. Which is the department having greater than or equal to 5 employees? Display the department names in ascending order.

SELECT 
COUNT(e.LAST_NAME) AS NO_OF_EMPLOYEES,
d.NAME
FROM EMPLOYEE e
INNER JOIN DEPARTMENT d  ON d.DEPARTMENT_ID = e. DEPARTMENT_ID
GROUP BY d.NAME
HAVING COUNT(e.LAST_NAME) >= 5
ORDER BY NAME;

--- 7. How many jobs are there in the organization? Display with designations.

SELECT 
COUNT(JOB_ID) AS NO_OF_JOBS, 
DESIGNATION
FROM JOB
GROUP BY DESIGNATION;

--- 8. How many employees are working in "New York"?

SELECT 
COUNT(e.LAST_NAME) AS NO_OF_EMPLOYEES,
l.CITY
FROM EMPLOYEE e
INNER JOIN DEPARTMENT d ON  d.DEPARTMENT_ID = e.DEPARTMENT_ID
INNER JOIN LOCATION l  ON l.LOCATION_ID = d.LOCATION_ID
WHERE l.CITY = 'New York'
GROUP BY l.city; 

--- 9.Display the employee details with salary grades.
--- 10.List out the number of employees grade wise.
--- 11.Display the employee salary grades and the number of employeesbetween 2000 to 5000 range of salary

--- 12. Display the employee details with their manager names

SELECT
E.EMPLOYEE_ID EMPLOYEEID,
E.LAST_NAME EMPLOYEENAME,
M.LAST_NAME MANAGERNAME
FROM
EMPLOYEE E, EMPLOYEE M
WHERE M.EMPLOYEE_ID = E.MANAGER_ID;

--- 13. Display the employee details who earn more than their managers� salaries.

SELECT
E.EMPLOYEE_ID EMPLOYEEID,
E.LAST_NAME EMPLOYEENAME,
M.LAST_NAME MANGERNAME
FROM EMPLOYEE E,EMPLOYEE M
WHERE E.EMPLOYEE_ID = M.EMPLOYEE_ID AND E.SALARY > M.SALARY;

--- 14. Show the number of employees working under every manager

SELECT
COUNT(E.EMPLOYEE_ID) NOOFEMPLOYEES,
M.LAST_NAME MANAGERNAME
FROM EMPLOYEE E, EMPLOYEE M
WHERE M.EMPLOYEE_ID=E.MANAGER_ID
GROUP BY M.LAST_NAME

--- 15. Display employee details with their manager name

SELECT
E.EMPLOYEE_ID EMPLOYEEID,
E.LAST_NAME EMPLOYEENAME,
M.LAST_NAME MANAGERNAME
FROM
EMPLOYEE E, EMPLOYEE M
WHERE M.EMPLOYEE_ID=E.MANAGER_ID;

--- 16. Display all employees in sales or operation departments

SELECT 
e.LAST_NAME, 
d.NAME
FROM EMPLOYEE e
INNER JOIN DEPARTMENT d  ON d.DEPARTMENT_ID = e. DEPARTMENT_ID
WHERE d.NAME = 'Sales' OR d.NAME = 'Operations';


---------------SET OPERATES---------------

--- 1. List out the distinct jobs in sales and accounting departments.

SELECT DISTINCT j.DESIGNATION
FROM JOB j
INNER JOIN EMPLOYEE e ON e.JOB_ID = j.JOB_ID
INNER JOIN DEPARTMENT d ON d.DEPARTMENT_ID = e.DEPARTMENT_ID
WHERE d.NAME = 'Sales'
UNION ALL
SELECT DISTINCT j.DESIGNATION
FROM JOB j
INNER JOIN EMPLOYEE e ON e.JOB_ID = j.JOB_ID
INNER JOIN DEPARTMENT d ON d.DEPARTMENT_ID = e.DEPARTMENT_ID
WHERE d.NAME = 'Accounting'

--- 2. List out all the jobs in sales and accounting departments.

SELECT j.DESIGNATION
FROM JOB j
INNER JOIN EMPLOYEE e ON e.JOB_ID = j.JOB_ID
INNER JOIN DEPARTMENT d ON d.DEPARTMENT_ID = e.DEPARTMENT_ID
WHERE d.NAME = 'Sales'
UNION ALL
SELECT j.DESIGNATION
FROM JOB j
INNER JOIN EMPLOYEE e ON e.JOB_ID = j.JOB_ID
INNER JOIN DEPARTMENT d ON d.DEPARTMENT_ID = e.DEPARTMENT_ID
WHERE d.NAME = 'Accounting';

--- 3. List out the common jobs in research and accounting departments in ascending order

SELECT j.DESIGNATION
FROM JOB j
INNER JOIN EMPLOYEE e ON e.JOB_ID = j.JOB_ID
INNER JOIN DEPARTMENT d ON d.DEPARTMENT_ID = e.DEPARTMENT_ID
WHERE d.NAME = 'Research'
INTERSECT
SELECT j.DESIGNATION
FROM JOB j
INNER JOIN EMPLOYEE e ON e.JOB_ID = j.JOB_ID
INNER JOIN DEPARTMENT d ON d.DEPARTMENT_ID = e.DEPARTMENT_ID
WHERE d.NAME = 'Accounting';


---------------Subqueries---------------

--- 1.Display the employees list who got the maximum salary.
SELECT LAST_NAME 
FROM EMPLOYEE
WHERE SALARY = (SELECT MAX(SALARY) FROM EMPLOYEE);

--- 2. Display the employees who are working in the sales department.
SELECT LAST_NAME
FROM EMPLOYEE
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID FROM DEPARTMENT WHERE NAME = 'SALES');

--- 3. Display the employees who are working as 'Clerk'.
SELECT LAST_NAME
FROM EMPLOYEE
WHERE JOB_ID = (SELECT JOB_ID FROM JOB WHERE DESIGNATION = 'CLERK');

--- 4. Display the list of employees who are living in "New YorK"
SELECT e.*
FROM EMPLOYEE e
INNER JOIN DEPARTMENT d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
WHERE d.LOCATION_ID IN (SELECT LOCATION_ID FROM LOCATION WHERE CITY = 'NEW YORK');

--- 5. Find out the number of employees working in the sales department.
SELECT COUNT(LAST_NAME) AS NO_OF_EMPLOYEES, DEPARTMENT_ID
FROM EMPLOYEE 
WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID FROM DEPARTMENT WHERE NAME ='SALES') 
GROUP BY DEPARTMENT_ID;

--- 6.Update the salaries of employees who are working as clerks on the BASIS OF 10%
BEGIN TRANSACTION
  UPDATE EMPLOYEE SET SALARY=(SALARY+SALARY*10/100)
  WHERE JOB_ID IN(SELECT JOB_ID FROM JOB
  WHERE DESIGNATION ='CLERK')
ROLLBACK TRANSACTION

--- 7. Delete the employees who are working in the accounting department.
BEGIN TRANSACTION
  DELETE FROM EMPLOYEE
  WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID FROM DEPARTMENT WHERE NAME= 'ACCOUNTING');
ROLLBACK TRANSACTION

--- 8. Display the second highest salary drawing employee details.
SELECT *
FROM EMPLOYEE
WHERE SALARY = (SELECT MAX(SALARY) FROM EMPLOYEE WHERE SALARY < (SELECT MAX(SALARY) FROM EMPLOYEE))

--- 9 .Display the nth highest salary drawing employee details.
CREATE Table #NTHHIGESTSALARY (
 SALARY INT
 );

CREATE FUNCTION NthHighestSalary (@int AS INT)
RETURNS TABLE
AS
RETURN
(
    SELECT E.SALARY FROM EMPLOYEE E
    WHERE (SELECT COUNT(DISTINCT(E2.SALARY)) FROM EMPLOYEE E2
             WHERE E.SALARY < E2.SALARY) IN (@int)
);

SELECT * FROM NthHighestSalary(1);

--- 10. List out the employees who earn more than every employee in department 30.
 
SELECT LAST_NAME ,SALARY
FROM EMPLOYEE
WHERE SALARY > (SELECT MAX(SALARY) FROM EMPLOYEE WHERE DEPARTMENT_ID = 30);

--- 11. List out the employees who earn more than the lowest salary in department 30.
SELECT LAST_NAME ,SALARY
FROM EMPLOYEE
WHERE SALARY > (SELECT MIN(SALARY) FROM EMPLOYEE WHERE DEPARTMENT_ID = 30);

--- 12. Find out whose department has no employees.

SELECT DEPARTMENT_ID
FROM EMPLOYEE
WHERE DEPARTMENT_ID NOT IN (SELECT DEPARTMENT_ID FROM DEPARTMENT
                            WHERE JOB_ID IN ( SELECT JOB_ID FROM JOB));


--- 13 Find out Which department has no employees
 
SELECT DEPARTMENT_ID, NAME
FROM DEPARTMENT
WHERE DEPARTMENT_ID NOT IN (SELECT DEPARTMENT_ID FROM EMPLOYEE);

--- 14.Find out the employees who earn greater than the average salary fortheir department.

SELECT * FROM EMPLOYEE E
WHERE SALARY > (SELECT AVG(SALARY) FROM EMPLOYEE
                  WHERE DEPARTMENT_ID=E.DEPARTMENT_ID
                  GROUP BY DEPARTMENT_ID) 


CREATE TABLE LOCATION (
LOCATION_ID INT  PRIMARY KEY,
CITY VARCHAR(50)
);

INSERT INTO LOCATION VALUES 
(122, 'New York'),
(123, 'Dallas'  ),
(124, 'Chicago' ),
(167, 'Boston'  );

CREATE TABLE DEPARTMENT 
(DEPARTMENT_ID INT PRIMARY KEY ,
NAME VARCHAR(50),
LOCATION_ID INT  FOREIGN KEY REFERENCES LOCATION (LOCATION_ID) );

INSERT INTO DEPARTMENT VALUES
(10, 'Accounting', 122),
(20, 'Sales',       124),
(30, 'Research' ,   123),
(40, 'Operations' , 167);

CREATE TABLE JOB 
(JOB_ID INT PRIMARY KEY,
DESIGNATION VARCHAR (30) );


INSERT INTO JOB VALUES
( 667, 'CLERK'),
(668,  'STAFF'),
(669,  'ANALYST'),
(670,  'SALES PERSON'),
(671,  'MANAGER'),
(672,  'PRESIDENT');

CREATE TABLE EMPLOYEE 
(EMPLOYEE_ID INT,
LAST_NAME VARCHAR(40),
FIRST_NAME VARCHAR(30),
MIDDLE_NAME VARCHAR(10),
JOB_ID INT FOREIGN KEY REFERENCES JOB(JOB_ID),
MANAGER_ID INT,
HIRE_DATE DATE,
SALARY INT,
COMMISSION INT,
DEPARTMENT_ID INT FOREIGN KEY REFERENCES DEPARTMENT(DEPARTMENT_ID) );

INSERT INTO  EMPLOYEE VALUES
(7369,  'SMITH', 'JOHN',   'Q',  667, 7902, '1984-10-17', 800 , NULL, 20),
(7499,  'ALLEN', 'KEVIN',  'J',  670, 7998, '1985-02-20', 1600, 300 , 20),
(7505,  'DOYLE', 'JEAN',   'K',  671, 7839, '1985-04-04', 2850, NULL, 30),
(7506,  'DENIS', 'LYN',    'S',  671, 7839, '1985-05-15', 2750, NULL, 30),
(7507,  'BAKER', 'LESLIE', 'D',  671, 7839, '1985-04-10', 2200, NULL, 40),
(7521,  'WARK', 'CYNTHIA','D',  670, 7698, '1985-02-22', 1250, 500,  30);