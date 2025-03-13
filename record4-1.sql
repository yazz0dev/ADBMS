mysql> select * from customer ;
+------+------+----------+---------+-----------+
| id   | name | address  | city    | phno      |
+------+------+----------+---------+-----------+
| 1001 | arun | mukkam   | calicut | 987654321 |
| 1002 | ajay | ponoor   | calicut | 980694361 |
| 1003 | akil | palazhi  | calicut |      NULL |
| 1004 | ann  | pilasery | tvm     | 654324435 |
| 1005 | av   | pannur   | kannnur | 985665738 |
+------+------+----------+---------+-----------+
4 rows in set (0.00 sec)


/*a) ACCESSING DATABASE:  (SELECT, Filtering using WHERE, ORDER BY Clauses)

1.    List all invoice items, avoid duplicates.*/
mysql> select distinct inv_id,pid from Invoice_item;
+--------+------+
| inv_id | pid  |
+--------+------+
|    101 |    1 |
|    101 |    3 |
|    103 |    1 |
+--------+------+
3 rows in set (0.01 sec)

/*2.    List the invoice details from 1st January 2024 to 31st march 2024*/

mysql> select * from Invoice_master where inv_date>='2024-01-01' and inv_date<='2024-03-31';
+--------+---------+------------+
| inv_id | cust_id | inv_date   |
+--------+---------+------------+
|    103 |    1003 | 2024-01-22 |
+--------+---------+------------+
1 row in set (0.02 sec)


/*3.    List the customer details who not live in ‘tvm’.*/

mysql> select * from customer where city!='tvm';
+------+------+----------+---------+-----------+
| id   | name | address  | city    | phno      |
+------+------+----------+---------+-----------+
| 1001 | arun | mukkam   | calicut | 987654321 |
| 1002 | ajay | ponoor   | calicut | 980694361 |
| 1003 | akil | palazhi  | calicut |      NULL |
| 1005 | avay | pannur   | kannnur | 985665738 |
+------+------+----------+---------+-----------+
4 rows in set (0.00 sec)


/*4.    List the customers who have no phone number.*/

mysql> select * from customer where phno is null;
+------+------+---------+---------+-----------+
| id   | name | address | city    | phno      |
+------+------+---------+---------+-----------+
| 1003 | akil | palazhi | calicut |      NULL |
+------+------+---------+---------+-----------+
1 row in set (0.00 sec)


/*5.    Display customer names in descending order.*/

mysql> select * from customer order by name desc;
+------+------+----------+---------+-----------+
| id   | name | address  | city    | phno      |
+------+------+----------+---------+-----------+
| 1005 | av   | pannur   | kannnur | 985665738 |
| 1001 | arun | mukkam   | calicut | 987654321 |
| 1004 | ann  | pilasery | tvm     | 654324435 |
| 1003 | akil | palazhi  | calicut |      NULL |
| 1002 | ajay | ponoor   | calicut | 980694361 |
+------+------+----------+---------+-----------+
5 rows in set (0.00 sec)


/*6.    Display the customer details sorted in ascending by city and descending by names.*/

mysql> select * from customer order by city, name desc;
+------+------+----------+---------+-----------+
| id   | name | address  | city    | phno      |
+------+------+----------+---------+-----------+
| 1001 | arun | mukkam   | calicut | 987654321 |
| 1003 | akil | palazhi  | calicut |      NULL |
| 1002 | ajay | ponoor   | calicut | 980694361 |
| 1005 | av   | pannur   | kannnur | 985665738 |
| 1004 | ann  | pilasery | tvm     | 654324435 |
+------+------+----------+---------+-----------+
5 rows in set (0.00 sec)


/*7.    Find the customer names who have ‘e’ or ‘a’ in them and at least 3 characters in length*/

mysql> select * from customer where (name like '%a%' or name like '%e%') and name like '___%';
+------+------+----------+---------+-----------+
| id   | name | address  | city    | phno      |
+------+------+----------+---------+-----------+
| 1001 | arun | mukkam   | calicut | 987654321 |
| 1002 | ajay | ponoor   | calicut | 980694361 |
| 1003 | akil | palazhi  | calicut |      NULL |
| 1004 | ann  | pilasery | tvm     | 654324435 |
+------+------+----------+---------+-----------+
5 rows in set (0.00 sec)


/*8.    List the names of customers their names have ‘r’ in second position.*/

mysql> select * from customer where name like '_r%';
+------+------+---------+---------+-----------+
| id   | name | address | city    | phno      |
+------+------+---------+---------+-----------+
| 1001 | arun | mukkam  | calicut | 987654321 |
+------+------+---------+---------+-----------+
1 row in set (0.00 sec)
