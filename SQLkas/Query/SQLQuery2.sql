USE KeyService;
GO

CREATE TABLE Services (
    id INT PRIMARY KEY IDENTITY(1,1),
    service_name VARCHAR(100) NOT NULL,
    description VARCHAR(200)
);
GO

INSERT INTO Services (service_name, description)
VALUES
('CloudSafe', 'Облачное хранение ключей'),
('SecureBox', 'Система управления доступом');
GO

CREATE TABLE EncryptionKeys (
    id INT PRIMARY KEY IDENTITY(1,1),
    service_id INT NOT NULL,
    key_name VARCHAR(100) NOT NULL,
    algorithm VARCHAR(50),

    FOREIGN KEY (service_id) REFERENCES Services(id)
);
GO

INSERT INTO EncryptionKeys (service_id, key_name, algorithm)
VALUES
(1, 'CloudSafe_Main', 'AES-256'),
(1, 'CloudSafe_Backup', 'AES-128'),
(2, 'SecureBox_Main', 'AES-256');
GO

CREATE TABLE PhysicalKeys (
    id INT PRIMARY KEY IDENTITY(1,1),
    service_id INT NOT NULL,
    key_name VARCHAR(100) NOT NULL,
    key_type VARCHAR(50),

    FOREIGN KEY (service_id) REFERENCES Services(id)
);
GO

INSERT INTO PhysicalKeys (service_id, key_name, key_type)
VALUES
(1, 'USB-Key-01', 'USB'),
(2, 'Hardware-Key-01', 'Hardware');
GO

CREATE TABLE AccessKeys (
    id INT PRIMARY KEY IDENTITY(1,1),
    service_id INT NOT NULL,
    key_name VARCHAR(100) NOT NULL,
    access_level VARCHAR(50),

    FOREIGN KEY (service_id) REFERENCES Services(id)
);
GO

INSERT INTO AccessKeys (service_id, key_name, access_level)
VALUES
(1, 'CloudSafe_Admin', 'Admin'),
(1, 'CloudSafe_User', 'User'),
(2, 'SecureBox_Admin', 'Admin');
GO

--DROP TABLE ApiKeys;
--GO

CREATE TABLE ApiKeys (
    id INT PRIMARY KEY IDENTITY(1,1),
    service_id INT,
    encryption_id INT,
    physical_id INT,
    access_id INT,

    FOREIGN KEY (service_id) REFERENCES Services(id),
    FOREIGN KEY (encryption_id) REFERENCES EncryptionKeys(id),
    FOREIGN KEY (physical_id) REFERENCES PhysicalKeys(id),
    FOREIGN KEY (access_id) REFERENCES AccessKeys(id)
);
GO

SELECT * FROM Services;

SELECT * FROM EncryptionKeys;

SELECT * FROM PhysicalKeys;

SELECT * FROM AccessKeys;

SELECT * FROM ApiKeys;
GO


SELECT
    Services.service_name,
    EncryptionKeys.key_name,
    EncryptionKeys.algorithm
FROM Services
INNER JOIN EncryptionKeys
    ON Services.id = EncryptionKeys.service_id;
GO