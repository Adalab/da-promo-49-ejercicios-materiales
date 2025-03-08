-- EJERCICIO modulo-2-leccion-08-consultas-avanzadas

/*
vamos a usar una tabla ya creada llamada customers (clientes/as), que está en la base de datos tienda.
*/


 USE tienda;
 
-- Ejercicio 1: Obtener el número identificativo de cliente más bajo de la base de datos.
SELECT MIN(customer_number) AS numero_cliente_minimo
FROM customers;

-- Ejercicio 2: Seleccionar el límite de crédito medio para los clientes de España.
SELECT AVG(credit_limit) AS limite_credito_medio_espana
FROM customers
WHERE country = 'Spain';

-- Ejercicio 3: Seleccionar el número de clientes en Francia.
SELECT COUNT(*) AS numero_clientes_francia
FROM customers
WHERE country = 'France';

-- Ejercicio 4: Seleccionar el máximo de crédito que tiene cualquiera de los clientes del empleado con número 1323.
SELECT MAX(credit_limit) AS max_cred
FROM customers
WHERE sales_rep_employee_number = 1323;

-- Ejercicio 5: ¿Cuál es el número máximo de empleado de la tabla customers?
SELECT MAX(sales_rep_employee_number) AS maximo_numero_empleado
FROM customers;

-- Ejercicio 6: Seleccionar el número de cada empleado de ventas, así como el número de clientes distintos que tiene cada uno.
SELECT sales_rep_employee_number, COUNT(DISTINCT customer_number) AS clientes_distintos
FROM customers
GROUP BY sales_rep_employee_number;

-- Ejercicio 7: Seleccionar el número de cada empleado de ventas que tenga más de 7 clientes distintos.
SELECT sales_rep_employee_number, COUNT(DISTINCT customer_number) AS clientes_distintos
FROM customers
GROUP BY sales_rep_employee_number
HAVING clientes_distintos > 7;

-- Ejercicio 8: Seleccionar el número de cada empleado de ventas, así como el número de clientes distintos que tiene cada uno.
-- Asignar una etiqueta de "AltoRendimiento" a aquellos empleados con más de 7 clientes distintos.
SELECT sales_rep_employee_number,COUNT(DISTINCT customer_number) AS clientes_distintos,
       CASE 
		WHEN COUNT(DISTINCT customer_number) > 7 THEN 'AltoRendimiento' 
        ELSE NULL 
        END AS rendimiento
FROM customers
GROUP BY sales_rep_employee_number;

-- Ejercicio 9: Seleccionar el número de clientes en cada país.
SELECT country, COUNT(*) AS numero_clientes
FROM customers
GROUP BY country;

-- Ejercicio 10: Seleccionar aquellos países que tienen clientes de más de 3 ciudades diferentes.
SELECT country
FROM customers
GROUP BY country
HAVING COUNT(DISTINCT city) > 3;




                     