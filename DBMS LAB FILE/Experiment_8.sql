SELECT s.name AS salesman_name, c.cust_name AS customer_name, c.city AS customer_city
FROM salesman s
JOIN customer c ON s.salesman_id = c.salesman_id
WHERE s.city = c.city;

SELECT o.ord_no, o.purch_amt, c.cust_name, c.city
FROM orders o
JOIN customer c ON o.customer_id = c.customer_id
WHERE o.purch_amt BETWEEN 500 AND 2000;

SELECT s.name AS salesman_name, c.cust_name AS customer_name
FROM salesman s
JOIN customer c ON s.salesman_id = c.salesman_id;

SELECT DISTINCT c.cust_name
FROM customer c
JOIN salesman s ON c.salesman_id = s.salesman_id
WHERE s.commission > 0.12;

SELECT DISTINCT c.cust_name
FROM customer c
JOIN salesman s ON c.salesman_id = s.salesman_id
WHERE s.city <> c.city AND s.commission > 0.12;

SELECT o.ord_no, o.ord_date, o.purch_amt, c.cust_name, s.name AS salesman_name, s.commission
FROM orders o
JOIN customer c ON o.customer_id = c.customer_id
JOIN salesman s ON o.salesman_id = s.salesman_id;

SELECT c.cust_name, c.city
FROM customer c
LEFT JOIN salesman s ON c.salesman_id = s.salesman_id
ORDER BY COALESCE(s.salesman_id, 'Own');

SELECT c.cust_name, c.city
FROM customer c
LEFT JOIN salesman s ON c.salesman_id = s.salesman_id
WHERE c.grade < 300
ORDER BY COALESCE(s.salesman_id, 'Own');

SELECT c.cust_name, c.city, o.ord_no, o.ord_date, o.purch_amt
FROM customer c
LEFT JOIN orders o ON c.customer_id = o.customer_id
ORDER BY o.ord_date;

SELECT c.cust_name, c.city, o.ord_no, o.ord_date, o.purch_amt, s.name AS salesman_name, s.commission
FROM customer c
LEFT JOIN orders o ON c.customer_id = o.customer_id
LEFT JOIN salesman s ON c.salesman_id = s.salesman_id
ORDER BY o.ord_date;

SELECT s.name AS salesman_name
FROM salesman s
LEFT JOIN customer c ON s.salesman_id = c.salesman_id
WHERE c.customer_id IS NULL
UNION
SELECT s.name AS salesman_name
FROM salesman s
WHERE s.salesman_id NOT IN (SELECT DISTINCT c.salesman_id FROM customer c);

SELECT s.name AS salesman_name
FROM salesman s
LEFT JOIN customer c ON s.salesman_id = c.salesman_id
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.ord_no IS NOT NULL
GROUP BY s.name
UNION
SELECT s.name AS salesman_name
FROM salesman s
LEFT JOIN customer c ON s.salesman_id = c.salesman_id
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.ord_no IS NULL;

SELECT s.name AS salesman_name
FROM salesman s
LEFT JOIN customer c ON s.salesman_id = c.salesman_id
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE (o.purch_amt >= 2000 OR o.purch_amt IS NULL)
GROUP BY s.name
UNION
SELECT s.name AS salesman_name
FROM salesman s
LEFT JOIN customer c ON s.salesman_id = c.salesman_id
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE c.grade IS NULL;

SELECT s.salesman_id, c.customer_id
FROM salesman s, customer c;

SELECT i.pro_name, i.pro_price, c.com_name
FROM item_mast i
JOIN company_mast c ON i.pro_com = c.com_id;

SELECT c.com_name, AVG(i.pro_price) AS avg_price
FROM item_mast i
JOIN company_mast c ON i.pro_com = c.com_id
GROUP BY c.com_name;

SELECT c.com_name
FROM item_mast i
JOIN company_mast c ON i.pro_com = c.com_id
GROUP BY c.com_name
HAVING AVG(i.pro_price) >= 350;

SELECT c.com_name, i.pro_name, i.pro_price
FROM item_mast i
JOIN company_mast c ON i.pro_com = c.com_id
WHERE (i.pro_price = (SELECT MAX(pro_price) FROM item_mast WHERE pro_com = i.pro_com));

SELECT e.emp_fname, e.emp_lname, d.dept_name
FROM emp_details e
JOIN emp_departmen d ON e.emp_dept = d.dpt_code;

SELECT e.emp_fname, e.emp_lname, d.dept_name, d.dpt_allotment
FROM emp_details e
JOIN emp_departmen d ON e.emp_dept = d.dpt_code;

SELECT e.emp_fname, e.emp_lname
FROM emp_details e
JOIN emp_departmen d ON e.emp_dept = d.dpt_code
WHERE d.dpt_allotment > 50000;

SELECT d.dept_name
FROM emp_details e
JOIN emp_departmen d ON e.emp_dept = d.dpt_code
GROUP BY d.dept_name
HAVING COUNT(e.emp_idno) > 2;