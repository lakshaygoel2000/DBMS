CREATE TABLE Students (
    Roll NUMBER,
    F_Name VARCHAR2(25),
    M_Name VARCHAR2(25),
    L_Name VARCHAR2(25),
    Sec CHAR(1),
    City VARCHAR2(25),
    Area VARCHAR2(25),
    HouseNo VARCHAR2(25),
    Div NUMBER
);

INSERT INTO Students (Roll, F_Name, M_Name, L_Name, Sec, City, Area, HouseNo, Div)
VALUES (1, 'Akash', 'Kumar', 'Jian', 'A', 'Ghaziabad', 'Rakesh Marg', 'C-355', 1);
INSERT INTO Students (Roll, F_Name, M_Name, L_Name, Sec, City, Area, HouseNo, Div)
VALUES (2, 'Manav', 'Mohan', 'Sharma', 'A', 'Ghaziabad', 'Raj nagar', 'D-211', 2);
INSERT INTO Students (Roll, F_Name, M_Name, L_Name, Sec, City, Area, HouseNo, Div)
VALUES (3, 'Chandra', 'Mohan', 'Batra', 'B', 'Meerut', 'Minto Road', 'A-201', 3);
INSERT INTO Students (Roll, F_Name, M_Name, L_Name, Sec, City, Area, HouseNo, Div)
VALUES (4, 'Rakesh', 'Chandra', 'Gupta', 'B', 'Kanpur', 'Nehru Marg', 'A-145', NULL);
INSERT INTO Students (Roll, F_Name, M_Name, L_Name, Sec, City, Area, HouseNo, Div)
VALUES (5, 'Sagar', 'Pratap', 'Singh', 'A', 'Meerut', 'Gandhi marg', 'C-35', 0);

SELECT ROLL, F_NAME || ' ' || M_NAME || ' ' || L_NAME AS "NAME" FROM STUDENTS;
SELECT ROLL, F_NAME || ' ' || M_NAME || ' ' || L_NAME AS "NAME", HOUSENO || ', ' || AREA || ', ' || CITY AS "ADDRESS" FROM STUDENTS;
SELECT ROLL, SUBSTR(F_NAME,1,1) || '.' ||SUBSTR(M_NAME,1,1) || ' ' || L_NAME AS "NAME" FROM STUDENTS;
SELECT * FROM STUDENTS ORDER BY SEC ASC;
SELECT * FROM STUDENTS ORDER BY SEC DESC;
SELECT * FROM STUDENTS ORDER BY SEC, F_NAME;
-- SELECT ROLL, F_NAME || ' ' || M_NAME || ' ' || L_NAME AS "NAME", SUBSTR(CITY,1,5) FROM STUDENTS;
SELECT * FROM STUDENTS WHERE DIV IS NULL;
SELECT DISTINCT CITY FROM STUDENTS;
SELECT ROLL, F.NAME, CASE WHEN DIV = 1 THEN 'FIRST' WHEN DIV=2 THEN 'SECOND' WHEN DIV=3 THEN 'THIRD' WHEN DIV=O THEN 'FAIL' ELSE 'NOT AWARDED' END AS Division FROM STUDENTS;
SELECT ROLL, F.NAME, CASE WHEN SEC = 'A' THEN '1' WHEN SEC= 'B' THEN '2' END AS SEC FROM STUDENTS;