USE DB1
GO

--SELECT COUNT(*) Size FROM Production.Product
--WHERE Size IS NOT NULL

--SELECT Name, ProductNumber FROM Production.Product


CREATE TABLE products(
	id int PRIMARY KEY IDENTITY(1,1),
	name VARCHAR(100),
	product_number VARCHAR(40),
	standart_cost MONEY,
	list_price MONEY
)


INSERT products(name, product_number, standart_cost, list_price)
SELECT Name, ProductNumber, StandardCost, ListPrice
FROM AdventureWorks2019.Production.Product

SELECT * FROM AdventureWorks2019.Production.Product

SELECT TOP(1000) [id], [name], [product_number], [standart_cost], [list_price], [diff_price], [delivery_date] FROM [DB1].[dbo].[products]

CREATE VIEW dbo.v_Products_select AS SELECT name, product_number FROM products
GO



SELECT * dbo.v_Products_select

CREATE VIEW dbo.v_Products_select2 AS diff_price FROM products
GO

CREATE VIEW dbo.v_Products_select3 WITH SCHEMABINDING AS diff_price FROM products
GO

CREATE PROCEDURE uspSale
AS
BEGIN
	SELECT standart_cost * 0.9
	FROM products
END

EXECUTE uspSale