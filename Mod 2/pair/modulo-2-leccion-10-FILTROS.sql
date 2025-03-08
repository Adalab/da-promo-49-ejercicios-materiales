-- PAIR modulo-2-leccion-10-FILTROS

-- 1. Ciudades que empiezan con "A" o "B".

SELECT city,company_name,contact_name
FROM customers
WHERE city LIKE "A%" OR city LIKE "B%";

-- 2. Número de pedidos que han hecho en las ciudades que empiezan con L.

SELECT city AS ciudad, company_name AS empresa, contact_name AS persona_contacto, COUNT(orders.order_id) AS numero_pedidos
FROM customers
INNER JOIN orders
ON customers.customer_id = orders.customer_id
GROUP BY city, company_name, contact_name
HAVING city LIKE 'L%';

-- 3. Todos los clientes cuyo "contact_title" no incluya "Sales".

SELECT ContactName, ContactTitle, CompanyName
FROM customers
WHERE ContactTitle NOT LIKE "%Sales%";

-- 4. Todos los clientes que no tengan una "A" en segunda posición en su nombre.

SELECT ContactName
FROM northwind.customers
where ContactName NOT like "_A%"

-- 5. Extraer toda la información sobre las compañias que tengamos en la BBDD

SELECT city, company_name, contact_name, 'Customers' AS Relationship
FROM customers
union 
SELECT city, company_name, contact_name, 'Suppliers'
FROM suppliers
ORDER BY city, company_name;

-- 6. Extraer todas las categorías de la tabla categories que contengan en la descripción "sweet" o "Sweet".

select * from categories
WHERE description REGEXP "Sweet" OR description REGEXP  "sweet";


-- 7. Extraed todos los nombres y apellidos de los clientes y empleados que tenemos en la BBDD:

SELECT concat(last_name," ", first_name) 
FROM northwind.employees
union
select contact_name from customers;

