USE TaskDB2
GO

DROP TABLE IF EXISTS product_reviews
DROP TABLE IF EXISTS special_offers
DROP TABLE IF EXISTS documents
DROP TABLE IF EXISTS vendors
DROP TABLE IF EXISTS state_provinces
DROP TABLE IF EXISTS sales_persons
GO


CREATE TABLE product_reviews
(
    ProductReviewID int PRIMARY KEY,
    ProductID int,
    ReviewerName nvarchar(50),
    ReviewDate datetime,
    EmailAddress nvarchar(50),
    Rating int,
    Comments nvarchar(3850)
) ON FG_Shop1
GO

INSERT product_reviews
(
    ProductReviewID,
    ProductID,
    ReviewerName,
    ReviewDate,
    EmailAddress,
    Rating,
    Comments
)
SELECT
    ProductReviewID,
    ProductID,
    ReviewerName,
    ReviewDate,
    EmailAddress,
    Rating,
    Comments
FROM AdventureWorks2019.Production.ProductReview
GO


CREATE TABLE special_offers
(
    SpecialOfferID int PRIMARY KEY,
    DiscountPct smallmoney,
    Type nvarchar(50),
    Category nvarchar(50),
    StartDate datetime,
    EndDate datetime,
    MinQty int
) ON FG_Shop1
GO

INSERT special_offers
(
    SpecialOfferID,
    DiscountPct,
    Type,
    Category,
    StartDate,
    EndDate,
    MinQty
)
SELECT
    SpecialOfferID,
    DiscountPct,
    Type,
    Category,
    StartDate,
    EndDate,
    MinQty
FROM AdventureWorks2019.Sales.SpecialOffer
GO


CREATE TABLE documents
(
    DocumentNode hierarchyid PRIMARY KEY,
    Title nvarchar(50),
    Owner int,
    FolderFlag bit,
    FileName nvarchar(400),
    FileExtension nvarchar(8),
    Revision nchar(5)
) ON FG_Shop1
GO

INSERT documents
(
    DocumentNode,
    Title,
    Owner,
    FolderFlag,
    FileName,
    FileExtension,
    Revision
)
SELECT
    DocumentNode,
    Title,
    Owner,
    FolderFlag,
    FileName,
    FileExtension,
    Revision
FROM AdventureWorks2019.Production.Document
GO


CREATE TABLE vendors
(
    BusinessEntityID int PRIMARY KEY,
    AccountNumber nvarchar(15),
    Name nvarchar(50),
    CreditRating tinyint,
    PreferredVendorStatus bit,
    ActiveFlag bit,
    PurchasingWebServiceURL nvarchar(1024)
) ON FG_Shop2
GO

INSERT vendors
(
    BusinessEntityID,
    AccountNumber,
    Name,
    CreditRating,
    PreferredVendorStatus,
    ActiveFlag,
    PurchasingWebServiceURL
)
SELECT
    BusinessEntityID,
    AccountNumber,
    Name,
    CreditRating,
    PreferredVendorStatus,
    ActiveFlag,
    PurchasingWebServiceURL
FROM AdventureWorks2019.Purchasing.Vendor
GO


CREATE TABLE state_provinces
(
    StateProvinceID int PRIMARY KEY,
    StateProvinceCode nchar(3),
    CountryRegionCode nvarchar(3),
    IsOnlyStateProvinceFlag bit,
    Name nvarchar(50),
    TerritoryID int,
    rowguid uniqueidentifier
) ON FG_Shop2
GO

INSERT state_provinces
(
    StateProvinceID,
    StateProvinceCode,
    CountryRegionCode,
    IsOnlyStateProvinceFlag,
    Name,
    TerritoryID,
    rowguid
)
SELECT
    StateProvinceID,
    StateProvinceCode,
    CountryRegionCode,
    IsOnlyStateProvinceFlag,
    Name,
    TerritoryID,
    rowguid
FROM AdventureWorks2019.Person.StateProvince
GO


CREATE TABLE sales_persons
(
    BusinessEntityID int PRIMARY KEY,
    TerritoryID int,
    SalesQuota money,
    Bonus money,
    CommissionPct smallmoney,
    SalesYTD money,
    SalesLastYear money
) ON FG_Shop2
GO

INSERT sales_persons
(
    BusinessEntityID,
    TerritoryID,
    SalesQuota,
    Bonus,
    CommissionPct,
    SalesYTD,
    SalesLastYear
)
SELECT
    BusinessEntityID,
    TerritoryID,
    SalesQuota,
    Bonus,
    CommissionPct,
    SalesYTD,
    SalesLastYear
FROM AdventureWorks2019.Sales.SalesPerson
GO


SELECT * FROM product_reviews
SELECT * FROM special_offers
SELECT * FROM documents
SELECT * FROM vendors
SELECT * FROM state_provinces
SELECT * FROM sales_persons
GO