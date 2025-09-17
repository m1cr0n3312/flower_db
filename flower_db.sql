-- Создаем базу данных
CREATE DATABASE flower_shop;
USE flower_shop;

-- 1. Таблица цветов
CREATE TABLE flowers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    color VARCHAR(50) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    in_stock BOOLEAN DEFAULT TRUE
);

-- 2. Таблица товаров
CREATE TABLE products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    in_stock BOOLEAN DEFAULT TRUE
);

-- 3. Таблица клиентов
CREATE TABLE clients (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    surname VARCHAR(50) NOT NULL,
    phone VARCHAR(20) UNIQUE NOT NULL
);

-- 4. Таблица заказов
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    client_id INT NOT NULL,
    date DATE NOT NULL,
    status VARCHAR(20) DEFAULT 'новый',
    FOREIGN KEY (client_id) REFERENCES clients(id)
);

-- 5. Таблица состава заказа
CREATE TABLE order_items (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    flower_id INT NULL,
    kol_flower INT DEFAULT 0,
    product_id INT NULL,
    kol_product INT DEFAULT 0,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (flower_id) REFERENCES flowers(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);
-- Добавляем цветы
INSERT INTO flowers (name, color, price, in_stock) VALUES
('Роза', 'красный', 150.00, TRUE),
('Роза', 'белый', 140.00, TRUE),
('Тюльпан', 'желтый', 70.00, TRUE),
('Хризантема', 'зеленый', 80.00, TRUE),
('Гербера', 'оранжевый', 90.00, FALSE);

-- Добавляем товары
INSERT INTO products (name, category, price, in_stock) VALUES
('Керамический горшок', 'горшки', 500.00, TRUE),
('Плетеная корзина', 'упаковка', 300.00, TRUE),
('Открытка', 'аксессуары', 50.00, TRUE),
('Лента атласная', 'декор', 30.00, TRUE);

-- Добавляем клиентов
INSERT INTO clients (name, surname, phone) VALUES
('Иван', 'Петров', '+79161234567'),
('Мария', 'Сидорова', '+79167654321'),
('Алексей', 'Кузнецов', '+79165557788');

-- Добавляем заказы
INSERT INTO orders (client_id, date, status) VALUES
(1, '2024-03-15', 'доставлен'),
(2, '2024-03-16', 'в обработке');

-- Добавляем состав заказов
INSERT INTO order_items (order_id, flower_id, kol_flower, product_id, kol_product) VALUES
(1, 1, 5, NULL, 0),    -- 5 красных роз
(1, NULL, 0, 3, 1),    -- 1 открытка
(2, 3, 10, NULL, 0),   -- 10 желтых тюльпанов
(2, NULL, 0, 4, 2);    -- 2 ленты




-- Создаем базу данных
CREATE DATABASE flower_shop;
GO

USE flower_shop;
GO

-- 1. Таблица цветов
CREATE TABLE flowers (
    id INT PRIMARY KEY IDENTITY(1,1),
    name NVARCHAR(100) NOT NULL,
    color NVARCHAR(50) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    in_stock BIT DEFAULT 1
);
GO

-- 2. Таблица товаров
CREATE TABLE products (
    id INT PRIMARY KEY IDENTITY(1,1),
    name NVARCHAR(100) NOT NULL,
    category NVARCHAR(50) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    in_stock BIT DEFAULT 1
);
GO

-- 3. Таблица клиентов
CREATE TABLE clients (
    id INT PRIMARY KEY IDENTITY(1,1),
    name NVARCHAR(50) NOT NULL,
    surname NVARCHAR(50) NOT NULL,
    phone NVARCHAR(20) UNIQUE NOT NULL
);
GO

-- 4. Таблица заказов
CREATE TABLE orders (
    order_id INT PRIMARY KEY IDENTITY(1,1),
    client_id INT NOT NULL,
    date DATE NOT NULL,
    status NVARCHAR(20) DEFAULT 'новый',
    FOREIGN KEY (client_id) REFERENCES clients(id)
);
GO

-- 5. Таблица состава заказа
CREATE TABLE order_items (
    id INT PRIMARY KEY IDENTITY(1,1),
    order_id INT NOT NULL,
    flower_id INT NULL,
    kol_flower INT DEFAULT 0,
    product_id INT NULL,
    kol_product INT DEFAULT 0,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (flower_id) REFERENCES flowers(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);
GO
