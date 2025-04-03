crear_schema = """CREATE SCHEMA etl_db;"""

crear_tabla = """CREATE TABLE IF NOT EXISTS users (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    city VARCHAR(100)
);"""

insertar_users = """INSERT INTO users (id, name, email, city)
VALUES (%s, %s, %s, %s);"""

