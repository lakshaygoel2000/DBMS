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

CREATE TABLE PRODUCT_MASTER(
    ProductNo VARCHAR2(6),
    Description VARCHAR2(15),
    Profitpercentage NUMBER(4,2),
    UnitMeasure VARCHAR2(10),
    QtyOnHand NUMBER(8,2),
    ReorderLevel NUMBER(8,2),
    SellPrice NUMBER(8,2),
    CostPrice NUMBER(8,2)
);

INSERT INTO PRODUCT_MASTER (ProductNo, Description, Profitpercentage, UnitMeasure, QtyOnHand, SellPrice, ReorderLevel, CostPrice)
VALUES('P00001', '1.44floppies', 5, 'Piece', 200, 350, 50, 250);
INSERT INTO PRODUCT_MASTER (ProductNo, Description, Profitpercentage, UnitMeasure, QtyOnHand, SellPrice, ReorderLevel, CostPrice)
VALUES('P03453', 'Monitors', 6, 'Piece', 150, 500, 50, 350);
INSERT INTO PRODUCT_MASTER (ProductNo, Description, Profitpercentage, UnitMeasure, QtyOnHand, SellPrice, ReorderLevel, CostPrice)
VALUES('P06734', 'Mouse', 5, 'Piece', 100, 600, 20, 450);
INSERT INTO PRODUCT_MASTER (ProductNo, Description, Profitpercentage, UnitMeasure, QtyOnHand, SellPrice, ReorderLevel, CostPrice)
VALUES('P07865', '1.22floppies', 5, 'Piece', 100, 750, 20, 500);
INSERT INTO PRODUCT_MASTER (ProductNo, Description, Profitpercentage, UnitMeasure, QtyOnHand, SellPrice, ReorderLevel, CostPrice)
VALUES('P07868', 'Keyboards', 2, 'Piece', 150, 850, 50, 550);
INSERT INTO PRODUCT_MASTER (ProductNo, Description, Profitpercentage, UnitMeasure, QtyOnHand, SellPrice, ReorderLevel, CostPrice)
VALUES('P07885', 'CDDrive', 2.5, 'Piece', 80, 700, 30, 450);
INSERT INTO PRODUCT_MASTER (ProductNo, Description, Profitpercentage, UnitMeasure, QtyOnHand, SellPrice, ReorderLevel, CostPrice)
VALUES('P07965', '540 HDD', 4, 'Piece', 100, 350, 40, 250);
INSERT INTO PRODUCT_MASTER (ProductNo, Description, Profitpercentage, UnitMeasure, QtyOnHand, SellPrice, ReorderLevel, CostPrice)
VALUES('P07975', '1.44Drive', 5, 'Piece', 70, 300, 30, 175);
INSERT INTO PRODUCT_MASTER (ProductNo, Description, Profitpercentage, UnitMeasure, QtyOnHand, SellPrice, ReorderLevel, CostPrice)
VALUES('P08865', '1.22Drive', 5, 'Piece', 75, 450, 30, 300);


SELECT NAME FROM CLIENT_MASTER; 
SELECT NAME, CITY FROM CLIENT_MASTER; 
SELECT DESCRIPTION "AVAILABLE PRODUCTS" FROM PRODUCT_MASTER; 
SELECT * FROM CLIENT_MASTER WHERE CITY ='Mumbai'; 
SELECT * FROM CLIENT_MASTER WHERE CLIENT_NO IN ('C00001','C00002'); 
SELECT * FROM PRODUCT_MASTER WHERE DESCRIPTION IN ('1.44Drive','1.22Drive');
SELECT * FROM PRODUCT_MASTER WHERE SellPrice > 500;
SELECT * FROM CLIENT_MASTER WHERE CITY IN ('Mumbai','Delhi','Madras'); 
SELECT * FROM PRODUCT_MASTER WHERE SellPrice > 200 AND SellPrice <=500;
SELECT NAME, CITY, STATE FROM CLIENT_MASTER WHERE NOT STATE = 'Maharashtra'; 
UPDATE PRODUCT_MASTER SET SellPrice = 1150 WHERE Description = '1.44floppies';
DELETE FROM CLIENT_MASTER WHERE CLIENT_NO = 'C00001';
SELECT PRODUCTNO, DESCRIPTION,SELLPRICE *15 AS "ORIGINAL SELLING PRICE" FROM PRODUCT_MASTER WHERE SELLPRICE > 150;
SELECT NAME, CITY FROM CLIENT_MASTER WHERE CITY LIKE '_a%';
SELECT NAME FROM CLIENT_MASTER WHERE NAME LIKE '_a%';
SELECT * FROM PRODUCT_MASTER ORDER BY DESCRIPTION;
SELECT COUNT(DESCRIPTION) "TOTAL PRODUCTS" FROM PRODUCT_MASTER;
SELECT AVG(COSTPRICE) AS Average_price FROM PRODUCT_MASTER;
SELECT MIN(COSTPRICE) AS Minimum_price FROM PRODUCT_MASTER;
SELECT MIN(COSTPRICE) AS min_price, MAX(COSTPRICE) AS max_price FROM PRODUCT_MASTER;
SELECT COUNT(DESCRIPTION) FROM PRODUCT_MASTER WHERE COSTPRICE > 150;
SELECT DESCRIPTION FROM PRODUCT_MASTER ORDER BY SELLPRICE ASC;
SELECT DESCRIPTION FROM PRODUCT_MASTER ORDER BY SELLPRICE DESC;
