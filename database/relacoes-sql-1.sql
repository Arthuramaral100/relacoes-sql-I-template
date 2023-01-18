-- Active: 1674045452293@@127.0.0.1@3306

-- Práticas

CREATE TABLE users(
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL
);

SELECT * FROM users;

CREATE TABLE phones(
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    phone_number TEXT UNIQUE NOT NULL,
    user_id TEXT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users (id)
);

SELECT * FROM phones;

INSERT INTO users ( id, name, email, password )
VALUES ("u001", "João", "joaolabenu@email.com", "joao123456"),
        ("u002", "Maria", "maria@labenu.com", "mariazinha123");

INSERT INTO phones (id, phone_number, user_id)
VALUES ("p001", "5531999999999", "u001"),
        ("p002", "5531988888888", "u002"),
        ("p003", "5531977777777", "u001");

SELECT users.id AS userId, 
users.name, 
users.email, 
users.password, 
phones.id AS phoneId, 
phones.phone_number
FROM users
INNER JOIN phones
ON phones.user_id = users.id;


-----------------------------------------------------------------------------------------------------------------

CREATE TABLE licenses (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    register_number TEXT UNIQUE NOT NULL,
    category TEXT NOT NULL
);

DROP TABLE licenses;

CREATE TABLE drivers (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    license_id TEXT UNIQUE NOT NULL,
    FOREIGN KEY (license_id) REFERENCES licenses (id)
);

INSERT INTO licenses (id, register_number, category )
VALUES ("1001", "1111111", "A"),
        ("1002", "22222222", "AB");

INSERT INTO drivers(id, name, email, password, license_id)
VALUES ("d001", "Joao", "joao@gmail.com", "123joao", "1001"),
        ("d002", "Maria", "maria@labenu.com", "456maria", "1002");

SELECT * FROM licenses
INNER JOIN drivers
ON drivers.license_id = licenses.id;

--------------------------------------------------------------------------------------------------------

CREATE TABLE turma (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    turno TEXT NOT NULL
);

DROP TABLE turma;

CREATE TABLE students(
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL, 
    class_id TEXT NOT NULL,
    FOREIGN KEY (class_id) REFERENCES turma (id)
);

INSERT INTO turma(id, name, turno)
VALUES ("c001", "Ammal", "Integral"),
        ("c002", "Ozemela", "Noturno");

INSERT INTO students(id, name, email, class_id)
VALUES ("s001", "Maria", "maria@labenu.com", "c001"),
        ("s002", "Joao", "joao@labenu.com", "c002");

SELECT * FROM turma
INNER JOIN students
ON turma.id = students.class_id
