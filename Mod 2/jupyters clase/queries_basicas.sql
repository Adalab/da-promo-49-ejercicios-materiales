USE Tienda;

SELECT *
	FROM products
    LIMIT 5;
    
SELECT *
	FROM products
    WHERE product_line = "Motorcycles"
    LIMIT 5;
    
SELECT product_name, buy_price
	FROM products
    WHERE product_line = "Motorcycles"
    LIMIT 5;
    
SELECT product_name AS nombre, buy_price AS precio, product_line AS categoria
	FROM products
    WHERE product_line = "Motorcycles"
    LIMIT 5;
    
SELECT product_name AS nombre, buy_price AS precio, product_line AS categoria
	FROM products
    WHERE product_line = "Motorcycles"
    LIMIT 5
    OFFSET 3;
    
SELECT *
	FROM products;
    
SELECT product_name AS nombre, buy_price AS precio, product_line AS categoria
	FROM products
    WHERE product_line = "coches importacion"
    LIMIT 5;
    
SELECT product_name AS nombre, buy_price AS precio, product_line AS categoria
	FROM products
    LIMIT 110
    OFFSET 3;
    
SELECT product_name AS nombre, buy_price AS precio, product_line AS categoria
	FROM products
    WHERE product_line = "Motorcycles" OR product_line = "Classic Cars";
    
SELECT product_name AS nombre, buy_price AS precio, product_line AS categoria
	FROM products
    WHERE product_line = "Motorcycles" OR product_line = "Classic Cars" OR product_line = "Trucks and Buses";
    
SELECT product_name AS nombre, buy_price AS precio, product_line AS categoria
	FROM products
    WHERE product_line IN ("Motorcycles", "Classic Cars", "Trucks and Buses");
    
 SELECT * 
	FROM products;
    
SELECT *
	FROM products
    WHERE product_line = 'classic cars' OR product_vendor = "Second Gear Diecast";
    
SELECT *
	FROM products
    WHERE product_line IN ("Motorcycles", "Classic Cars", "Trucks and Buses")
		OR product_vendor = "Second Gear Diecast";
        
SELECT *
	FROM products
    WHERE product_line IN ("Motorcycles", "Classic Cars", "Trucks and Buses")
		AND product_vendor = "Second Gear Diecast";
        
SELECT *
	FROM products;
    
SELECT *
	FROM products
    WHERE quantity_in_stock > 3000;
    
-- necesitamos obtener los 5 productos que más stock tienen con un precio unitario mayor de 80 

SELECT *
	FROM products
    WHERE buy_price > 80
    ORDER BY quantity_in_stock DESC
    LIMIT 5;
    
SELECT*
FROM products
WHERE buy_price > 80
ORDER BY quantity_in_stock DESC
LIMIT 5;

-- qué categorías tenemos en nuestros datos

SELECT DISTINCT product_line
	FROM products;
    
SELECT product_line
	FROM products;

-- en qué países tenemos clientes

SELECT DISTINCT country
	FROM customers;
    
## Ejercicio 5:
/* Busca aquellos registros de la tabla `customers` que correspondan a clientes de USA pero que no tengan un valor guardado para el campo *state*.*/

SELECT *
	FROM customers;
    
SELECT *
	FROM customers
    WHERE country = "USA";
    
SELECT *
	FROM customers
    WHERE country = "USA" AND state IS NULL;
    
SELECT *
	FROM customers
    WHERE country = "USA" AND address_line2 IS NULL;

-- selecciona los productos que tengan un precio enter 50 y 70
SELECT * 
	FROM products;
    
SELECT *
	FROM products
    WHERE buy_price BETWEEN 50 AND 70;