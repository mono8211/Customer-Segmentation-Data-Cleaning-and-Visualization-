-- Removing safe mode
set sql_safe_updates = 0;

SELECT 
    *
FROM
    customer_table;

DELIMITER //
CREATE PROCEDURE cust()
BEGIN
SELECT  * FROM customer_table;
END //
DELIMITER ; 

CALL cust();


-- Renaming columns
CALL cust();
-- the name of the columns are good for me, then I wont change them


-- Identifying duplicate values
SELECT 
    customer_id, COUNT(*) AS cantidad_duplicados
FROM
    customer_table
GROUP BY customer_id
HAVING COUNT(*);
-- There is not duplicate values

--  Properties of the table
DESCRIBE customer_table;
-- The columns purchase_history is in text format, I will change to datetime format

-- Indentifying spaces between characters
CALL customer_table()
SELECT 
    first_name
FROM
    customer_table
WHERE
    LENGTH(first_name) - LENGTH(TRIM(first_name)) > 0;

SELECT 
    last_name
FROM
    customer_table
WHERE
    LENGTH(last_name) - LENGTH(TRIM(last_name)) > 0;

SELECT 
    country
FROM
    customer_table
WHERE
    LENGTH(country) - LENGTH(TRIM(country)) > 0;
    
SELECT 
    gender
FROM
    customer_table
WHERE
    LENGTH(gender) - LENGTH(TRIM(gender)) > 0;

SELECT 
    favorite_color
FROM
    customer_table
WHERE
    LENGTH(favorite_color) - LENGTH(TRIM(favorite_color)) > 0;

SELECT 
    shirt_size
FROM
    customer_table
WHERE
    LENGTH(shirt_size) - LENGTH(TRIM(shirt_size)) > 0;
    
SELECT 
    mobile_device_os
FROM
    customer_table
WHERE
    LENGTH(mobile_device_os) - LENGTH(TRIM(mobile_device_os)) > 0;
    
SELECT 
    mobile_device_os,
    TRIM(mobile_device_os) AS mobile_d_o_trimed
FROM
    customer_table
WHERE
    LENGTH(mobile_device_os) - LENGTH(TRIM(mobile_device_os)) > 0;
    
-- Updating the column with spaces between characters
UPDATE customer_table 
SET 
    mobile_device_os = TRIM(mobile_device_os)
WHERE
    LENGTH(mobile_device_os) - LENGTH(TRIM(mobile_device_os)) > 0;
    
select credit_card_type
from customer_table
where credit_card_type = "americanexpress";

UPDATE customer_table 
SET 
    credit_card_type = 'american express'
WHERE
    credit_card_type = 'americanexpress';
	
SELECT 
    gender
FROM
    customer_table
WHERE
    gender <> 'Male' AND gender <> 'Female';
    
UPDATE customer_table 
SET 
    gender = 'Other'
WHERE
    gender <> 'Male' AND gender <> 'Female';


--  Identifying kind of mobile phone
SELECT DISTINCT
    mobile_device_os
FROM
    customer_table;

SELECT 
    mobile_device_os,
    CASE
        WHEN mobile_device_os LIKE 'Android%' THEN 'Android'
        WHEN mobile_device_os LIKE '%Feature%' THEN 'iOS'
        WHEN mobile_device_os LIKE '%iOS%' THEN 'iOS'
        WHEN mobile_device_os LIKE '%watch%' THEN 'iOS'
        ELSE 'other'
    END AS mobile_device
FROM
    customer_table;

UPDATE customer_table SET mobile_device_os = CASE
        WHEN mobile_device_os LIKE 'Android%' THEN 'Android'
        WHEN mobile_device_os LIKE '%Feature%' THEN 'iOS'
        WHEN mobile_device_os LIKE '%iOS%' THEN 'iOS'
        WHEN mobile_device_os LIKE '%watch%' THEN 'iOS'
        ELSE 'other'
    END;

CALL cust()

-- Identifying values of the pruchase_history column
SELECT 
    purchase_history
FROM
    customer_table;
-- There are not values, then, this column will be dropped

-- Identifying values of the credit_card_history column
SELECT DISTINCT
    credit_card_type
FROM
    customer_table;

SELECT 
    COALESCE(credit_card_type, 'other') AS total_count,
    COUNT(*) AS count
FROM
    customer_table
GROUP BY total_count;
-- There are a significative quantity of null values, then I decided to mantain them with other name
SELECT 
    COALESCE(credit_card_type, 'other') as credit_card_franq
FROM
    customer_table;

UPDATE customer_table 
SET 
    credit_card_type = COALESCE(credit_card_type, 'other');
call cust()


-- Selecting the columns to export to data visualization

SELECT 
    customer_id,
    first_name,
    last_name,
    age,
    country,
    gender,
    favorite_color,
    shirt_size,
    credit_card_type,
    mobile_device_os
FROM
    customer_table;