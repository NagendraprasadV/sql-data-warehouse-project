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

IF OBJECT_ID('bronze.metadata_control', 'U') IS NOT NULL
    DROP TABLE bronze.metadata_control;


GO

-- create metdata control table
CREATE TABLE bronze.metadata_control (
    file_prefix VARCHAR(100) NOT NULL,
    target_table VARCHAR(100) NOT NULL,
    source_folder VARCHAR(100) NOT NULL
);

Go

-- Populate it with just the prefix and the exact target table name
INSERT INTO bronze.metadata_control (file_prefix, target_table, source_folder) VALUES 
('cust_info', 'crm_customer_info', 'source_crm'),
('prd_info', 'crm_product_info', 'source_crm'),
('sales_details', 'crm_sales_details', 'source_crm'),
('CUST_AZ12', 'erp_customer_az12', 'source_erp'),
('LOC_A101', 'erp_loc_a101', 'source_erp'),
('PX_CAT_G1V', 'erp_px_cat_g1v2', 'source_erp');

Go
