USE ForConnections
GO

CREATE TABLE orders(
	id uniqueidentifier,
	product_id uniqueidentifier,
	customer_id uniqueidentifier,
	price MONEY
)
GO
INSERT INTO orders
VALUES (NewId(), NewId(), NewId(), DatePart(MICROSECOND, GetDate()))
GO 999999

SELECT * FROM orders