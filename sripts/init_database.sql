-- Connect to the master database
USE master;
GO

-- Create the DataWarehouse database if it doesn't already exist
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'DataWarehouse')
BEGIN
    CREATE DATABASE DataWarehouse;
END
GO

-- Switch to the DataWarehouse database
USE DataWarehouse;
GO

-- Create schemas representing Medallion architecture layers
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
