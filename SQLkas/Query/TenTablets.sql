USE TenTables;
GO

IF OBJECT_ID('GameGenres', 'U') IS NOT NULL DROP TABLE GameGenres;
IF OBJECT_ID('Purchases', 'U') IS NOT NULL DROP TABLE Purchases;
IF OBJECT_ID('Libraries', 'U') IS NOT NULL DROP TABLE Libraries;
IF OBJECT_ID('Wallets', 'U') IS NOT NULL DROP TABLE Wallets;
IF OBJECT_ID('UserProfiles', 'U') IS NOT NULL DROP TABLE UserProfiles;
IF OBJECT_ID('Games', 'U') IS NOT NULL DROP TABLE Games;
IF OBJECT_ID('Genres', 'U') IS NOT NULL DROP TABLE Genres;
IF OBJECT_ID('Developers', 'U') IS NOT NULL DROP TABLE Developers;
IF OBJECT_ID('Publishers', 'U') IS NOT NULL DROP TABLE Publishers;
IF OBJECT_ID('Users', 'U') IS NOT NULL DROP TABLE Users;
GO


CREATE TABLE Users (
    id INT PRIMARY KEY IDENTITY(1,1),
    username NVARCHAR(50) NOT NULL,
    age INT NOT NULL
        CHECK (age >= 13 AND age <= 100),
    is_active BIT NOT NULL DEFAULT 1
);
GO

INSERT INTO Users (username, age)
VALUES
(N'Goro', 22),
(N'Mina', 25),
(N'Maks', 19),
(N'Kate', 28),
(N'Kill', 31);
GO
---------

CREATE TABLE UserProfiles (
    id INT PRIMARY KEY IDENTITY(1,1),
    user_id INT NOT NULL UNIQUE,
    full_name NVARCHAR(100),
    birth_date DATE,
    
    FOREIGN KEY (user_id) REFERENCES Users(id)
);
GO

INSERT INTO UserProfiles (user_id, full_name, birth_date)
VALUES
(1, N'Goro Rey', '2004-03-12'),
(2, N'Mina Nou', '2001-07-20'),
(3, N'Maks White', '2006-01-15'),
(4, N'Kate Green', '1998-11-05'),
(5, N'Kill Smith', '1995-06-30');
GO
---------

CREATE TABLE Developers (
    id INT PRIMARY KEY IDENTITY(1,1),
    name NVARCHAR(100) NOT NULL
);
GO

INSERT INTO Developers (name)
VALUES
(N'Alex'),
(N'Nastya'),
(N'Polina'),
(N'Sheckspir'),
(N'Anderson');
GO
---------

CREATE TABLE Publishers (
    id INT PRIMARY KEY IDENTITY(1,1),
    name NVARCHAR(100) NOT NULL
);
GO

INSERT INTO Publishers (name)
VALUES
(N'Gamefusion'),
(N'Gaben'),
(N'Shanel'),
(N'Guchi'),
(N'Prada');
GO
---------

CREATE TABLE Games (
    id INT PRIMARY KEY IDENTITY(1,1),
    name NVARCHAR(100) NOT NULL,
    release_date DATE,
    price DECIMAL(10,2) NOT NULL
        CHECK (price >= 0),
    is_free BIT NOT NULL DEFAULT 0,

    developer_id INT NOT NULL,
    publisher_id INT NOT NULL,

    FOREIGN KEY (developer_id) REFERENCES Developers(id),
    FOREIGN KEY (publisher_id) REFERENCES Publishers(id)
);
GO

INSERT INTO Games
    (name, release_date, price, developer_id, publisher_id)
VALUES
(N'TikTok', '2024-05-10', 19.99, 1, 1),
(N'CofeMake', '2023-09-20', 29.99, 2, 2),
(N'Brawl Stars', '2022-02-15', 9.99, 3, 3),
(N'Roblox', '2025-01-30', 24.99, 4, 4),
(N'Slime Rancher', '2021-08-12', 0.00, 5, 5);
GO
---------

CREATE TABLE Genres (
    id INT PRIMARY KEY IDENTITY(1,1),
    name NVARCHAR(50) NOT NULL
);
GO

INSERT INTO Genres (name)
VALUES
(N'RPG'),
(N'Horror'),
(N'Action'),
(N'Adventure'),
(N'Simulation');
GO
---------
CREATE TABLE GameGenres (
    game_id INT NOT NULL,
    genre_id INT NOT NULL,

    PRIMARY KEY (game_id, genre_id),

    FOREIGN KEY (game_id) REFERENCES Games(id),
    FOREIGN KEY (genre_id) REFERENCES Genres(id)
);
GO

INSERT INTO GameGenres (game_id, genre_id)
VALUES
(1, 4),
(1, 1),
(2, 3),
(3, 5),
(4, 2),
(5, 5);
GO
---------

CREATE TABLE Purchases (
    id INT PRIMARY KEY IDENTITY(1,1),
    user_id INT NOT NULL,
    game_id INT NOT NULL,
    purchase_date DATETIME2 NOT NULL DEFAULT SYSDATETIME(),

    FOREIGN KEY (user_id) REFERENCES Users(id),
    FOREIGN KEY (game_id) REFERENCES Games(id)
);
GO

INSERT INTO Purchases (user_id, game_id)
VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 4),
(4, 1);
GO
---------

CREATE TABLE Libraries (
    id INT PRIMARY KEY IDENTITY(1,1),
    user_id INT NOT NULL,
    game_id INT NOT NULL,

    FOREIGN KEY (user_id) REFERENCES Users(id),
    FOREIGN KEY (game_id) REFERENCES Games(id)
);
GO

INSERT INTO Libraries (user_id, game_id)
VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 4),
(4, 1);
GO
---------

CREATE TABLE Wallets (
    id INT PRIMARY KEY IDENTITY(1,1),
    user_id INT NOT NULL UNIQUE,
    balance DECIMAL(10,2) NOT NULL DEFAULT 0
        CHECK (balance >= 0),

    FOREIGN KEY (user_id) REFERENCES Users(id)
);
GO

INSERT INTO Wallets (user_id, balance)
VALUES
(1, 100.00),
(2, 50.00),
(3, 25.50),
(4, 200.00),
(5, 0.00);
GO
---------

SELECT * FROM Users;

SELECT * FROM UserProfiles;

SELECT * FROM Developers;

SELECT * FROM Publishers;

SELECT * FROM Games;

SELECT * FROM Genres;

SELECT * FROM GameGenres;

SELECT * FROM Purchases;

SELECT * FROM Libraries;

SELECT * FROM Wallets;
GO

SELECT
    Users.username,
    Games.name AS game_name,
    Purchases.purchase_date
FROM Purchases
JOIN Users ON Purchases.user_id = Users.id
JOIN Games ON Purchases.game_id = Games.id;
GO

SELECT
    Games.name AS game_name,
    Developers.name AS developer,
    Genres.name AS genre
FROM GameGenres
JOIN Games ON GameGenres.game_id = Games.id
JOIN Genres ON GameGenres.genre_id = Genres.id
JOIN Developers ON Games.developer_id = Developers.id;
GO