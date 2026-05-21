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
    cst_id              INT,
    cst_key             NVARCHAR(50),
    cst_firstname       NVARCHAR(50),
    cst_lastname        NVARCHAR(50),
    cst_marital_status  NVARCHAR(50),
    cst_gndr            NVARCHAR(50),
    cst_create_date     DATE
);

GO

IF OBJECT_ID('bronze.crm_product_info', 'U') IS NOT NULL
    DROP TABLE bronze.crm_product_info;

GO

CREATE TABLE bronze.crm_product_info(
    prd_id       INT,
    prd_key      NVARCHAR(50),
    prd_nm       NVARCHAR(50),
    prd_cost     INT,
    prd_line     NVARCHAR(50),
    prd_start_dt DATETIME,
    prd_end_dt   DATETIME
);

GO

IF OBJECT_ID('bronze.crm_sales_details', 'U') IS NOT NULL
    DROP TABLE bronze.crm_sales_details;

GO


CREATE TABLE bronze.crm_sales_details(
    sls_ord_num  NVARCHAR(50),
    sls_prd_key  NVARCHAR(50),
    sls_cust_id  INT,
    sls_order_dt INT,
    sls_ship_dt  INT,
    sls_due_dt   INT,
    sls_sales    INT,
    sls_quantity INT,
    sls_price    INT
);

GO

IF OBJECT_ID('bronze.erp_loc_a101', 'U') IS NOT NULL
    DROP TABLE bronze.erp_loc_a101;

GO

CREATE TABLE bronze.erp_loc_a101(
    cid    NVARCHAR(50),
    cntry  NVARCHAR(50)
);

GO

IF OBJECT_ID('bronze.erp_customer_az12', 'U') IS NOT NULL
    DROP TABLE bronze.erp_customer_az12;

GO

CREATE TABLE bronze.erp_customer_az12(
    cid    NVARCHAR(50),
    bdate  DATE,
    gen    NVARCHAR(50)
);

GO


IF OBJECT_ID('bronze.erp_px_cat_g1v2', 'U') IS NOT NULL
    DROP TABLE bronze.erp_px_cat_g1v2;

GO

CREATE TABLE bronze.erp_px_cat_g1v2(
    id           NVARCHAR(50),
    cat          NVARCHAR(50),
    subcat       NVARCHAR(50),
    maintenance  NVARCHAR(50)
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
