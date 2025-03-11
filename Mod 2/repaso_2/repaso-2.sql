USE sakila; 

############################
##### EJERCICIOS JOINS #####
############################

/* Ejercicio 1

Obtener los clientes y las películas que han alquilado.

Explicación: Usamos INNER JOIN para obtener solo los registros que tienen coincidencias en todas las tablas involucradas 
(customer, rental, inventory y film). Esto nos proporciona la lista de clientes y las películas que han alquilado.*/

SELECT customer.first_name, customer.last_name, film.title
FROM customer
INNER JOIN rental ON customer.customer_id = rental.customer_id
INNER JOIN inventory ON rental.inventory_id = inventory.inventory_id
INNER JOIN film ON inventory.film_id = film.film_id;


/* Ejercicio 2

Obtener los actores y las películas en las que han actuado.

Explicación: Usamos INNER JOIN para relacionar las tablas actor, film_actor y film para obtener una lista de actores y las películas
en las que han actuado. */


SELECT actor.first_name, actor.last_name, film.title
FROM actor
INNER JOIN film_actor ON actor.actor_id = film_actor.actor_id
INNER JOIN film ON film_actor.film_id = film.film_id;


/* Ejercicio 3

 Obtener todas las películas y, si están disponibles en inventario, mostrar la cantidad disponible.
 
 Explicación: Usamos LEFT JOIN para asegurarnos de que obtengamos todas las películas, incluso si no están en inventario. 
 Esto nos permite mostrar la cantidad disponible de películas en inventario si están disponibles.*/ 

SELECT film.title, COUNT(inventory.inventory_id) AS cantidad_disponible
FROM film
LEFT JOIN inventory ON film.film_id = inventory.film_id
GROUP BY film.title;

/*  Ejercicio 4

Obtener todos los clientes y mostrar la cantidad de alquileres que han realizado, incluso si no han realizado ningún alquiler.

Explicación: Usamos LEFT JOIN para asegurarnos de que obtengamos todos los clientes, incluso si no han realizado ningún alquiler. 
Esto nos permite mostrar la cantidad de alquileres de cada cliente, incluso si es cero.
*/

SELECT customer.first_name, customer.last_name, COUNT(rental.rental_id) AS cantidad_alquileres
FROM customer
LEFT JOIN rental ON customer.customer_id = rental.customer_id
GROUP BY customer.first_name, customer.last_name
ORDER BY cantidad_alquileres;


/* Ejercicio 5

Obtener todas las películas y mostrar los actores que han actuado en ellas, incluso si algunas películas no tienen actores asociados.

Explicación: Usamos RIGHT JOIN para asegurarnos de que obtengamos todas las películas y los actores que han actuado en ellas, 
incluso si algunas películas no tienen actores asociados.
*/

SELECT film.title, actor.first_name, actor.last_name
FROM film
RIGHT JOIN film_actor ON film.film_id = film_actor.film_id
RIGHT JOIN actor ON film_actor.actor_id = actor.actor_id;



/* Ejercicio 6
 
Obtener todos los actores y mostrar las películas en las que han actuado, incluso si algunos actores no han actuado en ninguna película.

Explicación: Usamos RIGHT JOIN para asegurarnos de que obtengamos todos los actores y las películas en las que han actuado, 
incluso si algunos actores no han actuado en ninguna película.*/

SELECT actor.first_name, actor.last_name, film.title
FROM actor
RIGHT JOIN film_actor ON actor.actor_id = film_actor.actor_id
RIGHT JOIN film ON film_actor.film_id = film.film_id;


##############################################
##### EJERCICIOS REGEXP, LIKE Y NOT LIKE #####
##############################################

/* Ejercicio 1

Encuentra todas las películas que comienzan con la letra "A" en su título.

Explicación La expresión regular `^A` busca todas las cadenas que comienzan con la letra "A". 
El carácter `^` indica el comienzo de la cadena. */

SELECT title
FROM film
WHERE title REGEXP '^A';


/* Ejercicio 2

Encuentra todas las películas que tienen al menos una vocal en su título.

Explicación: La expresión regular `[aeiouAEIOU]` busca cualquier carácter que sea una vocal, ya sea en minúsculas o mayúsculas. 
Esto garantiza que las películas seleccionadas tengan al menos una vocal en su título.*/

SELECT title
FROM film
WHERE title REGEXP '[aeiouAEIOU]';


/* Ejercicio 3
 
Encuentra todas las películas que tienen una longitud de título de al menos 10 caracteres.

Explicación: La expresión regular `.{10,}` busca cualquier cadena que tenga al menos 10 caracteres. 
El punto `.` representa cualquier carácter, y `{10,}` indica que debe haber al menos 10 repeticiones de cualquier carácter. 
Esto seleccionará todas las películas con títulos de al menos 10 caracteres de longitud.*/

SELECT title
FROM film
WHERE title REGEXP '.{10,}';

/* Ejercicio 4
 
Encuentra todas las películas cuyo título contiene la palabra "The."

Explicación: La cláusula `LIKE` se utiliza para buscar cadenas que contengan "The" en cualquier parte del título de la película. 
El símbolo `%` representa cualquier número de caracteres antes o después de "The."*/

SELECT title
FROM film
WHERE title LIKE '%The%';


/* Ejercicio 5

Encuentra todas las películas cuyo título comienza con la letra "S."

Explicación: La cláusula `LIKE` se utiliza para buscar películas cuyos títulos comienzan con la letra "S." 
El símbolo `%` representa cualquier número de caracteres después de "S."*/

SELECT title
FROM film
WHERE title LIKE 'S%';


############################
##### EJERCICIOS UNION #####
############################

/* Ejercicio 1

Encuentra todos los actores cuyos nombres comienzan con la letra "A" en la tabla `actor`, 
y encuentra todos los clientes cuyos nombres comienzan con la letra "B" en la tabla `customer`. 
Combina ambos conjuntos de resultados en una sola tabla.

Explicación: En este ejercicio, se utiliza `UNION` para combinar los resultados de dos consultas.
La primera consulta selecciona los actores cuyos nombres comienzan con "A" en la tabla `actor`, y la segunda 
consulta selecciona los clientes cuyos nombres comienzan con "B" en la tabla `customer`. 
Los resultados se combinan en una sola lista de nombres.*/

SELECT first_name AS nombre
FROM actor
WHERE first_name LIKE 'A%'

UNION

SELECT CONCAT(first_name, ' ', last_name) AS nombre
FROM customer
WHERE first_name LIKE 'B%';


/* Ejercicio 2
 
 Encuentra todas las películas cuyos títulos contienen la palabra "Comedy" en la tabla `film`, 
 y encuentra todas las películas cuyo título comienza con la letra "D" en la misma tabla. 
 Combina ambos conjuntos de resultados en una sola lista de películas.
 
 Explicación: En este ejercicio, `UNION` se utiliza para combinar los resultados de dos consultas que buscan películas con 
 diferentes criterios en la tabla `film`. La primera consulta selecciona películas que contienen "Comedy" en el título, 
 y la segunda consulta selecciona películas cuyos títulos comienzan con "D". Los resultados se combinan en una sola lista de títulos de películas.*/

SELECT title
FROM film
WHERE title LIKE '%Comedy%'

UNION

SELECT title
FROM film
WHERE title LIKE 'D%';


#############################################
##### EJERCICIOS COMPLEJAS y SUBQUERIES #####
#############################################

/* Ejercicio 1

Encuentra el nombre y apellido de los actores que han actuado en películas que se alquilaron después de que la película
"ACADEMY DINOSAUR" se alquilara por primera vez. Ordena los resultados alfabéticamente por apellido.

Explicación: En este ejercicio, necesitamos encontrar actores que hayan actuado en películas alquiladas después de que se alquilara 
por primera vez la película "ACADEMY DINOSAUR". Para ello, utilizamos una subconsulta para obtener la tarifa de alquiler de "ACADEMY DINOSAUR" 
y luego comparamos esta tarifa con la tarifa de alquiler de otras películas en la consulta principal. La cláusula JOIN se utiliza para relacionar 
actores con películas y la cláusula ORDER BY para ordenar los resultados por apellido.*/

SELECT DISTINCT actor.first_name, actor.last_name 
    FROM rental
INNER JOIN inventory
    ON rental.inventory_id = inventory.inventory_id
INNER JOIN film
    ON inventory.film_id = film.film_id
INNER JOIN film_actor 
    ON film.film_id = film_actor.film_id
INNER JOIN actor
    ON actor.actor_id = film_actor.actor_id
WHERE rental_date > (SELECT min(rental_date) FROM rental
                        INNER JOIN inventory ON rental.inventory_id = inventory.inventory_id
                        INNER JOIN film ON film.film_id = inventory.film_id
                            WHERE title = "ACADEMY DINOSAUR")
ORDER BY actor.last_name, actor.first_name;

-- solución con CTE:

SELECT first_name, last_name
	FROM film
    INNER JOIN film_actor
		USING (film_id)
    INNER JOIN actor
		USING (actor_id)
    INNER JOIN inventory
		USING (film_id)
	INNER JOIN rental
		USING (inventory_id)
	WHERE rental_date > (SELECT MIN(RENTAL_DATE)
							FROM fecha)
	ORDER BY last_name;

    
/* Ejercicio 2

Encuentra el título de las películas que han sido alquiladas por el cliente con el nombre "MARY SMITH" y
que aún no se han devuelto. Ordena los resultados alfabéticamente por título de película.

Explicación: En este ejercicio, queremos encontrar películas alquiladas por un cliente específico ("MARY SMITH") 
que aún no se han devuelto. Utilizamos una subconsulta para filtrar los alquileres no devueltos y luego relacionamos esta 
información con las películas y clientes correspondientes mediante la cláusula JOIN. Finalmente, usamos ORDER BY para ordenar 
los resultados por título de película.*/

SELECT film.title
FROM film
JOIN inventory ON film.film_id = inventory.film_id
JOIN rental ON inventory.inventory_id = rental.inventory_id
JOIN customer ON rental.customer_id = customer.customer_id
WHERE customer.first_name = 'MARY' AND customer.last_name = 'SMITH'
AND rental.return_date IS NULL
ORDER BY film.title;


/* Ejercicio 3

Encuentra los nombres de los clientes que han alquilado al menos 5 películas distintas. Ordena los resultados alfabéticamente por apellido.

Explicación: En este ejercicio, buscamos clientes que hayan alquilado al menos 5 películas distintas.
Utilizamos una subconsulta para contar el número de películas distintas alquiladas por cada cliente y luego filtramos los resultados 
con una cláusula HAVING para obtener solo aquellos con 5 o más películas distintas alquiladas. La cláusula ORDER BY se utiliza para ordenar 
los resultados por apellido.*/

SELECT customer.first_name, customer.last_name
FROM customer
JOIN (
    SELECT customer_id
    FROM rental
    GROUP BY customer_id
    HAVING COUNT(DISTINCT inventory_id) >= 5
) AS subquery ON customer.customer_id = subquery.customer_id
ORDER BY customer.last_name, customer.first_name;


/* Ejercicio 4

Encuentra los nombres de los actores que han actuado en al menos una película que pertenece a la categoría "Horror." 
Ordena los resultados alfabéticamente por apellido.

Explicación: En este ejercicio, deseamos encontrar actores que hayan actuado en al menos una película de la categoría "Horror". 
Utilizamos una subconsulta para seleccionar los actores que han participado en películas de esta categoría y luego aplicamos la cláusula GROUP BY 
para evitar duplicados. Luego, usamos la cláusula ORDER BY para ordenar los resultados por apellido.*/

SELECT actor.first_name, actor.last_name
FROM actor
JOIN film_actor ON actor.actor_id = film_actor.actor_id
JOIN film ON film_actor.film_id = film.film_id
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id
WHERE category.name = 'Horror'
GROUP BY actor.actor_id
ORDER BY actor.last_name, actor.first_name;

/* Ejercicio 5

Encuentra los nombres de las películas que tienen la misma duración que la película con el título "GATTACA."
Ordena los resultados alfabéticamente por título de película.

Explicación: En este ejercicio, buscamos películas que tengan la misma duración que la película "GATTACA". 
Usamos una subconsulta para obtener la duración de "GATTACA" y luego comparamos esta duración con la duración de otras películas en la 
consulta principal. La cláusula WHERE se utiliza para excluir "GATTACA" de los resultados y ORDER BY para ordenar los resultados por título de 
película.
*/

SELECT film.title
FROM film
WHERE film.length = (
    SELECT length FROM film WHERE title = 'GATTACA'
)
AND film.title != 'GATTACA'
ORDER BY film.title;

############################
##### EJERCICIOS CTEs #####
############################


/* Ejercicio 1

Encuentra el nombre de los actores que han actuado en más películas y la cantidad de películas en las que han actuado.

Explicación: En este ejercicio, creamos un CTE llamado `ActorFilmCount` que cuenta la cantidad de películas en las que cada actor ha actuado. 
Luego, en la consulta principal, seleccionamos los actores cuyo número de películas es igual al número máximo de películas actuadas por 
cualquier actor en el CTE.
*/

WITH ActorFilmCount AS (
    SELECT
        actor.actor_id,
        actor.first_name,
        actor.last_name,
        COUNT(film_actor.film_id) AS num_films
    FROM
        actor
    JOIN
        film_actor ON actor.actor_id = film_actor.actor_id
    GROUP BY
        actor.actor_id
)
SELECT
    first_name,
    last_name,
    num_films
FROM
    ActorFilmCount
WHERE
    num_films = (
        SELECT
            MAX(num_films)
        FROM
            ActorFilmCount
    );
    
/* Ejercicio 2

Encuentra las categorías de películas con la mayor cantidad de películas y la cantidad de películas en cada categoría.

Explicación: En este ejercicio, creamos un CTE llamado `CategoryFilmCount` que cuenta la cantidad de películas en cada categoría. 
Luego, en la consulta principal, seleccionamos las categorías cuyo número de películas es igual al número máximo de películas en una categoría en 
el CTE.*/

WITH CategoryFilmCount AS (
    SELECT
        category.name AS category_name,
        COUNT(film_category.film_id) AS num_films
    FROM
        category
    JOIN
        film_category ON category.category_id = film_category.category_id
    GROUP BY
        category.category_id
)
SELECT
    category_name,
    num_films
FROM
    CategoryFilmCount
WHERE
    num_films = (
        SELECT
            MAX(num_films)
        FROM
            CategoryFilmCount
    );

/* Ejercicio 3

Encuentra los clientes que han alquilado más películas y la cantidad de películas alquiladas por cada cliente.

Explicación: En este ejercicio, creamos un CTE llamado `CustomerRentalCount` que cuenta la cantidad de alquileres realizados por cada cliente. 
Luego, en la consulta principal, seleccionamos los clientes cuyo número de alquileres es igual al número máximo de alquileres realizados por 
cualquier cliente en el CTE.*/
   
WITH CustomerRentalCount AS (
    SELECT
        customer.customer_id,
        CONCAT(customer.first_name, ' ', customer.last_name) AS customer_name,
        COUNT(rental.rental_id) AS num_rentals
    FROM
        customer
    JOIN
        rental ON customer.customer_id = rental.customer_id
    GROUP BY
        customer.customer_id
)
SELECT
    customer_name,
    num_rentals
FROM
    CustomerRentalCount
WHERE
    num_rentals = (
        SELECT
            MAX(num_rentals)
        FROM
            CustomerRentalCount
    );
/* Ejercicio 4

Encuentra los actores que han actuado en películas de todas las categorías y muestra la cantidad de categorías en las que han actuado.

Explicación: En este ejercicio, creamos un CTE llamado `ActorCategoryCount` que cuenta la cantidad de categorías en las que cada actor ha actuado. 
Luego, en la consulta principal, seleccionamos los actores cuyo número de categorías es igual al número total de categorías en la base de datos.
Esto significa que han actuado en películas de todas las categorías.*/
   
WITH ActorCategoryCount AS (
    SELECT
        actor.actor_id,
        actor.first_name,
        actor.last_name,
        COUNT(DISTINCT film_category.category_id) AS num_categories
    FROM
        actor
    JOIN
        film_actor ON actor.actor_id = film_actor.actor_id
    JOIN
        film_category ON film_actor.film_id = film_category.film_id
    GROUP BY
        actor.actor_id
)
SELECT
    first_name,
    last_name,
    num_categories
FROM
    ActorCategoryCount
WHERE
    num_categories = (
        SELECT
            COUNT(DISTINCT category_id)
        FROM
            category
    );
