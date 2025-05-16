CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    height_cm FLOAT,
    gender ENUM('m', 'w', 'div'),
    password VARCHAR(255)
);

CREATE TABLE weights (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    date DATE,
    weight_kg FLOAT
);

CREATE TABLE activities (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    date DATE,
    type VARCHAR(50),
    duration INT, 
    calories INT
);