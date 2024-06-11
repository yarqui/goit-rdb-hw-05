USE mydb;
-- ======
-- 1
-- ======
-- SELECT od.*,
-- (SELECT customer_id FROM orders o WHERE id = od.order_id) as customer_id
-- FROM order_details od
-- LIMIT 10;

-- ======
-- 2
-- ======
-- SELECT od.*
-- FROM order_details od
-- WHERE od.order_id IN (SELECT id FROM orders o WHERE shipper_id = 3);

-- ======
-- 3
-- ======
-- SELECT order_id,
-- ROUND(AVG(quantity)) AS average_product_quantity
-- FROM (
-- 	SELECT * FROM order_details WHERE quantity > 10
-- ) as temp_orders
-- GROUP BY order_id;

-- ======
-- 4
-- ======
-- WITH TempOrders as (
-- 	SELECT *
--     FROM order_details
--     WHERE quantity > 10
-- )
-- SELECT order_id,
-- ROUND(AVG(quantity)) AS average_product_quantity
-- FROM  TempOrders
-- GROUP BY order_id;

-- ======
-- 5
-- ======
-- DROP FUNCTION IF EXISTS Divide;
-- DELIMITER //
-- CREATE FUNCTION Divide(first_number_param FLOAT, second_number_param FLOAT)
-- RETURNS FLOAT
-- DETERMINISTIC
-- NO SQL
-- BEGIN
-- 	DECLARE result FLOAT;
--     SET result = first_number_param / second_number_param;
--     RETURN result;
-- END//
-- DELIMITER ;
-- SELECT quantity,
-- Divide(quantity, 2) divide_by_two
-- FROM order_details;


