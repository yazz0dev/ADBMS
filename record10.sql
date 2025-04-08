/*1.      Create a trigger to handle updates to the customer table. */

mysql> delimiter $
mysql> create trigger c_upd
    -> after update on customer 
    -> for each row begin 
    -> insert into cust set id=new.id,name=new.name,city=new.city,phno=new.phno;
    -> end $
Query OK, 0 rows affected (0.20 sec)

mysql> create table cust(id int,name varchar(10),city varchar(10),phno int) $
Query OK, 0 rows affected (1.03 sec)

mysql> select * from customer $
+------+------+----------+---------+-----------+
| id   | name | address  | city    | phno      |
+------+------+----------+---------+-----------+
| 1001 | arun | mukkam   | calicut | 987654321 |
| 1002 | ajay | ponoor   | calicut | 980694361 |
| 1003 | akil | palazhi  | calicut |      NULL |
| 1004 | ann  | pilasery | tvm     | 654324435 |
+------+------+----------+---------+-----------+
4 rows in set (0.00 sec)

mysql> update customer set city='kozhikode' where id='1003' $
Query OK, 1 row affected (0.10 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from customer $
+------+------+----------+-----------+-----------+
| id   | name | address  | city      | phno      |
+------+------+----------+-----------+-----------+
| 1001 | arun | mukkam   | calicut   | 987654321 |
| 1002 | ajay | ponoor   | calicut   | 980694361 |
| 1003 | akil | palazhi  | kozhikode |      NULL |
| 1004 | ann  | pilasery | tvm       | 654324435 |
+------+------+----------+-----------+-----------+
4 rows in set (0.00 sec)

mysql> select * from cust $
+------+------+-----------+------+
| id   | name | city      | phno |
+------+------+-----------+------+
| 1003 | akil | kozhikode | NULL |
+------+------+-----------+------+
1 row in set (0.00 sec)


/*2.    Create a trigger to handle inserts to the product relation ( if price < 5 the set price to 10).  */

mysql> create trigger p_ins
    -> before insert on product
    -> for each row begin
    -> if new.price <5 then
    -> set new.price=10;
    -> end if; end$
Query OK, 0 rows affected (0.25 sec)
  
mysql> insert into product values( 4, 'eraser', 4) $
Query OK, 1 row affected (0.10 sec)

mysql> select * from product $
+-----+--------+-------+
| pid | pname  | price |
+-----+--------+-------+
|   1 | pen    |    51 |
|   2 | pencil |   153 |
|   3 | soap   |   102 |
|   4 | eraser |    10 |
+-----+--------+-------+
4 rows in set (0.00 sec)
