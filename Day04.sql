/*
===============================================================================
                           ORACLE SQL TRAINING
===============================================================================

File Name   : Day04.sql
Topic       : Table Creation, INSERT, Substitution Variables, DATE & TIME
Author      : Rohit Pandey
Day         : 04

Topics Covered:
1. Checking Current User
2. Displaying All User Tables
3. Creating a Table
4. Inserting Single Row
5. Inserting Multiple Rows
6. Inserting Data into Specific Columns
7. COMMIT Command
8. Displaying Table Data
9. Substitution Variables (&)
10. Reusing Previous SQL Command
11. Creating Table with DATE Datatype
12. Inserting Date Values
13. TO_DATE() Function
14. SYSDATE
15. SYSTIMESTAMP

===============================================================================
*/


-- =============================================================================
-- 1. CHECK CURRENT USER
-- =============================================================================

SHOW USER;


-- =============================================================================
-- 2. DISPLAY ALL TABLES OF CURRENT USER
-- =============================================================================

SELECT TABLE_NAME
FROM USER_TABLES;


-- =============================================================================
-- 3. CREATE STUDENT2 TABLE
-- =============================================================================

CREATE TABLE STUDENT2
(
    SNAME VARCHAR2(10),
    SID   NUMBER(4),
    M1    NUMBER(5,2),
    M2    NUMBER(5,2),
    M3    NUMBER(5,2)
);


-- =============================================================================
-- 4. INSERT A SINGLE ROW
-- =============================================================================

INSERT INTO STUDENT2
VALUES ('ROHIT', 1001, 95.55, 87.34, 77.45);


-- =============================================================================
-- 5. INSERT MULTIPLE ROWS
-- =============================================================================

INSERT INTO STUDENT2
VALUES
    ('RANI', 1002, 90.55, 80.34, 45.45),
    ('RONAK', 1003, 80.85, 87.34, 74.45),
    ('KUSHI', 1004, 91.55, 80.34, 66.45);


-- =============================================================================
-- 6. INSERT DATA INTO SPECIFIC COLUMNS
-- =============================================================================

-- Here, SNAME is not provided.
-- Therefore, Oracle automatically stores NULL in the SNAME column.

INSERT INTO STUDENT2 (SID, M1, M2, M3)
VALUES
    (1005, 65.66, 45.55, 55.65),
    (1006, 69.66, 45.57, 70.65);


-- =============================================================================
-- 7. SAVE CHANGES PERMANENTLY
-- =============================================================================

COMMIT;


-- =============================================================================
-- 8. DISPLAY ALL DATA FROM STUDENT2
-- =============================================================================

SELECT *
FROM STUDENT2;


-- =============================================================================
-- 9. INSERT DATA USING SUBSTITUTION VARIABLES
-- =============================================================================

/*
Substitution variables allow the user to enter values at runtime.

Important:

For VARCHAR2 data:
Enter the value inside single quotes.

Example:
'RONISH'

For NUMBER data:
Enter the value without single quotes.

Example:
1007
*/

INSERT INTO STUDENT2
VALUES (&SNAME, &SID, &M1, &M2, &M3);


-- =============================================================================
-- 10. REUSE THE PREVIOUS SQL COMMAND
-- =============================================================================

/*
In SQL*Plus, forward slash (/) executes the SQL command
currently stored in the SQL buffer.

Example:

SQL> /

The previous INSERT command will execute again and Oracle
will ask for new values.
*/


-- =============================================================================
-- 11. SAVE THE INSERTED DATA
-- =============================================================================

COMMIT;


-- =============================================================================
-- 12. DISPLAY STUDENT2 TABLE DATA
-- =============================================================================

SELECT *
FROM STUDENT2;


-- =============================================================================
-- 13. CREATE EMP3 TABLE WITH DATE DATATYPE
-- =============================================================================

CREATE TABLE EMP3
(
    EID      NUMBER(4),
    ENAME    VARCHAR2(10),
    SALARY   NUMBER(8),
    JOIDATE  DATE
);


-- =============================================================================
-- 14. INSERT DATE VALUE DIRECTLY
-- =============================================================================

/*
A date value can be written inside single quotes.

However, this method depends on the Oracle session's
date format (NLS_DATE_FORMAT).
*/

INSERT INTO EMP3
VALUES (1001, 'MONIKA', 600000, '12-DEC-2004');


-- =============================================================================
-- 15. INSERT DATE USING TO_DATE()
-- =============================================================================

/*
TO_DATE() explicitly converts a character value into DATE.

Using a format model is safer and clearer.
*/

INSERT INTO EMP3
VALUES
(
    1002,
    'SONU',
    450000,
    TO_DATE('12-DEC-2004', 'DD-MON-YYYY')
);


-- =============================================================================
-- 16. INSERT CURRENT SYSTEM DATE USING SYSDATE
-- =============================================================================

/*
SYSDATE returns the current date and time
from the database server.
*/

INSERT INTO EMP3
VALUES (1003, 'MONU', 540000, SYSDATE);


-- =============================================================================
-- 17. INSERT CURRENT TIMESTAMP USING SYSTIMESTAMP
-- =============================================================================

/*
SYSTIMESTAMP returns:
- Current Date
- Current Time
- Fractional Seconds
- Time Zone Information

Note:
EMP3.JOIDATE is a DATE column, so when SYSTIMESTAMP is inserted
into it, Oracle converts the value to DATE.
*/

INSERT INTO EMP3
VALUES (1004, 'ROHAN', 550000, SYSTIMESTAMP);


-- =============================================================================
-- 18. SAVE ALL CHANGES
-- =============================================================================

COMMIT;


-- =============================================================================
-- 19. DISPLAY EMP3 TABLE DATA
-- =============================================================================

SELECT *
FROM EMP3;


-- =============================================================================
-- 20. DISPLAY CURRENT SYSTEM DATE
-- =============================================================================

SELECT SYSDATE
FROM DUAL;


-- =============================================================================
-- 21. DISPLAY CURRENT SYSTEM TIMESTAMP
-- =============================================================================

SELECT SYSTIMESTAMP
FROM DUAL;


/*
===============================================================================
                              IMPORTANT NOTES
===============================================================================

1. VARCHAR2 values should be written inside single quotes.

       'ROHIT'

2. NUMBER values do not require single quotes.

       1001

3. COMMIT permanently saves transaction changes.

4. SYSDATE returns the current database server date and time.

5. SYSTIMESTAMP returns date, time, fractional seconds,
   and time zone information.

6. TO_DATE() converts a character value into the DATE datatype.

7. The forward slash (/) in SQL*Plus executes the SQL statement
   currently stored in the SQL buffer.

8. When inserting data into selected columns, unspecified columns
   receive NULL if allowed.

===============================================================================
                              END OF DAY 04
===============================================================================
*/