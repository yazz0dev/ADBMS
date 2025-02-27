# DDL - ALTER & DROP

## 5. Create an INVOICE database and tables.

mysql> CREATE DATABASE INVOICE;
Query OK, 1 row affected (0.21 sec)
 
mysql> USE INVOICE;
Database changed

mysql> CREATE TABLE Customer(id INT PRIMARY KEY, name VARCHAR(20), address VARCHAR(10), city VARCHAR(10), phno INT);
Query OK, 0 rows affected (0.77 sec)

mysql> CREATE TABLE Product(pid INT PRIMARY KEY, pname VARCHAR(20), price INT DEFAULT 0);
Query OK, 0 rows affected (0.69 sec)

mysql> CREATE TABLE Invoice_master(inv_id INT PRIMARY KEY, cust_id INT, inv_date DATE, FOREIGN KEY (cust_id) REFERENCES Customer(id));
Query OK, 0 rows affected (1.34 sec)

mysql> CREATE TABLE Invoice_item(inv_id INT, pid INT, quantity INT, FOREIGN KEY (inv_id) REFERENCES Invoice_master(inv_id), FOREIGN KEY (pid) REFERENCES Product(pid));
Query OK, 0 rows affected (1.58 sec)
## a) DDL-ALTER & DROP

## 1. Add a column ‘SSN’ at the first position in the table EMPLOYEE

mysql> ALTER TABLE EMPLOYEE ADD COLUMN SSN INT FIRST;
Query OK, 0 rows affected (2.11 sec)
Records: 0  Duplicates: 0  Warnings: 0

## 2. Change the data type of the column ‘DOB’ in year the table EMPLOYEE

mysql> ALTER TABLE EMPLOYEE MODIFY dob YEAR;
Query OK, 0 rows affected (2.25 sec) 
Records: 0  Duplicates: 0  Warnings: 0

## 3. Delete the column ‘emp_id’ the table EMPLOYEE.

mysql> ALTER TABLE EMPLOYEE DROP emp_id;
Query OK, 0 rows affected (1.76 sec)
Records: 0  Duplicates: 0  Warnings: 0

## 4. Add the constraint unique for columns ‘SSN, ‘adhar_no’ the table EMPLOYEE

mysql> ALTER TABLE EMPLOYEE MODIFY SSN INT UNIQUE;
Query OK, 0 rows affected (0.42 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE EMPLOYEE MODIFY adhar_no INT UNIQUE;
Query OK, 0 rows affected (0.41 sec)
Records: 0  Duplicates: 0  Warnings: 0

## 5. Delete the NULL constraint of ‘age’ in the STUDENT table.


mysql> ALTER TABLE STUDENT MODIFY age INT NULL;
Query OK, 0 rows affected (0.20 sec) 
Records: 0  Duplicates: 0  Warnings: 0



## 6. Change the table name EMPLOYEE as PERSON

mysql> ALTER TABLE EMPLOYEE RENAME TO PERSON;
Query OK, 0 rows affected (0.51 sec)

mysql> desc person;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| name     | varchar(20) | YES  |     | NULL    |       |
| city     | varchar(50) | YES  |     | NULL    |       |
| dob      | varchar(20) | YES  |     | NULL    |       |
| adhar_no | int         | YES  | UNI | NULL    |       |
| ssn      | int         | YES  | UNI | NULL    |       |
+----------+-------------+------+-----+---------+-------+


## 7. Delete the table STUDENT1.:

mysql> DROP TABLE STUDENT1;
Query OK, 0 rows affected (0.00 sec)
//VERIFIED
