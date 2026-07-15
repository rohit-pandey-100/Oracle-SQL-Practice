
-- ===========================================
-- DAY05.SQL
-- Topic: Arithmetic Operators, Relational Operators,
-- WHERE Clause, Aggregate Functions, ORDER BY
-- ===========================================

-- Show all tables
SELECT TABLE_NAME FROM USER_TABLES;

-- Display employee table
SELECT * FROM EMP;

-- Display student table
SELECT * FROM STUDENT1;

----------------------------------------------------
-- Aggregate Functions
----------------------------------------------------

-- Average salary
SELECT AVG(SAL) AS "AVG SALARY"
FROM EMP;

-- Average marks of each student
SELECT SID, SNAME,
       (M1+M2+M3+M4)/4 AS "AVG MARKS"
FROM STUDENT1;

-- Total marks
SELECT SID, SNAME,
       (M1+M2+M3+M4) AS "TOTAL MARKS"
FROM STUDENT1;

----------------------------------------------------
-- WHERE Clause
----------------------------------------------------

SELECT SID, SNAME
FROM STUDENT1
WHERE SID = 1003;

SELECT SNAME, M1, M2, M3, M4
FROM STUDENT1
WHERE SID = 1004;

----------------------------------------------------
-- ORDER BY
----------------------------------------------------

SELECT *
FROM STUDENT1
ORDER BY SNAME;

SELECT *
FROM STUDENT1
ORDER BY SNAME DESC;

----------------------------------------------------
-- Arithmetic Operators
----------------------------------------------------

SELECT 5+5;
SELECT 10-5;
SELECT 50*0;
SELECT 2/1;

----------------------------------------------------
-- Employee Salary Calculations
----------------------------------------------------

-- Annual Salary
SELECT EMPNO, ENAME, SAL,
       SAL*12 AS "ANNUAL SALARY"
FROM EMP;

-- Allowances and Gross Salary
SELECT EMPNO,
       ENAME,
       SAL,
       SAL*0.10 AS TA,
       SAL*0.20 AS HRA,
       SAL*0.05 AS TAX,
       SAL+SAL*0.10+SAL*0.20-SAL*0.05 AS GROSS
FROM EMP;

----------------------------------------------------
-- Relational Operators
----------------------------------------------------

SELECT 10=10;
SELECT 10>5;
SELECT 10<5;
SELECT 10!=5;
SELECT 2>=2;
SELECT 2<=5;

----------------------------------------------------
-- WHERE with Character Data
----------------------------------------------------

SELECT EMPNO, ENAME, JOB
FROM EMP
WHERE JOB='MANAGER';

----------------------------------------------------
-- WHERE with Numeric Data
----------------------------------------------------

SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL>4000;

SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL>1000;

----------------------------------------------------
-- Common Errors
----------------------------------------------------

-- Wrong:
-- SELECT * FROM STUDENT1 ORDERED BY SNAME;

-- Correct:
-- SELECT * FROM STUDENT1 ORDER BY SNAME;

-- Wrong:
-- SELECT EMPNO,ENAME
-- SAL*0.1 AS TA
-- FROM EMP;

-- Correct:
-- SELECT EMPNO,ENAME,
-- SAL*0.1 AS TA
-- FROM EMP;

-- Wrong:
-- SELECT EMPID,AVG(ESALARY) FROM EMP1;

-- Correct:
-- SELECT AVG(ESALARY) FROM EMP1;
-- or use GROUP BY when selecting other columns.

-- End of Day05
