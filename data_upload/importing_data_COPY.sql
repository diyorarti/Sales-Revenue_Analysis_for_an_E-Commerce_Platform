-- importing data using COPY

-- importing data for customers_dataset table
COPY customers_dataset
FROM 'D:\Users\User\SQL\Sales-Revenue_Analysis_for_an_E-Commerce_Platform\data\customers_dataset.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

-- importing data for sellers_data table
COPY sellers_dataset
FROM 'D:\Users\User\SQL\Sales-Revenue_Analysis_for_an_E-Commerce_Platform\data\sellers_dataset.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

-- importing data for products_dataset table
COPY products_dataset
FROM 'D:\Users\User\SQL\Sales-Revenue_Analysis_for_an_E-Commerce_Platform\data\products_dataset.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

-- importing data for orders_dataset table
COPY orders_dataset
FROM 'D:\Users\User\SQL\Sales-Revenue_Analysis_for_an_E-Commerce_Platform\data\orders_dataset.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

-- importing data for order_items_dataset
COPY order_items_dataset
FROM 'D:\Users\User\SQL\Sales-Revenue_Analysis_for_an_E-Commerce_Platform\data\order_items_dataset.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

-- importing data for order_payments_dataset table
COPY order_payments_dataset
FROM 'D:\Users\User\SQL\Sales-Revenue_Analysis_for_an_E-Commerce_Platform\data\order_payments_dataset.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

-- importing data for order_reviews_dataset table
COPY order_reviews_dataset
FROM 'D:\Users\User\SQL\Sales-Revenue_Analysis_for_an_E-Commerce_Platform\data\order_reviews_dataset.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

-- importing data for geolocation_dataset table
COPY geolocation_dataset
FROM 'D:\Users\User\SQL\Sales-Revenue_Analysis_for_an_E-Commerce_Platform\data\geolocation_dataset.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

-- importing data for product_category_name_translation table
COPY product_category_name_translation
FROM 'D:\Users\User\SQL\Sales-Revenue_Analysis_for_an_E-Commerce_Platform\data\product_category_name_translation.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');
