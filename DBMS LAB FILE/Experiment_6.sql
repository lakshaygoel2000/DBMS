CREATE TABLE CLIENT_MASTER (
Client_No VARCHAR2(6) PRIMARY KEY,
Name VARCHAR2(20) NOT NULL,
CITY VARCHAR2(20) CHECK (CITY IN ('Delhi', 'Mumbai', 'Chennai')),
Pincode NUMBER(6),
State VARCHAR2(20),
BALDUE NUMBER(10,2),
Email VARCHAR2(30) UNIQUE
);
CREATE TABLE PRODUCT_MASTER (
Product_No VARCHAR2(6) PRIMARY KEY,
Name VARCHAR2(20) NOT NULL,
UnitMeasure VARCHAR2(10) NOT NULL,
QtyOnHand NUMBER(8) NOT NULL,
ReorderLevel NUMBER(8) NOT NULL,
SellPrice NUMBER(8,2) NOT NULL CHECK (SellPrice > 0),
CostPrice NUMBER(8,2) NOT NULL CHECK (CostPrice > 0),
CHECK (QtyOnHand >= ReorderLevel)
);
CREATE TABLE SALESMAN_MASTER (
Salesman_No VARCHAR2(6) PRIMARY KEY CHECK (Salesman_No LIKE 'S%'),
Sal_name VARCHAR2(20) NOT NULL,
Address VARCHAR2(40) NOT NULL,
City VARCHAR2(20),
State VARCHAR2(20),
Pincode NUMBER(6),
Sal_Amount NUMBER(8,2) NOT NULL CHECK (Sal_Amount > 0),
Tgt_to_get NUMBER(8,2) NOT NULL CHECK (Tgt_to_get > 0),
Ytd_Sales NUMBER(8,2) NOT NULL CHECK (Ytd_Sales > 0),
Remarks VARCHAR2(30)
);
CREATE TABLE SALES_ORDER (
Order_No VARCHAR2(6) PRIMARY KEY CHECK (Order_No LIKE 'O%'),
Order_Date DATE NOT NULL,
Client_No VARCHAR2(6),
Dely_add VARCHAR2(25),
Salesman_No VARCHAR2(6),
Dely_type CHAR(1) DEFAULT 'F' CHECK (Dely_type IN ('P', 'F')),
Billed_yn CHAR(1) CHECK (Billed_yn IN ('Y', 'N')),
Dely_Date DATE,
Order_Status VARCHAR2(10) CHECK (Order_Status IN ('In Process(IP)', 'Fulfilled(F)', 'Canceled(C)')),
FOREIGN KEY (Client_No) REFERENCES CLIENT_MASTER(Client_No),
FOREIGN KEY (Salesman_No) REFERENCES SALESMAN_MASTER(Salesman_No),
CHECK (Dely_Date >= Order_Date)
);
CREATE TABLE SALES_ORDER_DETAILS (
Order_No VARCHAR2(6),
Product_No VARCHAR2(6),
Qty_Order NUMBER(8),
Qty_disp NUMBER(8),
PRIMARY KEY (Order_No, Product_No),
FOREIGN KEY (Order_No) REFERENCES SALES_ORDER(Order_No),
FOREIGN KEY (Product_No) REFERENCES PRODUCT_MASTER(Product_No)
);
--Data for CLIENT_MASTER
INSERT INTO CLIENT_MASTER (Client_No, Name, CITY, Pincode, State, BALDUE, Email)
VALUES ('C00001', 'Pankaj Sharma', 'Delhi', 400054, 'Delhi', 15000, 'pk@gmail.com');
INSERT INTO CLIENT_MASTER (Client_No, Name, CITY, Pincode, State, BALDUE, Email)
VALUES ('C00002', 'Yogesh Sharma', 'Delhi', 780001, 'Delhi', 0, 'ys@gmail.com');
INSERT INTO CLIENT_MASTER (Client_No, Name, CITY, Pincode, State, BALDUE, Email)
VALUES ('C00003', 'Aditya Singh', 'Mumbai', 400057, 'Maharashtra', 5000, 'as@gmail.com');
INSERT INTO CLIENT_MASTER (Client_No, Name, CITY, Pincode, State, BALDUE, Email)
VALUES ('C00004', 'Ashwini Joshi', 'Chennai', 560001, 'Tamil Nadu', 0, 'aj@gmail.com');
INSERT INTO CLIENT_MASTER (Client_No, Name, CITY, Pincode, State, BALDUE, Email)
VALUES ('C00005', 'Neha Sharma', 'Mumbai', 400060, 'Maharashtra', 2000, 'ns@gmail.com');
INSERT INTO CLIENT_MASTER (Client_No, Name, CITY, Pincode, State, BALDUE, Email)
VALUES ('C00006', 'Divya Gupta', 'Chennai', 560050, 'Tamil Nadu', 0, NULL);
--Data for PRODUCT_MASTER
INSERT INTO PRODUCT_MASTER (Product_No, Name, UnitMeasure, QtyOnHand, ReorderLevel, SellPrice, CostPrice)
VALUES ('P00001', 'T-Shirt', 'Piece', 200, 50, 350, 250);
INSERT INTO PRODUCT_MASTER (Product_No, Name, UnitMeasure, QtyOnHand, ReorderLevel, SellPrice, CostPrice)
VALUES ('P03453', 'Shirt', 'Piece', 150, 50, 500, 350);
INSERT INTO PRODUCT_MASTER (Product_No, Name, UnitMeasure, QtyOnHand, ReorderLevel, SellPrice, CostPrice)
VALUES ('P06734', 'Cotton Jeans', 'Piece', 100, 20, 600, 450);
INSERT INTO PRODUCT_MASTER (Product_No, Name, UnitMeasure, QtyOnHand, ReorderLevel, SellPrice, CostPrice)
VALUES ('P07865', 'Jeans', 'Piece', 100, 20, 750, 500);
INSERT INTO PRODUCT_MASTER (Product_No, Name, UnitMeasure, QtyOnHand, ReorderLevel, SellPrice, CostPrice)
VALUES ('P07868', 'Trouser', 'Piece', 150, 50, 850, 550);
INSERT INTO PRODUCT_MASTER (Product_No, Name, UnitMeasure, QtyOnHand, ReorderLevel, SellPrice, CostPrice)
VALUES ('P07885', 'Pull Over', 'Piece', 80, 30, 700, 450);
INSERT INTO PRODUCT_MASTER (Product_No, Name, UnitMeasure, QtyOnHand, ReorderLevel, SellPrice, CostPrice)
VALUES ('P07965', 'Denim Shirts', 'Piece', 100, 40, 350, 250);
INSERT INTO PRODUCT_MASTER (Product_No, Name, UnitMeasure, QtyOnHand, ReorderLevel, SellPrice, CostPrice)
VALUES ('P07975', 'Lycra Tops', 'Piece', 70, 30, 300, 175);
INSERT INTO PRODUCT_MASTER (Product_No, Name, UnitMeasure, QtyOnHand, ReorderLevel, SellPrice, CostPrice)
VALUES ('P08865', 'Skirts', 'Piece', 75, 30, 450, 300);
--Data for SALESMAN_MASTER
INSERT INTO SALESMAN_MASTER (Salesman_No, Sal_name, Address, City, Pincode, State, Sal_Amount, Tgt_to_get, Ytd_Sales, Remarks)
VALUES ('S00001', 'Kiran', 'A/14 worli', 'Mumbai', 400002, 'Mah', 3000, 100, 50, 'Good');
INSERT INTO SALESMAN_MASTER (Salesman_No, Sal_name, Address, City, Pincode, State, Sal_Amount, Tgt_to_get, Ytd_Sales, Remarks)
VALUES ('S00002', 'Manish', '65, nariman', 'Mumbai', 400001, 'Mah', 3000, 200, 100, 'Good');
INSERT INTO SALESMAN_MASTER (Salesman_No, Sal_name, Address, City, Pincode, State, Sal_Amount, Tgt_to_get, Ytd_Sales, Remarks)
VALUES ('S00003', 'Ravi', 'P-7 Bandra', 'Mumbai', 400032, 'Mah', 3000, 200, 100, 'Good');
INSERT INTO SALESMAN_MASTER (Salesman_No, Sal_name, Address, City, Pincode, State, Sal_Amount, Tgt_to_get, Ytd_Sales, Remarks)
VALUES ('S00004', 'Ashish', 'A/5 Juhu Bombay', 'Mumbai', 400044, 'Mah', 3500, 200, 150, 'Good');
--Data for SALES_ORDER TABLE
INSERT INTO SALES_ORDER (Order_No, Order_Date, Client_No, Dely_type, Billed_yn, Salesman_No, Dely_Date, Order_Status)
VALUES ('O19001', TO_DATE('12-jan-21', 'DD-MON-YY'), 'C00001', 'F', 'N', 'S00001', TO_DATE('20-jan-21', 'DD-MON-YY'), 'IP');
INSERT INTO SALES_ORDER (Order_No, Order_Date, Client_No, Dely_type, Billed_yn, Salesman_No, Dely_Date, Order_Status)
VALUES ('O19002', TO_DATE('25-jan-21', 'DD-MON-YY'), 'C00002', 'P', 'N', 'S00002', TO_DATE('27-jan-21', 'DD-MON-YY'), 'C');
INSERT INTO SALES_ORDER (Order_No, Order_Date, Client_No, Dely_type, Billed_yn, Salesman_No, Dely_Date, Order_Status)
VALUES ('O16865', TO_DATE('18-feb-21', 'DD-MON-YY'), 'C00003', 'F', 'Y', 'S00003', TO_DATE('20-feb-21', 'DD-MON-YY'), 'F');
INSERT INTO SALES_ORDER (Order_No, Order_Date, Client_No, Dely_type, Billed_yn, Salesman_No, Dely_Date, Order_Status)
VALUES ('O19003', TO_DATE('03-apr-21', 'DD-MON-YY'), 'C00001', 'F', 'Y', 'S00001', TO_DATE('07-apr-21', 'DD-MON-YY'), 'F');
INSERT INTO SALES_ORDER (Order_No, Order_Date, Client_No, Dely_type, Billed_yn, Salesman_No, Dely_Date, Order_Status)
VALUES ('O46866', TO_DATE('20-may-21', 'DD-MON-YY'), 'C00004', 'P', 'N', 'S00002', TO_DATE('22-may-21', 'DD-MON-YY'), 'C');
INSERT INTO SALES_ORDER (Order_No, Order_Date, Client_No, Dely_type, Billed_yn, Salesman_No, Dely_Date, Order_Status)
VALUES ('O10008', TO_DATE('24-may-21', 'DD-MON-YY'), 'C00005', 'F', 'N', 'S00004', TO_DATE('26-may-21', 'DD-MON-YY'), 'IP');
--Data for SALES_ORDER_DETAILS
INSERT INTO SALES_ORDER_DETAILS (Order_No, Product_No, Qty_Order, Qty_disp)
VALUES ('O19001', 'P00001', 4, 4);
INSERT INTO SALES_ORDER_DETAILS (Order_No, Product_No, Qty_Order, Qty_disp)
VALUES ('O19001', 'P07965', 2, 1);
INSERT INTO SALES_ORDER_DETAILS (Order_No, Product_No, Qty_Order, Qty_disp)
VALUES ('O19001', 'P07885', 2, 1);
INSERT INTO SALES_ORDER_DETAILS (Order_No, Product_No, Qty_Order, Qty_disp)
VALUES ('O19002', 'P00001', 10, 0);
INSERT INTO SALES_ORDER_DETAILS (Order_No, Product_No, Qty_Order, Qty_disp)
VALUES ('O46865', 'P07868', 3, 3);
INSERT INTO SALES_ORDER_DETAILS (Order_No, Product_No, Qty_Order, Qty_disp)
VALUES ('O46865', 'P07885', 10, 10);
INSERT INTO SALES_ORDER_DETAILS (Order_No, Product_No, Qty_Order, Qty_disp)
VALUES ('O19003', 'P00001', 4, 4);
INSERT INTO SALES_ORDER_DETAILS (Order_No, Product_No, Qty_Order, Qty_disp)
VALUES ('O19003', 'P03453', 2, 2);