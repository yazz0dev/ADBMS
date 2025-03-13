/* RECORD PROGRAM 5- ACCESSING DATABASE- SUBQUERY


ACCESSING DATABASE:  (SUBQUERY)

1.    List the product name and price of each invoice item.*/

mysql> SELECT p.pname, p.price FROM product p WHERE p.pid IN (SELECT pid FROM Invoice_item);
+-------+-------+
| pname | price |
+-------+-------+
| pen   |    51 |
| soap  |   102 |
+-------+-------+
2 rows in set (0.00 sec)


/* 2.    List the product names, only include their purchased quantity more than 3.*/

mysql> SELECT p.pname FROM product p WHERE p.pid IN (SELECT pid FROM Invoice_item WHERE quantity > 2);
+-------+
| pname |
+-------+
| pen   |
+-------+
1 row in set (0.01 sec)


/* 3.    Find the product that has no sale.*/

mysql> SELECT pname FROM product WHERE pid NOT IN (SELECT pid FROM Invoice_item);
+--------+
| pname  |
+--------+
| pencil |
+--------+
1 row in set (0.00 sec)


/* 4.    List the customer names who purchased the items ‘pen’ and ‘pencil’.*/

mysql> SELECT DISTINCT c.name FROM customer c WHERE c.id IN (SELECT im.cust_id FROM Invoice_master im WHERE im.inv_id IN (SELECT ii.inv_id FROM Invoice_item ii WHERE ii.pid IN (SELECT p.pid FROM product p WHERE p.pname = 'pen' OR p.pname = 'pencil')));
+------+
| name |
+------+
| arun |
| akil |
+------+
2 rows in set (0.00 sec)


/* 5.    Display the purchased product details of the customer ’xyz’.*/

mysql> SELECT p.* FROM product p WHERE p.pid IN (SELECT ii.pid FROM Invoice_item ii WHERE ii.inv_id IN (SELECT im.inv_id FROM Invoice_master im WHERE im.cust_id IN (SELECT c.id FROM customer c WHERE c.name like 'a%')));
+-----+-------+-------+
| pid | pname | price |
+-----+-------+-------+
|   1 | pen   |    51 |
|   3 | soap  |   102 |
+-----+-------+-------+
2 rows in set (0.00 sec)

/* 6.    List the names of all customers who have purchased at least 2 products, make sure that no duplicate names in the result.*/

mysql> SELECT DISTINCT c.name FROM customer c WHERE c.id IN (SELECT im.cust_id FROM Invoice_master im WHERE im.inv_id IN (SELECT ii.inv_id FROM Invoice_item ii GROUP BY ii.inv_id HAVING count(DISTINCT ii.pid)>=2));
+------+
| name |
+------+
| arun |
+------+
1 row in set (0.00 sec)

