CREATE OR REPLACE PROCEDURE find_minimum (
    num1 IN NUMBER,
    num2 IN NUMBER,
    min_value OUT NUMBER
) IS
BEGIN
    IF num1 < num2 THEN
        min_value := num1;
    ELSE
        min_value := num2;
    END IF;
END;


DECLARE
    num1 NUMBER := 10;
    num2 NUMBER := 20;
    result NUMBER;
BEGIN
    find_minimum(num1, num2, result);
    DBMS_OUTPUT.PUT_LINE('The minimum value is: ' || result);
END;



CREATE OR REPLACE PROCEDURE squareNum (
   x IN OUT number
) IS
BEGIN
    x := x*x;
    END ;

DECLARE
    a number;
BEGIN
a:= 23;
squareNum(a);
DBMS_OUTPUT.PUT_LINE('The square value is: ' || a);
END;


create or replace function total1
return number is
total number(2) := 0;

begin
 select count(*) into total
 from dual;

return total;
end;

declare c number(2);
begin
 c:= total1();
 DBMS_OUTPUT.PUT_LINE('The total value is: ' || c);
end;

DECLARE 
a number;
b number;
c number;

FUNCTION find_min (num1 in number,
    return number is
    z number;

BEGIN
    IF num1 < num2 THEN
        c := num1;
    ELSE
        c := num2;
    END IF;
END;

DROP FUNCTION FUNCTION_NAME