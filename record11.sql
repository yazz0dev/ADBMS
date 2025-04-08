/* RECORD PROGRAM 11: PL/SQL - CURSOR
1.     Write a PL/SQL program to create a name list of customers using CURSOR */

mysql> CREATE PROCEDURE ListCustomerNames()
    -> BEGIN
    ->   DECLARE done INT DEFAULT FALSE;           
    ->   DECLARE customerName VARCHAR(20);   
    ->   DECLARE custCursor CURSOR FOR
    ->     SELECT name
    ->     FROM customer;
    ->   DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    ->   OPEN custCursor;
    ->   read_loop: LOOP
    ->     FETCH custCursor INTO customerName;
    ->     IF done THEN
    ->       LEAVE read_loop;
    ->     END IF;
    ->     SELECT customerName AS 'Customer Name'; 
    ->   END LOOP read_loop;
    ->   CLOSE custCursor;
    -> END //
Query OK, 0 rows affected (0.15 sec)

mysql> DELIMITER ;

mysql> CALL ListCustomerNames();
+---------------+
| Customer Name |
+---------------+
| arun          |
+---------------+
1 row in set (0.00 sec)

+---------------+
| Customer Name |
+---------------+
| ajay          |
+---------------+
1 row in set (0.00 sec)

+---------------+
| Customer Name |
+---------------+
| akil          |
+---------------+
1 row in set (0.00 sec)

+---------------+
| Customer Name |
+---------------+
| ann           |
+---------------+
1 row in set (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

mysql> 

