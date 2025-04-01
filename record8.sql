/* RECORD PROGRAM 8: PL/SQL STORED PROCEDURES


PL/SQL PROGRAMS- STORED PROCEDURES

1.      Create a procedure to display all tables in the invoice database. */

mysql> create procedure shows() show tables from INVOICE  $
Query OK, 0 rows affected (0.19 sec)

mysql> call shows() $
+-------------------+
| Tables_in_INVOICE |
+-------------------+
| Invoice_item      |
| Invoice_master    |
| c1                |
| customer          |
| invpdt            |
| product           |
+-------------------+
6 rows in set (0.01 sec)

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

mysql> CREATE PROCEDURE invoice_details(inv_id INT)
    -> BEGIN
    ->     SELECT 
    ->         Invoice_master.inv_id,  
    ->         inv_date,
    ->         pname,
    ->         quantity
    ->     FROM 
    ->         Invoice_master
    ->     JOIN 
    ->         Invoice_item ON Invoice_master.inv_id = Invoice_item.inv_id
    ->     JOIN 
    ->         product ON product.pid = Invoice_item.pid
    ->     WHERE 
    ->         Invoice_master.inv_id = inv_id; 
    -> END$
Query OK, 0 rows affected (0.15 sec)

mysql> call invoice_details(101) $
+--------+------------+-------+----------+
| inv_id | inv_date   | pname | quantity |
+--------+------------+-------+----------+
|    101 | 2023-02-25 | pen   |        5 |
|    101 | 2023-02-25 | pen   |        2 |
|    101 | 2023-02-25 | soap  |        2 |
+--------+------------+-------+----------+
3 rows in set (0.00 sec)

Query OK, 0 rows affected (0.00 sec)


