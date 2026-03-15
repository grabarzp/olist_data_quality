BULK INSERT customers
FROM 'C:\\temp\\olist_customers_dataset.csv'
WITH (
    FORMAT='CSV',
    FIRSTROW=2,
    FIELDTERMINATOR=',',
    ROWTERMINATOR='0x0a'
);

BULK INSERT sellers
FROM 'C:\\temp\\olist_sellers_dataset.csv'
WITH (
    FORMAT='CSV',
    FIRSTROW=2,
    FIELDTERMINATOR=',',
    ROWTERMINATOR='0x0a'
);

BULK INSERT products
FROM 'C:\\temp\\olist_products_dataset.csv'
WITH (
    FORMAT='CSV',
    FIRSTROW=2,
    FIELDTERMINATOR=',',
    ROWTERMINATOR='0x0a'
);

BULK INSERT product_category_name_translation
FROM 'C:\\temp\\product_category_name_translation.csv'
WITH (
    FORMAT='CSV',
    FIRSTROW=2,
    FIELDTERMINATOR=',',
    ROWTERMINATOR='0x0a'
);

BULK INSERT orders
FROM 'C:\\temp\\olist_orders_dataset.csv'
WITH (
    FORMAT='CSV',
    FIRSTROW=2,
    FIELDTERMINATOR=',',
    ROWTERMINATOR='0x0a'
);

BULK INSERT order_items
FROM 'C:\\temp\\olist_order_items_dataset.csv'
WITH (
    FORMAT='CSV',
    FIRSTROW=2,
    FIELDTERMINATOR=',',
    ROWTERMINATOR='0x0a'
);

BULK INSERT order_payments
FROM 'C:\\temp\\olist_order_payments_dataset.csv'
WITH (
    FORMAT='CSV',
    FIRSTROW=2,
    FIELDTERMINATOR=',',
    ROWTERMINATOR='0x0a'
);

BULK INSERT order_reviews
FROM 'C:\\temp\\olist_order_reviews_dataset.csv'
WITH (
    FORMAT='CSV',
    FIRSTROW=2,
    FIELDTERMINATOR=','
);

BULK INSERT geolocation
FROM 'C:\\temp\\olist_geolocation_dataset.csv'
WITH (
    FORMAT='CSV',
    FIRSTROW=2,
    FIELDTERMINATOR=',',
    ROWTERMINATOR='0x0a'
);


SELECT COUNT(*) AS customers FROM customers;
SELECT COUNT(*) AS sellers FROM sellers;
SELECT COUNT(*) AS products FROM products;
SELECT COUNT(*) AS orders FROM orders;
SELECT COUNT(*) AS order_items FROM order_items;
SELECT COUNT(*) AS order_payments FROM order_payments;
SELECT COUNT(*) AS order_reviews FROM order_reviews;
SELECT COUNT(*) AS geolocation FROM geolocation;