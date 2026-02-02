-- importing data using COPY

-- importing data for order_payments_dataset.csv
COPY order_payments_dataset
FROM 'D:\Users\User\SQL\Sales-Revenue_Analysis_for_an_E-Commerce_Platform\data\order_payments_dataset.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

SELECT * FROM order_payments_dataset;