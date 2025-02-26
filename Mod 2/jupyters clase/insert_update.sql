-- Crear el esquema solo si no existe
CREATE SCHEMA IF NOT EXISTS bbdd_empleadas;
USE bbdd_empleadas;

-- Crear la tabla 'empleadas' si no existe
CREATE TABLE IF NOT EXISTS empleadas (
    id INT AUTO_INCREMENT PRIMARY KEY,      
    salario FLOAT,      
    nombre VARCHAR(50) NOT NULL,          
    apellido VARCHAR(50),        
    email VARCHAR(100) UNIQUE,  
    telefono VARCHAR(15),        
    ciudad VARCHAR(50),         
    pais VARCHAR(50)             
);

-- Insertar datos en la tabla 'empleadas'
INSERT INTO empleadas (salario, nombre, apellido, mail, telefono, ciudad, pais) VALUES
(2500, 'Ana', 'González', 'ana@adalab.es', '654785214', 'Madrid', 'España'),
(4000, 'Maria', 'López', 'maria@adalab.es', '689656322', 'Barcelona', 'España'),
(3000, 'Lucía', 'Ramos', 'lucia@gmail.com', '674459123', 'Valencia', 'España'),
(5000, 'Elena', 'Bueno', 'elena@adalab.es', '628546577', 'Bilbao', 'España'),
(1500, 'Rocío', 'García', 'rocio@gmail.com', '616365624', 'París', 'Francia');

SELECT *
	FROM empleadas;

-- ALTER TABLE

ALTER TABLE empleadas
ADD COLUMN fecha_inicio DATE;

SELECT *
	FROM empleadas;
    
ALTER TABLE empleadas
CHANGE email mail VARCHAR(75) UNIQUE;

SELECT *
	FROM empleadas;
    
ALTER TABLE empleadas
	MODIFY COLUMN nombre VARCHAR(100);

INSERT INTO empleadas (salario, nombre, apellido, mail, telefono, ciudad, pais, fecha_inicio)
VALUES (1800, 'Julia', 'Aguilar', 'julia@adalab.es', '614339261', 'Zaragoza', 'España', '2020-03-24'),
(2000, 'Irene', 'Montenegro', 'irene@adalab.es', '659745615', 'Cataluña', 'España', '2020-03-24'),
(3000, 'Laura', 'Navarro', 'laura@adalab.es', NULL, NULL, 'Italia', '2020-03-24');

INSERT INTO empleadas 
VALUES (32, 2800, 'Sara', 'Aguilar', 'sara@adalab.es', '614339261', 'Zaragoza', 'España', '2020-03-24');

SELECT *
	FROM empleadas;
    
INSERT INTO empleadas 
VALUES (8, 2800, 'Isa', 'Aguilar', 'isa@adalab.es', '614339261', 'Zaragoza', 'España', '2020-03-24');

UPDATE empleadas
	SET nombre = 'Isa'
    -- WHERE id = 8
    ;
    
SELECT *
	FROM empleadas;
    
DELETE FROM empleadas;

ALTER TABLE empleadas
AUTO_INCREMENT = 1;

INSERT INTO empleadas (salario, nombre, apellido, mail, telefono, ciudad, pais) VALUES
(2500, 'Ana', 'González', 'ana@adalab.es', '654785214', 'Madrid', 'España'),
(4000, 'Maria', 'López', 'maria@adalab.es', '689656322', 'Barcelona', 'España'),
(3000, 'Lucía', 'Ramos', 'lucia@gmail.com', '674459123', 'Valencia', 'España'),
(5000, 'Elena', 'Bueno', 'elena@adalab.es', '628546577', 'Bilbao', 'España'),
(1500, 'Rocío', 'García', 'rocio@gmail.com', '616365624', 'París', 'Francia');

TRUNCATE TABLE empleadas; -- sirve para VACIAR una tabla, resetea el auto_increment

SELECT *
	FROM empleadas;
    
INSERT INTO empleadas (salario, nombre, apellido, mail, telefono, ciudad, pais) VALUES
(2500, 'Ana', 'González', 'ana@adalab.es', '654785214', 'Madrid', 'España'),
(4000, 'Maria', 'López', 'maria@adalab.es', '689656322', 'Barcelona', 'España'),
(3000, 'Lucía', 'Ramos', 'lucia@gmail.com', '674459123', 'Valencia', 'España'),
(5000, 'Elena', 'Bueno', 'elena@adalab.es', '628546577', 'Bilbao', 'España'),
(1500, 'Rocío', 'García', 'rocio@gmail.com', '616365624', 'París', 'Francia');

SELECT *
	FROM empleadas;
    
UPDATE empleadas
	SET nombre = 'Isa'
    WHERE id = 5;
    
SELECT *
	FROM empleadas;
    
DELETE FROM empleadas
	WHERE id = 4;

SELECT *
	FROM empleadas;
    
UPDATE empleadas
	SET salario = 5000
    WHERE nombre = 'Ana';
    
SELECT *
	FROM empleadas;

UPDATE empleadas
	SET salario = 5000
    WHERE id = 5; 
    
SELECT *
	FROM empleadas;
    
SELECT *
	FROM empleadas
    WHERE nombre = 'Ana';