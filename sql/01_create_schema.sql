CREATE DATABASE OlistDQ;
GO

USE OlistDQ;
GO

CREATE TABLE customers (
    customer_id NVARCHAR(50) PRIMARY KEY,
    customer_unique_id NVARCHAR(50),
    customer_zip_code_prefix INT,
    customer_city NVARCHAR(100),
    customer_state NVARCHAR(10)
);

CREATE TABLE sellers (
    seller_id NVARCHAR(50) PRIMARY KEY,
    seller_zip_code_prefix INT,
    seller_city NVARCHAR(100),
    seller_state NVARCHAR(10)
);

CREATE TABLE products (
    product_id NVARCHAR(50) PRIMARY KEY,
    product_category_name NVARCHAR(100),
    product_name_lenght INT,
    product_description_lenght INT,
    product_photos_qty INT,
    product_weight_g INT,
    product_length_cm INT,
    product_height_cm INT,
    product_width_cm INT
);

CREATE TABLE product_category_name_translation (
    product_category_name NVARCHAR(100) PRIMARY KEY,
    product_category_name_english NVARCHAR(100)
);

CREATE TABLE orders (
    order_id NVARCHAR(50) PRIMARY KEY,
    customer_id NVARCHAR(50),
    order_status NVARCHAR(50),
    order_purchase_timestamp DATETIME2,
    order_approved_at DATETIME2,
    order_delivered_carrier_date DATETIME2,
    order_delivered_customer_date DATETIME2,
    order_estimated_delivery_date DATETIME2,

    CONSTRAINT FK_orders_customers
        FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_id NVARCHAR(50),
    order_item_id INT,
    product_id NVARCHAR(50),
    seller_id NVARCHAR(50),
    shipping_limit_date DATETIME2,
    price DECIMAL(10,2),
    freight_value DECIMAL(10,2),

    CONSTRAINT PK_order_items 
        PRIMARY KEY (order_id, order_item_id),

    CONSTRAINT FK_order_items_orders
        FOREIGN KEY (order_id)
        REFERENCES orders(order_id),

    CONSTRAINT FK_order_items_products
        FOREIGN KEY (product_id)
        REFERENCES products(product_id),

    CONSTRAINT FK_order_items_sellers
        FOREIGN KEY (seller_id)
        REFERENCES sellers(seller_id)
);

CREATE TABLE order_payments (
    order_id NVARCHAR(50),
    payment_sequential INT,
    payment_type NVARCHAR(50),
    payment_installments INT,
    payment_value DECIMAL(10,2),

    CONSTRAINT PK_order_payments
        PRIMARY KEY (order_id, payment_sequential),

    CONSTRAINT FK_order_payments_orders
        FOREIGN KEY (order_id)
        REFERENCES orders(order_id)
);

CREATE TABLE order_reviews (
    review_id NVARCHAR(50),
    order_id NVARCHAR(50),
    review_score INT,
    review_comment_title NVARCHAR(255),
    review_comment_message NVARCHAR(MAX),
    review_creation_date DATETIME2,
    review_answer_timestamp DATETIME2,

    CONSTRAINT PK_order_reviews 
        PRIMARY KEY (review_id, order_id),

    CONSTRAINT FK_order_reviews_orders
        FOREIGN KEY (order_id)
        REFERENCES orders(order_id)
);

CREATE TABLE geolocation (
    geolocation_zip_code_prefix INT,
    geolocation_lat FLOAT,
    geolocation_lng FLOAT,
    geolocation_city NVARCHAR(100),
    geolocation_state NVARCHAR(10)
);
