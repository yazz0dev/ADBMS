#2.  DML COMMANDS

  a)  DML -INSERT

                     Insert values in INVOICE database. 

Value insertion................
-> customer_id  10001, 10002, 10003 etc
-> in_id   101,102, 103, etc
-> name of city (calicut, ekm, tvm, etc..)
-> some quantity should be less than 2
-> product names....pen, pencil, soap, etc..
-> some phone number should be null
-> some price between 50 rs and 150 rs
-> inv_date between 1st jan 2023 to 31st dec 2024
-> some customers purchase more than 2 products#

mysql> insert into customer values(1001, 'arun' , 'mukkam' ,'calicut', 987654321);
Query OK, 1 row affected (0.12 sec)

mysql> insert into customer(id,name,address,city) values(1003, 'akil' , 'palazhi' ,'calicut');
Query OK, 1 row affected (0.12 sec)

mysql> insert into customer values(1002, 'ajay' , 'ponoor' ,'calicut', 980694361);
Query OK, 1 row affected (0.16 sec)

mysql> insert into product values(1, 'pen' , 50);
Query OK, 1 row affected (0.08 sec)

mysql> insert into product values(2, 'pencil' , 100);
Query OK, 1 row affected (0.12 sec)

mysql> insert into product values(3, 'soap' , 120);
Query OK, 1 row affected (0.11 sec)

mysql> insert into Invoice_master values(101, 1001 , '2023-02-25');
Query OK, 1 row affected (0.11 sec)

mysql> insert into Invoice_master values(102, 1002 , '2024-03-15');
Query OK, 1 row affected (0.11 sec)

mysql> insert into Invoice_master values(103, 1003 , '2024-01-22');
Query OK, 1 row affected (0.56 sec)


mysql> insert into Invoice_item values(101, 1, 1);
Query OK, 1 row affected (0.13 sec)

mysql> insert into Invoice_item values(101, 2, 5);
Query OK, 1 row affected (0.16 sec)

mysql> insert into Invoice_item values(102, 3, 5);
Query OK, 1 row affected (0.65 sec)

mysql> insert into Invoice_item values(103, 1, 2);
Query OK, 1 row affected (0.13 sec)

mysql> select * from customer;
+------+------+---------+---------+-----------+
| id   | name | address | city    | phno      |
+------+------+---------+---------+-----------+
| 1001 | arun | mukkam  | calicut | 987654321 |
| 1002 | ajay | ponoor  | calicut | 980694361 |
| 1003 | akil | palazhi | calicut |      NULL |
+------+------+---------+---------+-----------+
3 rows in set (0.00 sec)

mysql> select * from product;
+-----+--------+-------+
| pid | pname  | price |
+-----+--------+-------+
|   1 | pen    |    50 |
|   2 | pencil |   100 |
|   3 | soap   |   120 |
+-----+--------+-------+
3 rows in set (0.00 sec)

mysql> select * from Invoice_master;
+--------+---------+------------+
| inv_id | cust_id | inv_date   |
+--------+---------+------------+
|    101 |    1001 | 2023-02-25 |
|    102 |    1002 | 2024-03-15 |
|    103 |    1003 | 2024-01-22 |
+--------+---------+------------+
3 rows in set (0.00 sec)

mysql> select * from Invoice_item;
+--------+------+----------+
| inv_id | pid  | quantity |
+--------+------+----------+
|    101 |    1 |        1 |
|    101 |    2 |        5 |
|    102 |    3 |        5 |
|    103 |    1 |        2 |
+--------+------+----------+
4 rows in set (0.00 sec)





#b) DML - UPDATE 

              1. Update the price of a particular product. 
              2. Change the name of city ‘calicut’ to ‘kozhikode’ in the customer table. 
              3. Update all prices with 2% of its original price. 
              4. Change the address, city, phone number of a particular customer. 
              5. Change the quantity of a purchased product of inv_id ‘101’#



mysql> update product set price=89 where pid=2;
Query OK, 1 row affected (0.09 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update customer set city='calicut' where city='kozhikode';
Query OK, 0 rows affected (0.00 sec)
Rows matched: 0  Changed: 0  Warnings: 0

mysql> update product set price=100 where pid=3;
Query OK, 1 row affected (0.52 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update product set price=price*1.02;
Query OK, 3 rows affected (0.08 sec)
Rows matched: 3  Changed: 3  Warnings: 0

mysql> select * from product;
+-----+--------+-------+
| pid | pname  | price |
+-----+--------+-------+
|   1 | pen    |    51 |
|   2 | pencil |   153 |
|   3 | soap   |   102 |
+-----+--------+-------+
3 rows in set (0.00 sec)


#c) DML - DELETE 

#1. Delete the record of customer id ‘10001’. 
              
         
#2. Delete all purchase details of items its quantity less than 2. 
              mysql> DELETE FROM Invoice_item WHERE quantity < 2;
Query OK, 1 row affected (0.10 sec)

mysql> select * from Invoice_item;
+--------+------+----------+
| inv_id | pid  | quantity |
+--------+------+----------+
|    101 |    2 |        5 |
|    102 |    3 |        5 |
|    103 |    1 |        2 |
+--------+------+----------+
3 rows in set (0.00 sec)


#3. Delete the purchase details of product ‘pen’ in the in_id ‘101’. 

 mysql> DELETE FROM Invoice_item WHERE inv_id = 101 AND pid = (SELECT pid FROM product WHERE pname = 'pen');
Query OK, 0 rows affected (0.02 sec)

mysql> SELECT * FROM Invoice_item;
+--------+------+----------+
| inv_id | pid  | quantity |
+--------+------+----------+
|    101 |    2 |        5 |
|    102 |    3 |        5 |
|    103 |    1 |        2 |
+--------+------+----------+
3 rows in set (0.00 sec)

#4. Delete details of employees who does not have phone number. 
        
        
#5. Delete Invoice details of a particular customer(name) 
              mysql> DELETE FROM Invoice_item
    -> WHERE inv_id IN (SELECT inv_id FROM Invoice_master WHERE cust_id IN (SELECT id FROM customer WHERE name = 'ajay'));
Query OK, 1 row affected (0.12 sec)

mysql> DELETE FROM Invoice_master
    -> WHERE cust_id IN (SELECT id FROM customer WHERE name = 'ajay');
Query OK, 1 row affected (0.11 sec)

mysql> SELECT * FROM Invoice_master;
+--------+---------+------------+
| inv_id | cust_id | inv_date   |
+--------+---------+------------+
|    101 |    1001 | 2023-02-25 |
|    103 |    1003 | 2024-01-22 |
+--------+---------+------------+
2 rows in set (0.00 sec)

mysql> SELECT * FROM Invoice_item;
+--------+------+----------+
| inv_id | pid  | quantity |
+--------+------+----------+
|    101 |    2 |        5 |
|    103 |    1 |        2 |
+--------+------+----------+
2 rows in set (0.00 sec)


              
#6. Delete the first two records of INVOICE_ITEM table its purchase quantity is high.#
mysql> CREATE TEMPORARY TABLE TempToDelete AS
    -> SELECT inv_id, pid
    -> FROM Invoice_item
    -> ORDER BY quantity DESC
    -> LIMIT 2;
Query OK, 2 rows affected (0.00 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> DELETE FROM Invoice_item
    -> WHERE (inv_id, pid) IN (SELECT inv_id, pid FROM TempToDelete);
Query OK, 2 rows affected (0.13 sec)

mysql> DROP TEMPORARY TABLE TempToDelete;
Query OK, 0 rows affected (0.06 sec)

mysql> SELECT * FROM Invoice_item;
Empty set (0.00 sec)


