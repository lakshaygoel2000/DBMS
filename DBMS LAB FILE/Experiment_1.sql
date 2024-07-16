CREATE TABLE CLIENT_MASTER(
    Client_No VARCHAR2(6), 
    Name VARCHAR2(20), 
    Address1 VARCHAR2(30), 
    Address2 VARCHAR2(30), 
    City VARCHAR2(15), 
    State VARCHAR2(15), 
    Pincode NUMBER(6), 
    Bal_Due NUMBER(10,2) 
);

CREATE TABLE PRODUCT_MASTER(

    Product_No VARCHAR2(6),
    Description VARCHAR2(20),
    Profit_percentage NUMBER(6),
    Unit_Measure VARCHAR2(10),
    Qty_On_Hand NUMBER(6),
    Reorder_Level NUMBER(6),
    Sell_Price NUMBER(7,2),
    Cost_Price NUMBER(7,2)
);

ALTER TABLE CLIENT_MASTER ADD DOB DATE;
ALTER TABLE CLIENT_MASTER MODIFY Client_No NUMBER(6);
ALTER TABLE CLIENT_MASTER DROP COLUMN DOB;
ALTER TABLE PRODUCT_MASTER RENAME COLUMN Sell_Price to SellPrice;
ALTER TABLE PRODUCT_MASTER RENAME TO PRODUCTMASTER1;
DESC PRODUCT_MASTER;
    
DROP TABLE CLIENT_MASTER AND PRODUCT_MASTER  ;  
   
DESC CLIENT_MASTER;
