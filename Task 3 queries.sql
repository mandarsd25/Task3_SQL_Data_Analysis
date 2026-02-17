CREATE DATABASE IF NOT EXISTS ecommerce_db;
USE ecommerce_db;

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    customer_name VARCHAR(100),
    product VARCHAR(100),
    category VARCHAR(50),
    order_date DATE,
    quantity INT,
    price DECIMAL(10,2),
    country VARCHAR(50)
);

INSERT INTO orders 
(order_id, customer_id, customer_name, product, category, order_date, quantity, price, country)
VALUES
(1, 101, 'Rahul Sharma', 'Laptop', 'Electronics', '2023-05-10', 1, 50000, 'India'),
(2, 102, 'Priya Mehta', 'Mobile', 'Electronics', '2023-06-15', 2, 20000, 'India'),
(3, 103, 'Amit Patel', 'Chair', 'Furniture', '2022-11-20', 3, 3000, 'USA'),
(4, 104, 'Neha Singh', 'Table', 'Furniture', '2023-01-12', 1, 7000, 'UK');


# Show orders after 2022 sorted by date
SELECT order_id, customer_name, order_date
FROM orders
WHERE order_date > '2022-12-31'
ORDER BY order_date DESC;

# Total revenue per country (only > 5000)
SELECT country, SUM(quantity * price) AS total_revenue
FROM orders
GROUP BY country
HAVING total_revenue > 5000
ORDER BY total_revenue DESC;

# Average Revenue Per Customer
SELECT customer_id,
       AVG(quantity * price) AS avg_revenue
FROM orders
GROUP BY customer_id;

# Join
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    city VARCHAR(50)
);

INSERT INTO customers (customer_id, city)
VALUES
(101, 'Mumbai'),
(102, 'Delhi'),
(103, 'New York'),
(104, 'London');


INSERT INTO orders 
(order_id, customer_id, customer_name, product, category, order_date, quantity, price, country)
VALUES
(1, 101, 'Rahul Sharma', 'Laptop', 'Electronics', '2023-05-10', 1, 50000, 'India'),
(2, 102, 'Priya Mehta', 'Mobile', 'Electronics', '2023-06-15', 2, 20000, 'India');


SELECT o.order_id, o.customer_name, c.city
FROM orders o
INNER JOIN customers c
ON o.customer_id = c.customer_id;


CREATE VIEW high_value_orders AS
SELECT *
FROM orders
WHERE quantity * price > 1000;

SELECT * FROM high_value_orders;







