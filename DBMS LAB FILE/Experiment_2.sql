CREATE TABLE CLIENT_MASTER(
    Client_No VARCHAR2(6), 
    Name VARCHAR2(20), 
    City VARCHAR2(15), 
    Pincode NUMBER(6), 
    State VARCHAR2(15), 
    Bal_Due NUMBER(10,2) 
);
INSERT INTO CLIENT_MASTER (Client_No, Name, City, Pincode, State, Bal_Due)
VALUES('C00001', 'Ivan Bayross', 'Mumbai', '400054', 'Maharashtra', 15000);
INSERT INTO CLIENT_MASTER (Client_No, Name, City, Pincode, State, Bal_Due)
VALUES('C00002', 'Mamta Mazumdar', 'Madras', '780001', 'Tamil Nadu', 0);
INSERT INTO CLIENT_MASTER (Client_No, Name, City, Pincode, State, Bal_Due)
VALUES('C00003', 'Chhaya Bankar', 'Mumbai', '400057', 'Maharashtra', 5000);
INSERT INTO CLIENT_MASTER (Client_No, Name, City, Pincode, State, Bal_Due)
VALUES('C00004', 'Ashwini Joshi', 'Bangalore', '560001', 'Karnataka', 0);
INSERT INTO CLIENT_MASTER (Client_No, Name, City, Pincode, State, Bal_Due)
VALUES('C00005', 'Hansel Colaco', 'Mumbai', '400060', 'Maharashtra', 2000);
INSERT INTO CLIENT_MASTER (Client_No, Name, City, Pincode, State, Bal_Due)
VALUES('C00006', 'Deepak Sharma', 'Mangalore', '560050', 'Karnataka', 0);

SELECT NAME FROM CLIENT_MASTER;
SELECT * FROM CLIENT_MASTER;
SELECT NAME, CITY, STATE FROM CLIENT_MASTER;
SELECT * FROM CLIENT_MASTER WHERE CITY = 'Mumbai';
SELECT * FROM CLIENT_MASTER WHERE Bal_Due = 15000;
SELECT * FROM CLIENT_MASTER WHERE NAME LIKE 'M%';
SELECT * FROM CLIENT_MASTER WHERE STATE IN ('Maharashtra','Karnataka');

UPDATE CLIENT_MASTER SET CITY = 'Bangalore' WHERE CLIENT_NO = 'C00005';
UPDATE CLIENT_MASTER SET Bal_Due = 1000 WHERE CLIENT_NO = 'C00001';
UPDATE CLIENT_MASTER SET CITY = 'Pune' WHERE CLIENT_NO = 'C00001';

DELETE FROM CLIENT_MASTER WHERE STATE = 'Tamil Nadu';
DELETE FROM CLIENT_MASTER;
