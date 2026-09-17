-- Write your query below
WITH customers_without_orders AS (
    SELECT c.name
    FROM customers c
    WHERE NOT EXISTS (
        SELECT 1
        FROM orders o
        WHERE o.customer_id = c.id
    )
)
SELECT name
FROM customers_without_orders;