SET search_path TO public;

SELECT
    o.id AS order_id,
    o.order_date,
    c.name AS customer_name,
    oi.quantity AS product_quantity,
    SUM(oi.quantity * si.quantity * m.price) AS full_order_cost
FROM orders o
JOIN contractors c
    ON c.id = o.contractor_id
JOIN order_items oi
    ON oi.order_id = o.id
JOIN specifications s
    ON s.product_id = oi.product_id
JOIN specification_items si
    ON si.specification_id = s.id
JOIN materials m
    ON m.id = si.material_id
WHERE o.id = 1
GROUP BY o.id, o.order_date, c.name, oi.quantity;