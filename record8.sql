/* RECORD PROGRAM 8: PL/SQL STORED PROCEDURES


PL/SQL PROGRAMS- STORED PROCEDURES

1.      Create a procedure to display all tables in the invoice database. */

mysql> create procedure shows()
    -> select * from customer;
    -> select * from product;
    -> select * from Invoice_master;
    -> select * from Invoice_item;
    -> $

Query OK, 0 rows affected (0.11 sec)

+-----+--------+-------+
| pid | pname  | price |
+-----+--------+-------+
|   1 | pen    |    51 |
|   2 | pencil |   153 |
|   3 | soap   |   102 |
+-----+--------+-------+
3 rows in set (0.17 sec)

+--------+---------+------------+
| inv_id | cust_id | inv_date   |
+--------+---------+------------+
|    101 |    1001 | 2023-02-25 |
|    103 |    1003 | 2024-01-22 |
+--------+---------+------------+
2 rows in set (0.20 sec)

+--------+------+----------+
| inv_id | pid  | quantity |
+--------+------+----------+
|    101 |    1 |        2 |
|    101 |    1 |        5 |
|    101 |    3 |        2 |
|    103 |    1 |        5 |
+--------+------+----------+
4 rows in set (0.21 sec)

Query OK, 0 rows affected (0.01 sec)

/* 2.      Create a procedure to find greatest of 2 numbers. */

mysql> create procedure 2num(a int, b int, out max int)
    -> begin set max=a; 
    -> if b>max then 
    -> set max=b; 
    -> end if; 
    -> end$
    
mysql> select @max as 'greatest number'$
+-----------------+
| greatest number |
+-----------------+
|        50       |
+-----------------+
1 row in set (0.00 sec)
Query OK, 0 rows affected (0.14 sec)


/*3.      Create a procedure to display invoice details of a particular customer. */

CREATE PROCEDURE invoice_details(IN cust_name VARCHAR(10))
BEGIN
    SELECT
        im.inv_id,
        im.inv_date,
        p.pname,
        ii.quantity
    FROM
        Invoice_master im  
    JOIN
        Invoice_item ii ON im.inv_id = ii.inv_id  
    JOIN
        product p ON p.pid = ii.pid  
    JOIN
        customer c ON im.cust_id = c.id  
    WHERE
        c.name = cust_name;  
END;

mysql> call invoice_details('arun') $
+--------+------------+-------+----------+
| inv_id | inv_date   | pname | quantity |
+--------+------------+-------+----------+
|    101 | 2023-02-25 | pen   |        5 |
|    101 | 2023-02-25 | pen   |        2 |
|    101 | 2023-02-25 | soap  |        2 |
+--------+------------+-------+----------+
3 rows in set (0.00 sec)

Query OK, 0 rows affected (0.00 sec)
