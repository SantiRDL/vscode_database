import mysql.connector
from os import getenv
from dotenv import load_dotenv

# Cargar variables de entorno desde el archivo .env
load_dotenv()

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
    password=db_password,  # Usar la contraseña desde las variables de entorno
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