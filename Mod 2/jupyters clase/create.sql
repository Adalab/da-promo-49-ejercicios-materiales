CREATE SCHEMA promo_49;
USE promo_49;
-- Resumen de sitaxis:

/*
CREATE TABLE nombre_tabla (
	nombre_col1 tipo_de_dato restricciones,
    nombre_col2 tipo_de_dato,
    nombre_col3 tipo_de_dato);

*/
-- CREATE TABLE alumnas (id_alumna INT AUTO_INCREMENT,nombre VARCHAR (20),PRIMARY KEY(id_alumna));

CREATE TABLE alumnas (
	id_alumna INT AUTO_INCREMENT,
    nombre VARCHAR (20),
    PRIMARY KEY(id_alumna));
    
    
CREATE TABLE  `cursos` (
  `id` INT NOT NULL,
  `id_alumna` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`));
    

-- Pasos:
/*
1. tener una BBDD -> esquema (lo podemos crear o usar uno que ya tenemos)
2. definimos la estructura de la BBDD
3. nos "conectamos" (USE nombre_schema) al esquema
4. escribimos nbuestro código de creación de tablas

*/

/*Ejercicio 3: Crea las tabla Empleadas y empleadas_en_proyectos, definiendo 
claves primarias, claves foránea, tipos de datos, etc. Haz que cuando se elimine
 una Empleada, se eliminen todas las entradas en empleadas_en_proyectos asociadas.
*/

CREATE TABLE empleadas(
	id_empleada INT AUTO_INCREMENT,
    salario FLOAT NOT NULL,
    nombre VARCHAR(15),
    id_pais INT,
    PRIMARY KEY(id_empleada));
    
CREATE TABLE emp_proyectos(
	proyecto_id INT,
    empleada_id INT,
    PRIMARY KEY(proyecto_id, empleada_id),
	CONSTRAINT fk_patata
		FOREIGN KEY (empleada_id)
        REFERENCES empleadas(id_empleada));
        /*,
	CONSTRAINT fk_brocoli
		FOREIGN KEY (proyecto_id)
        REFERENCES proyectos(id_proyecto))  ;  */
