CREATE TABLE Services (
    id INT PRIMARY KEY IDENTITY(1,1),
    service_name VARCHAR(100) NOT NULL,
    description VARCHAR(200)
);
GO

INSERT INTO Services (service_name, description)
VALUES
('CloudSafe', ''),
('SecureBox', '');
GO

INSERT INTO EncryptionKeys (service_id, key_name, algorithm)
VALUES
(1, '', ''),
(1, '', ''),
(2, '', '');
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
(1, '', ''),
(2, '', '');
GO