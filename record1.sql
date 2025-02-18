mysql> CREATE TABLE EMPLOYEE(emp_id INT, name VARCHAR(20), city VARCHAR(50), dob DATE, adhar_no INT);
Query OK, 0 rows affected (0.63 sec)

mysql> DESCRIBE EMPLOYEE;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| emp_id   | int         | YES  |     | NULL    |       |
| name     | varchar(20) | YES  |     | NULL    |       |
| city     | varchar(50) | YES  |     | NULL    |       |
| dob      | date        | YES  |     | NULL    |       |
| adhar_no | int         | YES  |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+
5 rows in set (0.00 sec)

mysql> CREATE TABLE Customer (id INT, name VARCHAR(20), address VARCHAR(50), city VARCHAR(50), phone_no INT);
Query OK, 0 rows affected (1.42 sec)

mysql> CREATE TABLE STUDENT(roll_no INT PRIMARY KEY, name VARCHAR(20) NOT NULL, age INT, gender VARCHAR(10) DEFAULT 'm');
Query OK, 0 rows affected, 1 warning (0.79 sec)

mysql> DESCRIBE STUDENT;
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| roll_no | int         | NO   | PRI | NULL    |       |
| name    | varchar(20) | NO   |     | NULL    |       |
| age     | int         | YES  |     | NULL    |       |
| gender  | varchar(10) | YES  |     | m       |       |
+---------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> CREATE TEMPORARY TABLE STUDENT1 AS SELECT * FROM STUDENT;
Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESCRIBE STUDENT1;
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| roll_no | int         | NO   |     | NULL    | NULL  |
| name    | varchar(20) | NO   |     | NULL    | NULL  |
| age     | int         | YES  |     | NULL    | NULL  |
| gender  | varchar(10) | YES  |     | m       | NULL  |
+---------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> CREATE TABLE d_emp AS SELECT * FROM EMPLOYEE;
Query OK, 0 rows affected (0.70 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESCRIBE d_emp;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| emp_id   | int         | YES  |     | NULL    |       |
| name     | varchar(20) | YES  |     | NULL    |       |
| city     | varchar(50) | YES  |     | NULL    |       |
| dob      | date        | YES  |     | NULL    |       |
| adhar_no | int         | YES  |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+
5 rows in set (0.00 sec)
