### Filtering

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

### Global Aggregation

``` sql
SELECT count(*) FROM orders;

SELECT count(*) FROM order_items;

SELECT coount(DISTINCT order_status) FROM orders;

SELECT coount(DISTINCT order_date) FROM orders;

SELECT sum(order_item_subtotal)
FROM order_items
WHERE order_iitem_order_id = 2;
```

``` sql
```

``` sql
```

``` sql
```

``` sql
```

``` sql
```

``` sql
```