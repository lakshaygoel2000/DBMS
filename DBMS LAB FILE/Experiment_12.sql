CREATE TABLE supplier (
    supplier_id NUMBER PRIMARY KEY,
    supplier_name VARCHAR2(4000),
    supplier_address VARCHAR2(4000)
);

CREATE TABLE audits (
    table_name VARCHAR2(100),
    transaction_name VARCHAR2(100),
    transaction_date DATE
);
INSERT INTO supplier (supplier_id, supplier_name, supplier_address)
VALUES (1, 'ABC Suppliers', '123 Main Street');

INSERT INTO supplier (supplier_id, supplier_name, supplier_address)
VALUES (2, 'XYZ Enterprises', '456 Elm Avenue');

SELECT * FROM supplier;
CREATE OR REPLACE TRIGGER cust_audit_trig
AFTER
INSERT
ON supplier
FOR EACH ROW
DECLARE
    l_transaction VARCHAR(10);
BEGIN
    l_transaction := 'INSERT';
    INSERT INTO audits (table_name, transaction_name, transaction_date)
    VALUES ('SUPPLIER', l_transaction, SYSDATE);
END;
INSERT INTO supplier (supplier_id, supplier_name, supplier_address)
VALUES (3, 'Book Suppliers', '12 Street');

SELECT * FROM audits;


DECLARE
    total_rows NUMBER(2);
BEGIN
    UPDATE supplier
    SET supplier_id = supplier_id + 500;
    IF SQL%NOTFOUND THEN
        DBMS_OUTPUT.PUT_LINE('Not found');
    ELSIF SQL%FOUND THEN 
        total_rows := SQL%ROWCOUNT;
        DBMS_OUTPUT.PUT_LINE(total_rows || ' row(s) updated');
    END IF;
END;