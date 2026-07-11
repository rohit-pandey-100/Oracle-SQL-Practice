/*
==========================================================
          DAY 03 - ADDITIONAL ORACLE SQL PRACTICE
==========================================================

Topics:

1. WHERE Clause
2. Comparison Operators
3. ORDER BY Clause
4. Creating STUDENT1 Table
5. Inserting Records
6. COMMIT
7. Arithmetic Operations
8. Column Alias
9. Total and Average Marks
10. Creating Employee Table
11. TRUNC Function
12. Monthly Salary Calculation
13. RENAME Command
14. Creating EMP Table
15. Creating DEPT Table
16. Errors Faced and Corrections

==========================================================
*/


-- ========================================================
-- 1. WHERE CLAUSE WITH GREATER THAN OPERATOR
-- ========================================================

SELECT PID, PNAME
FROM BGMI_PLAYERS
WHERE PID > 59876123450
ORDER BY 1;

-- Explanation:
-- WHERE is used to filter rows.
-- > means greater than.
-- This query displays players whose PID is greater than
-- the given number.
--
-- In this practice, no rows were selected because there
-- were no PID values greater than the given number.


-- ========================================================
-- 2. WHERE CLAUSE WITH LESS THAN OPERATOR
-- ========================================================

SELECT PID, PNAME
FROM BGMI_PLAYERS
WHERE PID < 59876123450
ORDER BY 1;

-- Explanation:
-- < means less than.
-- This query displays players whose PID is less than
-- 59876123450.
--
-- ORDER BY 1 sorts the result using the first selected
-- column, which is PID.


-- ========================================================
-- 3. FILTER PLAYER RECORDS
-- ========================================================

SELECT PID, PNAME
FROM BGMI_PLAYERS
WHERE PID > 57896543120
ORDER BY 1;

-- Explanation:
-- This query first filters the player records using WHERE.
-- After filtering, ORDER BY sorts the result by PID.


-- ========================================================
-- 4. DISPLAY ALL BGMI PLAYER RECORDS
-- ========================================================

SELECT *
FROM BGMI_PLAYERS;

-- Explanation:
-- * means all columns.
-- This displays every column and every row available
-- in the BGMI_PLAYERS table.


-- ========================================================
-- 5. CREATE STUDENT1 TABLE
-- ========================================================

CREATE TABLE STUDENT1
(
    SID   NUMBER(4),
    SNAME VARCHAR2(16),
    M1    NUMBER(5,2),
    M2    NUMBER(5,2),
    M3    NUMBER(5,2),
    M4    NUMBER(5,2)
);

-- Explanation:
-- CREATE TABLE creates a new table.
--
-- SID stores Student ID.
-- SNAME stores Student Name.
-- M1, M2, M3 and M4 store marks.


-- ========================================================
-- 6. INSERT STUDENT RECORDS
-- ========================================================

INSERT INTO STUDENT1
VALUES (1001, 'RAVI', 75.22, 66.60, 64.60, 40.00);

INSERT INTO STUDENT1
VALUES (1002, 'RONISH', 75.22, 55.54, 64.60, 85.44);

INSERT INTO STUDENT1
VALUES (1003, 'KHUSHI', 75.22, 85.54, 64.60, 99.90);

INSERT INTO STUDENT1
VALUES (1004, 'KUNAL', 65.54, 85.54, 88.43, 75.64);

-- Explanation:
-- INSERT INTO is used to add new records to a table.
--
-- The number of values should match the number of
-- columns available in the table.


-- ========================================================
-- 7. SAVE STUDENT RECORDS
-- ========================================================

COMMIT;

-- Explanation:
-- COMMIT permanently saves database changes.


-- ========================================================
-- 8. DISPLAY STUDENT RECORDS
-- ========================================================

SELECT *
FROM STUDENT1;

-- Explanation:
-- Displays all records and columns from STUDENT1.


-- ========================================================
-- 9. CALCULATE TOTAL AND AVERAGE MARKS
-- ========================================================

SELECT SNAME,
       M1 + M2 + M3 + M4 AS TOTAL_MARKS,
       (M1 + M2 + M3 + M4) / 4 AS AVRG_MARKS
FROM STUDENT1;

-- Explanation:
-- M1 + M2 + M3 + M4 calculates total marks.
--
-- The total is divided by 4 to calculate average marks.
--
-- AS TOTAL_MARKS gives a temporary heading to the
-- calculated total.
--
-- AS AVRG_MARKS gives a temporary heading to the
-- calculated average.


-- ========================================================
-- 10. CREATE EMPLOYEE TABLE
-- ========================================================

CREATE TABLE EMP
(
    EMPID   NUMBER(5),
    ESALARY NUMBER(10),
    ENAME   VARCHAR2(10),
    EJOB    VARCHAR2(10)
);

-- Explanation:
-- EMPID stores Employee ID.
-- ESALARY stores Employee Salary.
-- ENAME stores Employee Name.
-- EJOB stores Employee Job.


-- ========================================================
-- 11. INSERT MULTIPLE EMPLOYEE RECORDS
-- ========================================================

INSERT INTO EMP VALUES
(12345, 350000, 'KUNAL', 'SOF_DEV'),
(12356, 280000, 'KHUSHI', 'SOF_TESTER'),
(12367, 650000, 'RAVI', 'WEB_DEV'),
(12378, 950000, 'RONISH', 'MANAGER');

-- Explanation:
-- This inserts multiple records into the EMP table.


-- ========================================================
-- 12. SAVE EMPLOYEE RECORDS
-- ========================================================

COMMIT;


-- ========================================================
-- 13. DISPLAY EMPLOYEE RECORDS
-- ========================================================

SELECT *
FROM EMP;


-- ========================================================
-- 14. CALCULATE MONTHLY SALARY
-- ========================================================

SELECT ENAME,
       ESALARY / 12 AS MONTH_SALARY
FROM EMP;

-- Explanation:
-- ESALARY contains annual salary.
--
-- Dividing salary by 12 calculates monthly salary.
--
-- AS MONTH_SALARY gives a temporary name to the
-- calculated column.


-- ========================================================
-- 15. REMOVE DECIMAL VALUES USING TRUNC
-- ========================================================

SELECT ENAME,
       TRUNC(ESALARY / 12) AS MONTH_SALARY
FROM EMP;

-- Explanation:
-- TRUNC removes the decimal part from a number.
--
-- Example:
--
-- 29166.6667
--
-- becomes:
--
-- 29166


-- ========================================================
-- 16. RENAME TABLE
-- ========================================================

RENAME EMP TO EMP1;

-- Explanation:
-- RENAME changes the name of a database object.
--
-- Here:
--
-- Old Table Name = EMP
-- New Table Name = EMP1


-- ========================================================
-- 17. DISPLAY RENAMED TABLE
-- ========================================================

SELECT *
FROM EMP1;

-- Explanation:
-- After renaming EMP to EMP1, the old EMP table name
-- cannot be used.
--
-- We must use the new table name EMP1.


-- ========================================================
-- 18. CREATE CLASSIC EMP TABLE
-- ========================================================

CREATE TABLE EMP
(
    EMPNO    NUMBER(4) NOT NULL,
    ENAME    VARCHAR2(10),
    JOB      VARCHAR2(9),
    MGR      NUMBER(4),
    HIREDATE DATE,
    SAL      NUMBER(7,2),
    COMM     NUMBER(7,2),
    DEPTNO   NUMBER(2)
);

-- Explanation:
-- This table stores employee information.
--
-- EMPNO    = Employee Number
-- ENAME    = Employee Name
-- JOB      = Employee Job
-- MGR      = Manager Number
-- HIREDATE = Employee Hiring Date
-- SAL      = Employee Salary
-- COMM     = Employee Commission
-- DEPTNO   = Department Number


-- ========================================================
-- 19. INSERT EMPLOYEE DATA
-- ========================================================

INSERT INTO EMP VALUES
(
    7369,
    'SMITH',
    'CLERK',
    7902,
    TO_DATE('17-DEC-1980', 'DD-MON-YYYY'),
    800,
    NULL,
    20
);

INSERT INTO EMP VALUES
(
    7499,
    'ALLEN',
    'SALESMAN',
    7698,
    TO_DATE('20-FEB-1981', 'DD-MON-YYYY'),
    1600,
    300,
    30
);

INSERT INTO EMP VALUES
(
    7521,
    'WARD',
    'SALESMAN',
    7698,
    TO_DATE('22-FEB-1981', 'DD-MON-YYYY'),
    1250,
    500,
    30
);

INSERT INTO EMP VALUES
(
    7566,
    'JONES',
    'MANAGER',
    7839,
    TO_DATE('02-APR-1981', 'DD-MON-YYYY'),
    2975,
    NULL,
    20
);

INSERT INTO EMP VALUES
(
    7654,
    'MARTIN',
    'SALESMAN',
    7698,
    TO_DATE('28-SEP-1981', 'DD-MON-YYYY'),
    1250,
    1400,
    30
);

INSERT INTO EMP VALUES
(
    7934,
    'MILLER',
    'CLERK',
    7782,
    TO_DATE('23-JAN-1982', 'DD-MON-YYYY'),
    1300,
    NULL,
    10
);


-- ========================================================
-- 20. SAVE EMPLOYEE DATA
-- ========================================================

COMMIT;


-- ========================================================
-- 21. CREATE DEPARTMENT TABLE
-- ========================================================

CREATE TABLE DEPT
(
    DEPTNO NUMBER(2),
    DNAME  VARCHAR2(14),
    LOC    VARCHAR2(13)
);

-- Explanation:
-- DEPTNO stores Department Number.
-- DNAME stores Department Name.
-- LOC stores Department Location.


-- ========================================================
-- 22. INSERT DEPARTMENT RECORDS
-- ========================================================

INSERT INTO DEPT
VALUES (10, 'ACCOUNTING', 'NEW YORK');

INSERT INTO DEPT
VALUES (20, 'RESEARCH', 'DALLAS');

INSERT INTO DEPT
VALUES (30, 'SALES', 'CHICAGO');


-- ========================================================
--                ERRORS FACED AND FIXED
-- ========================================================


-- ERROR 1: ORA-00913 TOO MANY VALUES
-- ========================================================

-- Incorrect:

-- INSERT INTO STUDENT1
-- VALUES (1002, 'RONISH', 75.22, 55.54, 64.60, 85, 44);

-- Problem:
-- STUDENT1 contains 6 columns.
-- But 7 values were provided.
--
-- 85,44 was incorrectly written using a comma.


-- Correct:

INSERT INTO STUDENT1
VALUES (1002, 'RONISH', 75.22, 55.54, 64.60, 85.44);


-- ========================================================
-- ERROR 2: ORA-00923 FROM KEYWORD NOT FOUND
-- ========================================================

-- Incorrect:

-- SELECT SNAME,
-- M1+M2+M3+M4 AS TOTAL_MARK'S;

-- Problem:
-- Apostrophe (') cannot be used like this for an alias.


-- Correct:

SELECT SNAME,
       M1 + M2 + M3 + M4 AS TOTAL_MARKS,
       (M1 + M2 + M3 + M4) / 4 AS AVRG_MARKS
FROM STUDENT1;


-- ========================================================
-- ERROR 3: ORA-12899 VALUE TOO LARGE
-- ========================================================

-- Problem:
--
-- EJOB was VARCHAR2(10).
--
-- A value longer than 10 characters was inserted.
--
-- Example:
--
-- SOFTWARE_DEV
--
-- The text was larger than the column capacity.


-- Solution Used During Practice:
--
-- Shorter values were inserted.
--
-- SOFTWARE_DEV  -> SOF_DEV
-- SOFTWARE_TESTER -> SOF_TESTER


-- ========================================================
-- ERROR 4: ORA-00903 INVALID TABLE NAME
-- ========================================================

-- Incorrect:

-- UPDATE TABLE EMP TO EMP1;

-- Problem:
-- UPDATE is used to modify data inside a table.
-- UPDATE cannot rename a table.


-- ========================================================
-- ERROR 5: ORA-00971 MISSING SET KEYWORD
-- ========================================================

-- Incorrect:

-- UPDATE EMP TO EMP1;

-- Problem:
-- Oracle considered it an UPDATE command.
-- UPDATE requires the SET keyword.


-- Correct Command:

RENAME EMP TO EMP1;


-- ========================================================
-- ERROR 6: ORA-00942 TABLE OR VIEW DOES NOT EXIST
-- ========================================================

-- After executing:

-- RENAME EMP TO EMP1;

-- This command gives an error:

-- SELECT * FROM EMP;

-- Reason:
-- EMP was renamed to EMP1.


-- Correct:

SELECT *
FROM EMP1;


-- ========================================================
--                    END OF DAY 03
-- ========================================================