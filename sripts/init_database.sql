/*
===============================================================================
Create Database and Schemas
===============================================================================

Script Purpose:
    This script creates a new database named 'DataWarehouse' after checking if 
    it already exists. If the database exists, it will NOT be recreated.
    Additionally, the script sets up three schemas within the database:
    'bronze', 'silver', and 'gold', following the Medallion architecture.

WARNING:
    This script is safe to run multiple times. It will not drop the existing
    'DataWarehouse' database or schemas. However, modifying it to include 
    DROP statements may result in data loss. Always back up your data before
    making structural changes to production databases.

Requirements:
    - SQL Server environment (e.g., SSMS or Azure Data Studio)
    - Sufficient privileges to create databases and schemas
    - Optional: Run with elevated permissions if executing on shared instances

Scenarios:
    - Initial setup of a data warehouse project
    - Setting up environments for ETL pipelines using Medallion architecture
    - Running automated deployments that require schema creation validation

===============================================================================
*/

-- Connect to master
USE master;
GO

-- Create the DataWarehouse database if it doesn't already exist
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'DataWarehouse')
BEGIN
    CREATE DATABASE DataWarehouse;
END
GO

-- Switch context to the DataWarehouse database
USE DataWarehouse;
GO

-- Create schemas if they don't exist
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'bronze')
BEGIN
    EXEC('CREATE SCHEMA bronze');
END
GO

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'silver')
BEGIN
    EXEC('CREATE SCHEMA silver');
END
GO

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'gold')
BEGIN
    EXEC('CREATE SCHEMA gold');
END
GO
