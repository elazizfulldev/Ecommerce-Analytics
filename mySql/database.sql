-- drop database if existe
DROP DATABASE IF EXISTS ecommerce_db;
CREATE DATABASE ecommerce_db;
USE ecommerce_db;

-- creaction tables
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    password VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    description TEXT,
    price DECIMAL(10,2),
    image_url VARCHAR(255),
    category_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES categories(id)
);

CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    total_price DECIMAL(10,2),
    order_date DATE,
    status ENUM('Pending', 'Completed', 'Cancelled') DEFAULT 'Pending',
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE order_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- add the information in the database 
INSERT INTO users (name, email, password) VALUES
('Test User 1', 'user1@test.com', 'password1'),
('Test User 2', 'user2@test.com', 'password2'),
('Test User 3', 'user3@test.com', 'password3');

INSERT INTO categories (name) VALUES
('Helmets'), ('Jackets'), ('Gloves'), ('Boots') , ('Covers'), ('Goggles'), ('Protectors'), ('Bags'), ('Intercoms'), ('Suits');

INSERT INTO products (name, description, price, image_url, category_id) VALUES
('Helmet X', 'Premium helmet', 99.99, 'helmet.jpg', 1),
('Racing Jacket', 'High-performance jacket', 199.99, 'jacket.jpg', 2),
('Sport Gloves', 'Flexible gloves', 59.99, 'gloves.jpg', 3),
('Adventure Boots', 'All-terrain boots', 149.99, 'boots.jpg', 4),
('Full Face Helmet', 'High-safety full face helmet', 129.99, 'full_face_helmet.jpg', 1),
('Leather Jacket', 'Durable leather motorcycle jacket', 249.99, 'leather_jacket.jpg', 2),
('Winter Gloves', 'Insulated gloves for cold weather', 69.99, 'winter_gloves.jpg', 3),
('Touring Boots', 'Comfortable long-distance boots', 179.99, 'touring_boots.jpg', 4),
('Motorcycle Cover', 'Waterproof motorcycle cover', 39.99, 'motorcycle_cover.jpg', 5),
('Riding Goggles', 'Anti-fog riding goggles', 29.99, 'riding_goggles.jpg', 6),
('Knee Protectors', 'Adjustable knee protection pads', 49.99, 'knee_protectors.jpg', 7),
('Tank Bag', 'Expandable tank bag with magnets', 89.99, 'tank_bag.jpg', 8),
('Bluetooth Intercom', 'Wireless communication system', 119.99, 'bluetooth_intercom.jpg', 9),
('Racing Suit', 'Professional-grade racing suit', 399.99, 'racing_suit.jpg', 10);

-- procedure for generate 500 commandes
DELIMITER $$
CREATE PROCEDURE GenerateDemoOrders()
BEGIN
    DECLARE counter INT DEFAULT 0;
    DECLARE user INT;
    DECLARE product INT;
    DECLARE order_date DATE;
    DECLARE qty INT;
    
    WHILE counter < 500 DO
        
        SET user = FLOOR(1 + RAND() * 3);
        SET order_date = DATE(NOW() - INTERVAL FLOOR(RAND() * 365) DAY);
        SET product = FLOOR(1 + RAND() * 4);
        SET qty = FLOOR(1 + RAND() * 5);
        
       
        INSERT INTO orders (user_id, total_price, order_date, status)
        VALUES (
            user,
            (SELECT price FROM products WHERE id = product) * qty,
            order_date,
            IF(RAND() > 0.1, 'Completed', 'Cancelled')
        );
        
       
        INSERT INTO order_items (order_id, product_id, quantity, price)
        VALUES (
            LAST_INSERT_ID(),
            product,
            qty,
            (SELECT price FROM products WHERE id = product)
        );
        
        SET counter = counter + 1;
    END WHILE;
END$$
DELIMITER ;


CALL GenerateDemoOrders();


SELECT 
    COUNT(*) AS total_orders,
    AVG(total_price) AS average_order,
    MIN(order_date) AS first_order,
    MAX(order_date) AS last_order
FROM orders;

SELECT * FROM orders LIMIT 5;
SELECT * FROM order_items LIMIT 5;