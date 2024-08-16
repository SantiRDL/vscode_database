import mysql.connector
from os import getenv
from dotenv import load_dotenv

# Cargar variables de entorno desde el archivo .env
load_dotenv("variables.env") #IMPORTANTE: Cambiar por el nombre del archivo .env local.

# Obtener datos desde las variables de entorno
db_host = getenv('DB_HOST')
db_user = getenv('DB_USER')
db_password = getenv('DB_PASSWORD')
db_database = getenv('DB_DATABASE')
db_port = getenv('DB_PORT')


# Conectar a la base de datos
connection = mysql.connector.connect(
    host=db_host,
    user=db_user,
    password=db_password,
    database=db_database,
    port=db_port
)

# Función para ejecutar consultas
def execute_query(query, params=None):
    cursor = connection.cursor()
    try:
        cursor.execute(query, params)
        connection.commit()
        print("Query executed successfully")
    except mysql.connector.Error as err:
        print(f"Error: {err}")
    finally:
        cursor.close()

# Crear tabla personas si no existe
create_table_query = """
CREATE TABLE IF NOT EXISTS personas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255),
    apellido VARCHAR(255),
    edad INT
)
"""
execute_query(create_table_query)


# Función para verificar si los datos ya existen
def check_data_exists():
    query = "SELECT COUNT(*) FROM personas"
    cursor = connection.cursor()
    cursor.execute(query)
    count = cursor.fetchone()[0]
    cursor.close()
    return count > 0

# Función para insertar datos ficticios
def insert_fake_data():
    fake_data = [
        ("Juan", "Pérez", 30),
        ("María", "González", 25),
        ("Carlos", "López", 35),
        ("Ana", "Martínez", 28),
        ("Luis", "Rodríguez", 40)
    ]
    query = "INSERT INTO personas (nombre, apellido, edad) VALUES (%s, %s, %s)"
    for data in fake_data:
        execute_query(query, data)

# Función para consultar y mostrar los datos de la tabla
def fetch_and_display_data():
    query = "SELECT * FROM personas"
    cursor = connection.cursor()
    cursor.execute(query)
    rows = cursor.fetchall()
    for row in rows:
        print(row)
    cursor.close()

# Verificar si los datos ya existen, si no, insertarlos
if not check_data_exists():
    insert_fake_data()

# Consultar y mostrar los datos de la tabla
fetch_and_display_data()

# Cerrar la conexión
connection.close()