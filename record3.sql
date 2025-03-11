'''a) TCL COMMANDS
          1.    Commit
          2.    Rollback
          3.    Savepoint '''

mysql> set autocommit=off;
Query OK, 0 rows affected (0.00 sec)

mysql> insert into marks values(1, 50);
Query OK, 1 row affected (0.00 sec)

mysql> insert into marks values(2, 80);
Query OK, 1 row affected (0.00 sec)

mysql> insert into marks values(3, 40);
Query OK, 1 row affected (0.00 sec)

mysql> commit;
Query OK, 0 rows affected (0.09 sec)

mysql> select * from marks;
+------+-------+
| id   | marks |
+------+-------+
|    1 |    50 |
|    2 |    80 |
|    3 |    40 |
+------+-------+
3 rows in set (0.00 sec)

mysql> select * from marks;
+------+-------+
| id   | marks |
+------+-------+
|    1 |    50 |
|    2 |    80 |
|    3 |    40 |
|    4 |    50 |
+------+-------+
4 rows in set (0.00 sec)

mysql> rollback;
Query OK, 0 rows affected (0.04 sec)

mysql> select * from marks;
+------+-------+
| id   | marks |
+------+-------+
|    1 |    50 |
|    2 |    80 |
|    3 |    40 |
+------+-------+
3 rows in set (0.00 sec)

mysql> savepoint s1;
Query OK, 0 rows affected (0.00 sec)

mysql> select * from marks;
+------+-------+
| id   | marks |
+------+-------+
|    1 |    50 |
|    2 |    80 |
|    3 |    40 |
+------+-------+
3 rows in set (0.00 sec)

mysql> delete from marks;
Query OK, 3 rows affected (0.00 sec)

mysql> select * from marks;
Empty set (0.00 sec)

mysql> rollback to s1;
Query OK, 0 rows affected (0.00 sec)

mysql> select * from marks;
+------+-------+
| id   | marks |
+------+-------+
|    1 |    50 |
|    2 |    80 |
|    3 |    40 |
+------+-------+
3 rows in set (0.00 sec)

                  
'''b) DCL COMMAND
 Create two users user1, user2'''

mysql> create user 'user1'@'localhost' identified by 'user1';
Query OK, 0 rows affected (0.22 sec)

mysql> create user 'user2'@'localhost' identified by 'user2';
Query OK, 0 rows affected (0.10 sec)

mysql> use INVOICE;
Database changed
  
mysql> show grants for 'user1'@'localhost';
+-------------------------------------------+
| Grants for user1@localhost                |
+-------------------------------------------+
| GRANT USAGE ON *.* TO `user1`@`localhost` |
+-------------------------------------------+
1 row in set (0.00 sec)

mysql> show grants for 'user2'@'localhost';
+-------------------------------------------+
| Grants for user2@localhost                |
+-------------------------------------------+
| GRANT USAGE ON *.* TO `user2`@`localhost` |
+-------------------------------------------+
1 row in set (0.00 sec)


'''1.GRANT

Give insert and select privilege to user 1 on customer table in the invoice database.

Give update and delete privilege to user 2 on all tables in the invoice database.'''
  
mysql> grant insert,select on customer to 'user1'@'localhost';
Query OK, 0 rows affected (0.08 sec)
  
mysql> show grants for 'user1'@'localhost';
+---------------------------------------------------------------------+
| Grants for user1@localhost                                          |
+---------------------------------------------------------------------+
| GRANT USAGE ON *.* TO `user1`@`localhost`                           |
| GRANT SELECT, INSERT ON `INVOICE`.`customer` TO `user1`@`localhost` |
+---------------------------------------------------------------------+
2 rows in set (0.00 sec)

mysql> grant update, delete on INVOICE.* to 'user2'@'localhost';
Query OK, 0 rows affected (0.09 sec)

mysql> show grants for 'user2'@'localhost';
+------------------------------------------------------------+
| Grants for user2@localhost                                 |
+------------------------------------------------------------+
| GRANT USAGE ON *.* TO `user2`@`localhost`                  |
| GRANT UPDATE, DELETE ON `INVOICE`.* TO `user2`@`localhost` |
+------------------------------------------------------------+
2 rows in set (0.00 sec)

  
'''2.REVOKE

Remove delete privilege of user 2.'''

mysql> revoke delete on INVOICE.* from 'user2'@'localhost';
Query OK, 0 rows affected (0.04 sec)

mysql> show grants for 'user2'@'localhost';
+------------------------------------------------------------+
| Grants for user2@localhost                                 |
+------------------------------------------------------------+
| GRANT USAGE ON *.* TO `user2`@`localhost`                  |
| GRANT UPDATE ON `INVOICE`.* TO `user2`@`localhost`         |
+------------------------------------------------------------+
2 rows in set (0.00 sec)
