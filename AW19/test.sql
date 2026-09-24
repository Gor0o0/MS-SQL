
USE TaskDB2
GO

IF OBJECT_ID('dbo.ProductReview', 'U') IS NOT NULL
    DROP TABLE dbo.ProductReview;

IF OBJECT_ID('dbo.SpecialOffer', 'U') IS NOT NULL
    DROP TABLE dbo.SpecialOffer;

IF OBJECT_ID('dbo.Document', 'U') IS NOT NULL
    DROP TABLE dbo.Document;

IF OBJECT_ID('dbo.Vendor', 'U') IS NOT NULL
    DROP TABLE dbo.Vendor;

IF OBJECT_ID('dbo.StateProvince', 'U') IS NOT NULL
    DROP TABLE dbo.StateProvince;

IF OBJECT_ID('dbo.Employee', 'U') IS NOT NULL
    DROP TABLE dbo.Employee;
GO