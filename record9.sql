 /*1.       Create a function to calculate price_range(low, medium, high)
of each product. If price<=5 indicate as low, upto 50 indicate as medium, and above as high. */

mysql> CREATE FUNCTION price_range(price INT)
    -> RETURNS VARCHAR(10)
    -> DETERMINISTIC
    -> BEGIN
    ->     DECLARE message VARCHAR(10);
    ->     IF price <= 5 THEN
    ->         SET message = 'low';
    ->     ELSEIF price <= 50 THEN
    ->         SET message = 'medium';
    ->     ELSE
    ->         SET message = 'high';
    ->     END IF;  
    ->     RETURN (message);
    -> END $
Query OK, 0 rows affected (0.16 sec)

mysql> select * from product $
+-----+--------+-------+
| pid | pname  | price |
+-----+--------+-------+
|   1 | pen    |    51 |
|   2 | pencil |   153 |
|   3 | soap   |   102 |
+-----+--------+-------+
3 rows in set (0.00 sec)

mysql> select pname,price_range(price) from product $
+--------+--------------------+
| pname  | price_range(price) |
+--------+--------------------+
| pen    | high               |
| pencil | high               |
| soap   | high               |
+--------+--------------------+
3 rows in set (0.00 sec)
