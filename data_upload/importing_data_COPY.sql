-- importing data using COPY

-- importing data for customers_dataset table
COPY customers_dataset
FROM 'D:\Users\User\SQL\Sales-Revenue_Analysis_for_an_E-Commerce_Platform\data\customers_dataset.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

-- importing data for sellers_data table
COPY sellers_dataset
FROM 'D:\Users\User\SQL\Sales-Revenue_Analysis_for_an_E-Commerce_Platform\data\sellers_dataset.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');



-- importing data for order_payments_dataset table
COPY order_payments_dataset
FROM 'D:\Users\User\SQL\Sales-Revenue_Analysis_for_an_E-Commerce_Platform\data\order_payments_dataset.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

SELECT * FROM order_payments_dataset;