-- EJERCICIOS modulo-2-leccion-07-consultas-basicas

USE tienda;
 
## Ejercicio 1: 
/* Realiza una consulta `SELECT` que obtenga los nombres, telefonos y direcciones de todas las empresas cliente de la tabla `customers`.*/

SELECT * FROM customers;
SELECT customer_name, phone, address_line1     
FROM customers; 

## Ejercicio 2:
/*Realiza una consulta que obtenga los telefonos y direcciones de aquellas empresas de la tabla `customers` que se encuentren en USA (es su pais).*/

SELECT customer_name,phone, address_line1, country FROM customers
WHERE country = "USA"; 

## Ejercicio 3:
/* Realiza una consulta que obtenga los nombres y apellidos de las personas de contacto en cada empresa que no tenga segunda linea de direccion.*/

SELECT contact_first_name, contact_last_name FROM customers
WHERE address_line2 IS NULL; 

## Ejercicio 4:
/* Busca aquellos registros de la tabla `customers` que tengan un valor guardado para el campo *state*. 
Este atributo solo es valido para ciertos paises por lo que habra varias entradas con valor `NULL`.*/

SELECT * FROM customers
WHERE state IS NOT NULL;

## Ejercicio 5:
/* Busca aquellos registros de la tabla `customers` que correspondan a clientes de USA pero que no tengan un valor guardado para el campo *state*.*/

SELECT * FROM customers
WHERE country = "USA" AND state IS NULL;

## Ejercicio 6:
/* Selecciona el pais (`country`) correspondiente a los registros de clientes con un limite de credito (`credit_limit`) mayor que $10000.*/

SELECT DISTINCT country FROM customers
WHERE credit_limit > 10000; 