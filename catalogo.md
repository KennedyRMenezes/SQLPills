``` sql
--- get all distinct status from orders
SELECT DISTINCT orders_status FROM orders
ORDER BY 1;

SELECT * FROM orders
WHERE order_status = 'COMPLETE';

SELECT * FROM orders
WHERE order_status = 'CLOSED';

SELECT * FROM orders
WHERE order_status = 'COMPLETE' OR order_status = 'CLOSED';

--- better way
--- |
--- |
--- v

SELECT * FROM orders
WHERE order_status IN ('CLOSED', 'COMPLETE')
```