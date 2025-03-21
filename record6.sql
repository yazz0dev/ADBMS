/*RECORD PROGRAM 6: ACCESSING DATABASES: (VIEWS)


1. Create a view for customers who have purchased products.*/

mysql> select * from customer;
+------+------+----------+---------+-----------+
| id   | name | address  | city    | phno      |
+------+------+----------+---------+-----------+
| 1001 | arun | mukkam   | calicut | 987654321 |
| 1002 | ajay | ponoor   | calicut | 980694361 |
| 1003 | akil | palazhi  | calicut |      NULL |
| 1004 | ann  | pilasery | tv      | 654324435 |
+------+------+----------+---------+-----------+
4 rows in set (0.00 sec)

mysql> create view c1 as select * from customer where id in(select cust_id from Invoice_master where);
Query OK, 0 rows affected (0.22 sec)

mysql> select * from c1;
+------+------+---------+---------+-----------+
| id   | name | address | city    | phno      |
+------+------+---------+---------+-----------+
| 1001 | arun | mukkam  | calicut | 987654321 |
| 1003 | akil | palazhi | calicut |      NULL |
+------+------+---------+---------+-----------+
2 rows in set (0.00 sec)


/*2. Create a view for invoice products[cname , inv_id, product_id, quantity]*/

mysql> CREATE VIEW invpdt AS SELECT (SELECT name FROM customer WHERE id in (SELECT cust_id FROM Invoice_master WHERE inv_id = Invoice_item.inv_id)) , inv_id, pid, quantity FROM Invoice_item;
Query OK, 0 rows affected (0.15 sec)

mysql> select * from invpdt;
+-------+--------+------------+----------+
| cname | inv_id | product_id | quantity |
+-------+--------+------------+----------+
| arun  |    101 |          1 |        2 |
| arun  |    101 |          1 |        5 |
| arun  |    101 |          3 |        2 |
| akil  |    103 |          1 |        5 |
+-------+--------+------------+----------+
4 rows in set (0.00 sec)
//VERIFIED
