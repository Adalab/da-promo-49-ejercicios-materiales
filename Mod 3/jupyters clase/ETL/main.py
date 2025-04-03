from src import soporte_extraccion as sp
from src import soporte_sql as sq
from src import soporte_queries as q

print("librerias importadas")

# endpoint de la api
url = "https://jsonplaceholder.typicode.com/users"

# esta función llama a la api y me devuelve el json
datos = sp.llamada(url)
print("llamada a la api")

df = sp.transformacion(datos)
print("transformación hecha")

nombre = input("Cómo se llama el csv?")
df.to_csv(f"{nombre}.csv")
print("sé que soy muy pesado pero luego no me hacéis caso y ya tengo mi csv")

sq.creacion_bbdd_tablas(q.crear_schema, "AlumnaAdalab")
print("BBDD creada")

sq.creacion_bbdd_tablas(q.crear_tabla, "AlumnaAdalab", "etl_db")
print("tabla creada")

lista_datos = df.to_records(index=False).tolist()


sq.insertar_datos(q.insertar_users, "AlumnaAdalab", "etl_db", lista_datos)
print("datos insertados correctamente")

