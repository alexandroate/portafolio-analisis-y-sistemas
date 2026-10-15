-- Borrar tablas si existen (por seguridad)
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS detalles_pedido;
DROP TABLE IF EXISTS pedidos;

-- 1. Tabla Clientes (olist_customers_dataset.csv)
CREATE TABLE clientes (
    customer_id VARCHAR(50) PRIMARY KEY,
    customer_unique_id VARCHAR(50),
    customer_zip_code_prefix INT,
    customer_city VARCHAR(50),
    customer_state CHAR(2)
);

-- 2. Tabla Pedidos (olist_orders_dataset.csv)
CREATE TABLE pedidos (
    order_id VARCHAR(50) PRIMARY KEY,
    customer_id VARCHAR(50),
    order_status VARCHAR(20),
    order_purchase_timestamp TIMESTAMP,
    order_approved_at TIMESTAMP,
    order_delivered_carrier_date TIMESTAMP,
    order_delivered_customer_date TIMESTAMP,
    order_estimated_delivery_date TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES clientes(customer_id)
);

-- 3. Tabla Detalles de Pedido (olist_order_items_dataset.csv)
CREATE TABLE detalles_pedido (
    order_id VARCHAR(50),
    order_item_id INT,
    product_id VARCHAR(50),
    seller_id VARCHAR(50),
    shipping_limit_date TIMESTAMP,
    price DECIMAL(10, 2),
    freight_value DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES pedidos(order_id)
);