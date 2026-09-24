USE TenTableDB
GO

WHILE 1=1
	SELECT *
	INTO orders2
	FROM orders
GO

CREATE NONCLUSTERED INDEX ncl1_index
	ON orders2(product_id, customer_id)
	INCLUDE(price)
GO

CREATE COLUMNSTORE INDEX cl1_index
	ON orders2(price)
GO

SELECT * FROM orders2 WHERE id=""