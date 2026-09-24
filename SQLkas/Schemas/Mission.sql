USE MissionDB
GO

CREATE SCHEMA Persons;
GO

CREATE SCHEMA Products;
GO

--2.
CREATE TABLE Persons.Iden(
	id INT NULL,
	Final_name nchar(20),
	Edne_name nchar(20),
	age TINYINT,
	country char(20),
);
GO

CREATE TABLE Persons.Info(
	id INT NULL,
	gmail nchar(20),
	number nchar(20),
	bio TINYINT,
	someting char(20),
);
GO

--INSERT INTO Persons.Iden
--VALUE (1, 'Alex','Doe', 33, 'Unknown'), (2, 'Steve','Due', 23, 'Unknownik');

--3.
ALTER TABLE Persons.Iden
ALTER COLUMN id BIGINT NULL;
GO


--4.
CREATE TABLE Products.Detail(
	id INT PRIMARY KEY IDENTITY(1,1),
	nama1 nchar(20),
	nama2 nchar(20),
);
GO

CREATE TABLE Products.Costa(
	id INT PRIMARY KEY IDENTITY(1,1),
	cost1 nchar(20),
	cost2 int,
);
GO

-- 5.
ALTER SCHEMA Persons
TRANSFER Products.Iden;
GO

ALTER SCHEMA Persons
TRANSFER Products.Details;
GO