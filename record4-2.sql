/* b) OPTIMIZING DATABASE:  (GROUP BY, AGGREGATE FUNCTIONS)

mysql> select * from product;
+-----+--------+-------+
| pid | pname  | price |
+-----+--------+-------+
|   1 | pen    |    51 |
|   2 | pencil |   153 |
|   3 | soap   |   102 |
+-----+--------+-------+
3 rows in set (0.00 sec)

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

1.    List product name, price except soap on price order.*/

mysql> select pname,price from product where pname != 'soap' order by price;
+--------+-------+
| pname  | price |
+--------+-------+
| pen    |    51 |
| pencil |   153 |
+--------+-------+
2 rows in set (0.00 sec)


/*2.    Find minimum, maximum and average price of products.*/

mysql> select max(price),avg(price) from product;
+------------+------------+
| max(price) | avg(price) |
+------------+------------+
|        153 |   102.0000 |
+------------+------------+
1 row in set (0.00 sec)


/*3.    Find number of customers in each city.*/
  
mysql> select city,count(*) from customer group by city;
+---------+----------+
| city    | count(*) |
+---------+----------+
| calicut |        3 |
| tv      |        1 |
+---------+----------+
2 rows in set (0.00 sec)


/*4.    Find number of customers in each city, only include city with more than 2 customers.*/

mysql> select city,count(*) from customer group by city having count(*)>2;
+---------+----------+
| city    | count(*) |
+---------+----------+
| calicut |        3 |
+---------+----------+
1 row in set (0.00 sec)


/*5. Show data as displayed ‘who, where’ Eg: ‘customer1 lives in tvm’ */

mysql> select concat(name," lives in",city) from customer;
+-------------------------------+
| concat(name," lives in",city) |
+-------------------------------+
| arun lives incalicut          |
| ajay lives incalicut          |
| akil lives incalicut          |
| ann lives intv                |
+-------------------------------+
4 rows in set (0.00 sec)

