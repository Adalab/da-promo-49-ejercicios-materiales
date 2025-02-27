# Repaso: Diseño y creación de una base de datos con MySQL

### **Descripción del problema.**

Realiza una bases de datos para resolver el siguiente problema:

El instituto desea organizar la información de sus profesores, módulos, y alumnos en una base de datos relacional. A continuación, se describen los requisitos:

- Profesores:
Se deben almacenar los datos de los profesores, que incluyen:

  - DNI (identificador único)
  - Nombre
  - Dirección
  - Teléfono
- Módulos: Cada módulo tiene la siguiente información:

  - Código (identificador único)
  - Nombre del módulo

Cada módulo es impartido por un único profesor, pero un profesor puede impartir varios módulos.

- Alumnos: De los alumnos, se deben guardar los siguientes datos:

    - Número de expediente (identificador único)
    - Nombre
    - Apellidos
    - Fecha de nacimiento
Cada alumno puede estar matriculado en uno o varios módulos.


### Inserta datos de prueba en las tablas creadas.

- Para profesores 

```sql 
('12345678A', 'Juan Pérez', 'Calle Mayor, 10', '600123456'),
('87654321B', 'María López', 'Avenida Sol, 45', '600654321'),
('45678912C', 'Carlos Gómez', 'Plaza Luna, 7', '600789123');
```
- Para módulos

> En los valores de los módulos, se proporciona el código de los módulo, si has utilizado como código un valor autoincremental, piensa como deberías modificar los valores. 
>  De los profesores que imparten los módulos se ha utilizado el DNI.

```sql
('MOD101', 'Matemáticas', '12345678A'),
('MOD102', 'Física', '87654321B'),
('MOD103', 'Química', '45678912C'),
('MOD104', 'Biología', '12345678A'),
('MOD105', 'Historia', '87654321B');
```
- Para la tabla alumnnos

```sql
(1001, 'Ana Martínez', 'Martínez', '2005-03-15'),
(1002, 'Luis Fernández', 'Fernández', '2004-11-22'),
(1003, 'Clara Ruiz', 'Ruiz', '2006-01-10'),
(1004, 'Pedro Sánchez', 'Sánchez', '2005-07-08'),
(1005, 'Lucía Torres', 'Torres', '2004-09-18');
```

- Para la tabla matrícula:

> Si has utilizado otrso identificadores para las tablas, modifica los valores de los módulos y alumnos con los valores que has utilizado.
> En la tabla matrícula se ha utilizado el número de expediente del alumno y el código del módulo.
```sql
(1, 1001, 'MOD101'),
(2, 1001, 'MOD102'),
(3, 1002, 'MOD101'),
(4, 1002, 'MOD103'),
(5, 1003, 'MOD104'),
(6, 1004, 'MOD105'),
(7, 1005, 'MOD102'),
(8, 1005, 'MOD104');
```

> ***Notas***:
>
- Los dni en la tabla Profesores son únicos y referenciados como clave foránea en la tabla Módulos.
- Los códigos de los módulos en la tabla Módulos son únicos y se referencian como clave foránea en la tabla Matriculas.
- Los números de expediente en la tabla Alumnos son únicos y se referencian como clave foránea en la tabla Matriculas.


### Realiza las siguientes consultas:

1. Listar todos los datos de los profesores:
2. Mostrar los nombres y teléfonos de todos los profesores
3. Listar todos los módulos impartidos en el instituto
4. Mostrar el nombre y apellidos de todos los alumnos
5. Listar todos los números de expediente de los alumnos matriculados
6. Buscar un profesor por su DNI (por ejemplo, 12345678A)
7. Mostrar todos los módulos cuyo nombre contenga la palabra "Matemáticas"
8. Listar los alumnos nacidos después del año 2005
9. Obtener todas las matrículas realizadas en un módulo específico (por ejemplo, módulo MOD101)
10. Listar todos los módulos impartidos por un profesor específico (por ejemplo, DNI 12345678A)
11. Listar a los alumnos ordenados por apellidos de forma ascendente


### Inserta más datos 

En este apartado vamos a insertar más datos en la tabla de alumnos. Pero en este caso, los datos los vamos a obtener de un API, que devuelve un listado de alumnos.

1. Para llamar al API, utiliza la siguiente URL: `https://beta.adalab.es/curso-intensivo-fullstack-recursos/apis/alumnos-v1/alumnos.json`. 
> Esta API está dentro del entorno de desarrollo de Adalab, con valores ficticios y para uso académico.  Admite peticiones GET y no es necesario autenticación.
1. Haz una llamada a la API y obtén los datos de los alumnos.
2. Insertar los datos de los alumnos en la tabla de alumnos utilizando Mysql desde Python. 
3. Realiza una consulta para mostrar los datos de los alumnos que has insertado.
