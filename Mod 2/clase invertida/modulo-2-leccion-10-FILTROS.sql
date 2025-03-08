-- EJERCICIOS modulo-2-leccion-10-FILTROS

USE tienda

/*
EJERCICIO 1:
Selecciona los apellidos que se encuentren en ambas tablas para employees y customers, con alias 'Apellidos':
*/

SELECT last_name AS Apellidos FROM employees
WHERE last_name IN (SELECT contact_last_name FROM customers);

/*
EJERCICIO 2:
Selecciona los nombres con alias 'nombre' y apellidos, con alias 'Apellidos' tanto de los clientes como de los 
empleados de las tablas employees y customers:
*/

SELECT first_name AS nombre, last_name AS Apellidos FROM employees

UNION ALL

SELECT contact_first_name AS nombre, contact_last_name AS Apellidos FROM customers;


/*
EJERCICIO 3:
Selecciona todos los nombres con alias 'nombre' y apellidos, con alias 'Apellidos' tanto de los clientes como de 
los empleados de las tablas employees y customers:
*/

SELECT first_name AS nombre, last_name AS Apellidos
FROM employees
UNION ALL
SELECT contact_first_name AS nombre, contact_last_name AS Apellidos
FROM customers;


/*
EJERCICIO 4:
Queremos ver ahora el employee_number como 'Número empleado', first_name como 'nombre Empleado' y last_name como 
'Apellido Empleado' para los empleados con employee_number: 1002,1076,1088 y 1612:
*/

SELECT employee_number AS 'Número empleado', first_name AS 'nombre Empleado', last_name AS 'Apellido Empleado'
FROM employees
WHERE employee_number IN (1002,1076,1088,1612);


/*
EJERCICIO 5:
Queremos ver ahora la 'ciudad' y los nombres de las empresas como 'nombre de la empresa ' de la tabla customers, que 
no estén en: Ireland, France, Germany:
*/

SELECT city, customer_name AS 'nombre de la empresa'
FROM customers
WHERE country NOT IN ('Ireland', 'France', 'Germany');

/*
EJERCICIO 6:
Encuentra los campos nombre del cliente y ciudad, de aquellas ciudades de la tabla de customers que terminen en 'on':
*/

SELECT customer_name AS nombre, city FROM customers
WHERE city LIKE '%on';

/*
EJERCICIO 7:
Encuentra los campos nombre del cliente, ciudad de aquellas ciudades de la tabla de customers que terminen en 'on' 
y que unicamente sean de longitud 4:
*/

SELECT customer_name AS nombre, city
FROM customers
WHERE city LIKE '____' AND city LIKE '%on';

/*
EJERCICIO 8:
Encuentra el nombre del cliente, primera dirección y ciudad de aquellas ciudades que contengan el número 3 en su 
dirección postal (o lo que es lo mismo, su primera dirección):
*/

SELECT customer_name AS nombre, address_line1 AS 'primera dirección', city
FROM customers
WHERE address_line1 LIKE '%3%' ;

/*
EJERCICIO 9:
Encuentra el nombre del cliente, primera dirección y ciudad de aquellas ciudades que contengan el número 3 en su
 dirección postal y la ciudad NO empiece por T:
*/

SELECT customer_name AS nombre, address_line1 AS 'primera dirección', city
FROM customers
WHERE address_line1 LIKE '%3%' AND city NOT LIKE 'T%';


/*
EJERCICIO 10:
Selecciona, haciendo uso de expresiones regulares, los campos nombre del cliente, primera dirección y ciudad. 
Unicamente en el caso que la dirección postal, posea algún número en dicho campo:
*/

SELECT customer_name AS nombre, address_line1 AS 'primera dirección', city
FROM customers
WHERE address_line1 REGEXP '[0-9]';
