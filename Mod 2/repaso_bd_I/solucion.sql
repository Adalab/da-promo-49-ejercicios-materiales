
-- Crear el esquema y usarlo antes
CREATE TABLE profesores (
    dni VARCHAR(9) PRIMARY KEY,
    nombre VARCHAR(100),
    direccion VARCHAR(150),
    telefono VARCHAR(15)
);
CREATE TABLE modulos (
    codigo VARCHAR(10) PRIMARY KEY,
    nombre VARCHAR(100),
    dni_profesor VARCHAR(9),
    FOREIGN KEY (dni_profesor) REFERENCES profesores(dni)
);
CREATE TABLE alumnos (
    num_expediente INT PRIMARY KEY,
    nombre VARCHAR(100),
    apellidos VARCHAR(100),
    fecha_nacimiento DATE
);
CREATE TABLE matriculas (
    id_matricula INT PRIMARY KEY AUTO_INCREMENT,
    num_expediente INT,
    codigo_modulo VARCHAR(10),
    FOREIGN KEY (num_expediente) REFERENCES alumnos(num_expediente),
    FOREIGN KEY (codigo_modulo) REFERENCES modulos(codigo)
);

INSERT INTO profesores (dni, nombre, direccion, telefono) VALUES
('12345678A', 'Juan Pérez', 'Calle Mayor, 10', '600123456'),
('87654321B', 'María López', 'Avenida Sol, 45', '600654321'),
('45678912C', 'Carlos Gómez', 'Plaza Luna, 7', '600789123');

INSERT INTO modulos (codigo, nombre, dni_profesor) VALUES
('MOD101', 'Matemáticas', '12345678A'),
('MOD102', 'Física', '87654321B'),
('MOD103', 'Química', '45678912C'),
('MOD104', 'Biología', '12345678A'),
('MOD105', 'Historia', '87654321B');

INSERT INTO alumnos (num_expediente, nombre, apellidos, fecha_nacimiento) VALUES
(1001, 'Ana Martínez', 'Martínez', '2005-03-15'),
(1002, 'Luis Fernández', 'Fernández', '2004-11-22'),
(1003, 'Clara Ruiz', 'Ruiz', '2006-01-10'),
(1004, 'Pedro Sánchez', 'Sánchez', '2005-07-08'),
(1005, 'Lucía Torres', 'Torres', '2004-09-18');

INSERT INTO matriculas (id_matricula, num_expediente, codigo_modulo) VALUES
(1, 1001, 'MOD101'),
(2, 1001, 'MOD102'),
(3, 1002, 'MOD101'),
(4, 1002, 'MOD103'),
(5, 1003, 'MOD104'),
(6, 1004, 'MOD105'),
(7, 1005, 'MOD102'),
(8, 1005, 'MOD104');

-- Consultas
--Listar todos los datos de los profesores
SELECT * FROM profesores;

--Mostrar los nombres y teléfonos de todos los profesores
SELECT nombre, telefono FROM profesores;

--Listar todos los módulos impartidos en el instituto
SELECT * FROM modulos;

--Mostrar el nombre y apellidos de todos los alumnos
SELECT nombre, apellidos FROM alumnos;

--Listar todos los números de expediente de los alumnos matriculados
SELECT num_expediente FROM matriculas;

--Buscar un profesor por su DNI (por ejemplo, 12345678A)
SELECT * FROM profesores
WHERE dni = '12345678A';

--Mostrar todos los módulos cuyo nombre contenga la palabra "Matemáticas"
SELECT * FROM modulos
WHERE nombre LIKE '%Matemáticas%';

--Listar los alumnos nacidos después del año 2005
SELECT * FROM alumnos
WHERE fecha_nacimiento > '2005-01-01';

--Obtener todas las matrículas realizadas en un módulo específico (por ejemplo, módulo MOD101)
SELECT * FROM matriculas
WHERE codigo_modulo = 'MOD101';

---Listar todos los módulos impartidos por un profesor específico (por ejemplo, DNI 12345678A)
SELECT * FROM modulos
WHERE dni_profesor = '12345678A';


--Listar a los alumnos ordenados por apellidos de forma ascendente:

SELECT * FROM alumnos
ORDER BY apellidos ASC;
