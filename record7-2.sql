/*  OPTIMIZING DATABASE: (Using Set, arithmetic, logical and special operators)
1.        Display customer_id, city  who lives either in ‘CLT’ or in ‘TVM’ */

mysql> select id,city from customer where city='tvm' or city='calicut';
+------+---------+
| id   | city    |
+------+---------+
| 1001 | calicut |
| 1002 | calicut |
| 1003 | calicut |
| 1004 | tvm     |
+------+---------+
4 rows in set (0.00 sec)

  
/* 2. Display product details with an updated price amount(new price= old price+5rs)*/
  
mysql> select pname, price, price+5 as updated_price from product ;
+--------+-------+---------------+
| pname  | price | updated_price |
+--------+-------+---------------+
| pen    |    51 |            56 |
| pencil |   153 |           158 |
| soap   |   102 |           107 |
+--------+-------+---------------+
3 rows in set (0.00 sec)

  
/* 3. Display customer details who doesn’t have phone number and lives in ‘Calicut’ city (use logical operators) */
  
mysql> select * from customer where phno is null and city='calicut';
+------+------+---------+---------+------+
| id   | name | address | city    | phno |
+------+------+---------+---------+------+
| 1003 | akil | palazhi | calicut | NULL |
+------+------+---------+---------+------+
1 row in set (0.00 sec)

  
/* 4. List the product names if it finds any records in the invoice items table has quantity =3 (use special operators) */
  
mysql> select pname from product where exists (select 1 from Invoice_item where
Invoice_item.pid = product.pid and quantity=2);
+-------+
| pname |
+-------+
| pen   |
| soap  |
+-------+
2 rows in set (0.00 sec)
//VERIFIED
