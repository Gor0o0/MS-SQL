CREATE TABLE orders(
	id int,
	number int,
	total_price money -- DEFAULT 0
)

ALTER TABLE orders
ADD CONSTRAINT DF_total_price DEFAULT 0 --index
GO

ALTER TABLE orders
ADD CONSTAINT chkRowCount CHECK (Len(total_price) >= 1)