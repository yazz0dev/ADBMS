/* RECORD PROGRAM 7: OPTIMIZING DATABASE: (JOINS)

OPTIMIZING DATABASE: (JOINS)

1.    List the product name and quantity of invoice items. */
mysql> select pname,quantity from product join Invoice_item on product.pid=Invoice_item.pid;
+-------+----------+
| pname | quantity |
+-------+----------+
| pen   |        2 |
| pen   |        5 |
| soap  |        2 |
| pen   |        5 |
+-------+----------+
4 rows in set (0.00 sec)


/* 2.    Display invoice details of the transaction dated ’2023-02-25’.*/
mysql> select * from Invoice_master join Invoice_item on Invoice_master.inv_id=Invoice_item.inv_id where inv_date='2023-02-25';
+--------+---------+------------+--------+------+----------+
| inv_id | cust_id | inv_date   | inv_id | pid  | quantity |
+--------+---------+------------+--------+------+----------+
|    101 |    1001 | 2023-02-25 |    101 |    1 |        2 |
|    101 |    1001 | 2023-02-25 |    101 |    1 |        5 |
|    101 |    1001 | 2023-02-25 |    101 |    3 |        2 |
+--------+---------+------------+--------+------+----------+
3 rows in set (0.00 sec)


/*3.    Display the customer name, product name, invoice date of purchased item ‘pen’.*/
mysql> select name,pname,inv_date from customer join Invoice_master on customer.id=Invoice_master.cust_id join Invoice_item on Invoice_master.inv_id=Invoice_item.inv_id join product on product.pid=Invoice_item.pid where pname='pen';
+------+-------+------------+
| name | pname | inv_date   |
+------+-------+------------+
| arun | pen   | 2023-02-25 |
| arun | pen   | 2023-02-25 |
| akil | pen   | 2024-01-22 |
+------+-------+------------+
3 rows in set (0.00 sec)

  
/*4.    Display all customer details and invoice details must include customer has not purchased items.*/
mysql> select * from customer left join Invoice_master on Invoice_master.cust_id=customer.id;
+------+------+----------+---------+-----------+--------+---------+------------+
| id   | name | address  | city    | phno      | inv_id | cust_id | inv_date   |
+------+------+----------+---------+-----------+--------+---------+------------+
| 1001 | arun | mukkam   | calicut | 987654321 |    101 |    1001 | 2023-02-25 |
| 1002 | ajay | ponoor   | calicut | 980694361 |   NULL |    NULL | NULL       |
| 1003 | akil | palazhi  | calicut |      NULL |    103 |    1003 | 2024-01-22 |
| 1004 | ann  | pilasery | tv      | 654324435 |   NULL |    NULL | NULL       |
+------+------+----------+---------+-----------+--------+---------+------------+
4 rows in set (0.00 sec)
