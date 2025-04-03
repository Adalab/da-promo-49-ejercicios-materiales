import requests
import pandas as pd


def llamada(direccion):
    """documentamos la función de llamada"""

    response = requests.get(direccion)

    if response.status_code == 200:
        return response.json()
    
    else:
        print(f"hay un error en la llamada {response.status_code}")


def transformacion(datos_sucios):
    """documentamos la función de transformacion"""
    datos_limpios = []

    for d in datos_sucios:
        user = {"id": d["id"], "nombre": d["name"], "email": d["email"], "ciudad": d["address"]["city"]}
        datos_limpios.append(user)

    return pd.DataFrame(datos_limpios)