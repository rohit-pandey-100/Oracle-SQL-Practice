-- ============================================================
--              DAY 02 - ORACLE SQL PRACTICE
-- ============================================================
-- Topic  : User Management and Table Creation
-- Project: BGMI Players Database
-- ============================================================


-- ============================================================
-- 1. CHECK CURRENT USER
-- ============================================================

-- SHOW USER displays the currently connected Oracle user.

SHOW USER;


-- ============================================================
-- 2. CONNECT TO SYSTEM USER
-- ============================================================

-- SYSTEM is an administrative user.
-- Replace your_password with your actual password while running
-- this command locally.
-- Never upload your real password to GitHub.

CONNECT SYSTEM/your_password;

SHOW USER;


-- ============================================================
-- 3. CREATE A NEW USER
-- ============================================================

-- Create a new Oracle user named C##SQL.
-- The password below is only an example.

CREATE USER C##SQL IDENTIFIED BY sample_password;


-- ============================================================
-- 4. GIVE PERMISSION TO THE NEW USER
-- ============================================================

-- CONNECT permission allows the user to connect to Oracle.

GRANT CONNECT TO C##SQL;


-- ============================================================
-- 5. CONNECT TO THE NEW USER
-- ============================================================

CONNECT C##SQL/sample_password;

SHOW USER;


-- ============================================================
-- 6. CREATE BGMI PLAYERS TABLE
-- ============================================================

-- BGMI_PLAYERS table stores information about BGMI players.
--
-- PID        : BGMI Player ID
-- PNAME      : Player Name
-- AGE        : Player Age
-- GENDER     : Player Gender
-- PLEVEL     : Player Level
-- KD         : Kill/Death Ratio
-- COUNTRY    : Two-letter Country Code
-- JOIN_DATE  : Player Joining Date
-- LAST_LOGIN : Last Login Date and Time

CREATE TABLE BGMI_PLAYERS
(
    PID        NUMBER(11),
    PNAME      NVARCHAR2(15),
    AGE        NUMBER(3),
    GENDER     VARCHAR2(6),
    PLEVEL     NUMBER(3),
    KD         NUMBER(4,2),
    COUNTRY    CHAR(2),
    JOIN_DATE  DATE,
    LAST_LOGIN TIMESTAMP(0)
);


-- ============================================================
-- 7. INSERT DATA INTO BGMI PLAYERS TABLE
-- ============================================================

-- SYSDATE automatically stores the current date and time.
-- SYSTIMESTAMP automatically stores the current timestamp.

INSERT INTO BGMI_PLAYERS
VALUES
(
    51234567890,
    'Rohit',
    22,
    'Male',
    75,
    4.25,
    'IN',
    SYSDATE,
    SYSTIMESTAMP
);


-- ============================================================
-- 8. DISPLAY BGMI PLAYERS DATA
-- ============================================================

SELECT * FROM BGMI_PLAYERS;


-- ============================================================
-- 9. SQL*PLUS OUTPUT FORMATTING
-- ============================================================

-- Increase the output line width.

SET LINESIZE 200;

-- Format individual columns for better output.

COLUMN PID FORMAT 99999999999;
COLUMN PNAME FORMAT A15;
COLUMN GENDER FORMAT A6;
COLUMN COUNTRY FORMAT A7;
COLUMN PLEVEL FORMAT 999;
COLUMN KD FORMAT 99.99;


-- Display the table again after formatting.

SELECT * FROM BGMI_PLAYERS;


-- ============================================================
-- 10. SAVE THE INSERTED DATA
-- ============================================================

COMMIT;


-- ============================================================
--              ERRORS AND LEARNING NOTES
-- ============================================================

-- ERROR 1:
--
-- Initially, LEVEL was used as a column name.
--
-- LEVEL NUMBER(3)
--
-- Oracle displayed the following error:
--
-- ORA-03050: invalid identifier: "LEVEL" is a reserved word
--
-- SOLUTION:
--
-- The column name LEVEL was changed to PLEVEL.


-- ------------------------------------------------------------


-- ERROR 2:
--
-- The following command was used:
--
-- SHOW USERNAME;
--
-- This command produced an error because the correct SQL*Plus
-- command is SHOW USER.


-- ------------------------------------------------------------


-- ERROR 3:
--
-- COLOR 0A was executed directly inside SQL*Plus.
--
-- SQL*Plus displayed:
--
-- SP2-0042: unknown command
--
-- COLOR is a Windows command and is not directly an Oracle SQL
-- command.


-- ------------------------------------------------------------


-- ERROR 4:
--
-- A large PID value was initially displayed in scientific
-- notation.
--
-- Example:
--
-- 5.1235E+10
--
-- SQL*Plus COLUMN formatting was used to display the complete
-- Player ID.


-- ============================================================
--                 DAY 01 LEARNING SUMMARY
-- ============================================================

-- Topics Practiced:
--
-- 1. Connecting to an Oracle user
--
-- 2. Checking the currently connected user
--
-- 3. Disconnecting from Oracle
--
-- 4. Creating a new Oracle user
--
-- 5. Granting permission to a user
--
-- 6. Changing a user password
--
-- 7. Connecting with different Oracle users
--
-- 8. Checking tables owned by a user
--
-- 9. Creating the BGMI_PLAYERS table
--
-- 10. Practicing different Oracle datatypes:
--
--     NUMBER
--     NVARCHAR2
--     VARCHAR2
--     CHAR
--     DATE
--     TIMESTAMP
--
-- 11. Using SYSDATE
--
-- 12. Using SYSTIMESTAMP
--
-- 13. Inserting data into a table
--
-- 14. Displaying table records
--
-- 15. Formatting SQL*Plus output
--
-- 16. Understanding and correcting Oracle errors


-- ============================================================
--                    END OF DAY 02
-- ============================================================