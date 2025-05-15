
-- SCRIPT: Órdenes completas por cliente
USE classicmodels;

-- Clientes
SELECT * FROM customers;

-- Órdenes
SELECT * FROM orders;

-- Detalles de orden
SELECT * FROM orderdetails;

-- Productos
SELECT * FROM products;

-- =====================
-- b. JOINS 
-- =====================

SELECT 
    customers.customerNumber,
    customers.customerName,
    orders.orderNumber,
    orders.orderDate,
    orders.status,
    orderdetails.productCode,
    products.productName,
    orderdetails.quantityOrdered,
    orderdetails.priceEach,
    (orderdetails.quantityOrdered * orderdetails.priceEach) AS totalLinea
FROM customers
JOIN orders ON customers.customerNumber = orders.customerNumber
JOIN orderdetails ON orders.orderNumber = orderdetails.orderNumber
JOIN products ON orderdetails.productCode = products.productCode
-- WHERE orders.status = 'Shipped'
ORDER BY customers.customerNumber, orders.orderNumber;