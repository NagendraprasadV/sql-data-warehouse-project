/*
===============================================================================
Create Bronze Tables
===============================================================================
Script Purpose:
    This script creates tables in the 'bronze' schema, dropping existing tables 
    if they already exist.

===============================================================================
*/

IF OBJECT_ID('bronze.crm_customer_info', 'U') IS NOT NULL
    DROP TABLE bronze.crm_customer_info;

GO

CREATE TABLE bronze.crm_customer_info(
    customer_id INT,
    customer_key VARCHAR(50),
    customer_first_name VARCHAR(50),
    customer_last_name VARCHAR(50),
    customer_material_status VARCHAR(50),
    customer_gender VARCHAR(50),
    customer_created_date DATE
);

GO

IF OBJECT_ID('bronze.crm_product_info', 'U') IS NOT NULL
    DROP TABLE bronze.crm_product_info;

GO

CREATE TABLE bronze.crm_product_info(
    product_id INT,
    product_key VARCHAR(50),
    product_name VARCHAR(50),
    product_cost VARCHAR(50),
    product_line VARCHAR(50),
    product_start_date DATETIME,
    product_end_date DATETIME
);

GO

IF OBJECT_ID('bronze.crm_sales_details', 'U') IS NOT NULL
    DROP TABLE bronze.crm_sales_details;

GO


CREATE TABLE bronze.crm_sales_details(
    sales_order_num VARCHAR(50),
    sales_product_key VARCHAR(50),
    sales_customer_id INT,
    sales_order_date INT,
    sales_ship_date INT,
    sales_due_date INT,
    sales INT,
    sales_quantity INT,
    sales_price FLOAT,
);

GO

IF OBJECT_ID('bronze.erp_loc_a101', 'U') IS NOT NULL
    DROP TABLE bronze.erp_loc_a101;

GO

CREATE TABLE bronze.erp_loc_a101(
    customer_key VARCHAR(50),
    country VARCHAR(50)
);

GO

IF OBJECT_ID('bronze.erp_customer_az12', 'U') IS NOT NULL
    DROP TABLE bronze.erp_customer_az12;

GO

CREATE TABLE bronze.erp_customer_az12(
    customer_key VARCHAR(50),
    dob DATE,
    gender VARCHAR(50)
);

GO


IF OBJECT_ID('bronze.erp_px_cat_g1v2', 'U') IS NOT NULL
    DROP TABLE bronze.erp_px_cat_g1v2;

GO

CREATE TABLE bronze.erp_px_cat_g1v2(
    id VARCHAR(50),
    cat VARCHAR(50),
    subcat VARCHAR(50),
    maintenance VARCHAR(50)
);

GO


