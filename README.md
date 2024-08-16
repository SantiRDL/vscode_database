# Proyecto MySQL con Python en VS Code

## Introducción
Este proyecto detalla cómo configurar un entorno de desarrollo en Visual Studio Code para trabajar con MySQL y Python.

## Requisitos previos
- [MySQL](https://dev.mysql.com/downloads/)
- [Python](https://www.python.org/downloads/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Git](https://git-scm.com/) (opcional)

## Instalación de MySQL
1. Descarga e instala MySQL desde [aquí](https://dev.mysql.com/downloads/).
2. Sigue las instrucciones del instalador para configurar MySQL en tu sistema.
3. Asegúrate de recordar la contraseña del usuario root.

## Configuración de MySQL
1. Abre la terminal de MySQL:
    ```sh
    mysql -u root -p
    ```
2. Crea una nueva base de datos:
    ```sql
    CREATE DATABASE nombre_de_tu_base_de_datos;
    ```
3. Crea un nuevo usuario y otórgale permisos:
    ```sql
    CREATE USER 'tu_usuario'@'localhost' IDENTIFIED BY 'tu_contraseña';
    GRANT ALL PRIVILEGES ON nombre_de_tu_base_de_datos.* TO 'tu_usuario'@'localhost';
    FLUSH PRIVILEGES;
    ```

## Instalación de Python
1. Descarga e instala Python desde [aquí](https://www.python.org/downloads/).
2. Asegúrate de agregar Python al PATH durante la instalación.

## Configuración del entorno virtual
1. Abre una terminal en el directorio de tu proyecto.
2. Crea un entorno virtual:
    ```sh
    python -m venv venv
    ```
3. Activa el entorno virtual:
    - En Windows:
        ```sh
        .\venv\Scripts\activate
        ```
    - En macOS/Linux:
        ```sh
        source venv/bin/activate
        ```

## Instalación de dependencias
1. Instala las bibliotecas necesarias:
    ```sh
    pip install mysql-connector-python
    ```

## Configuración de VS Code
1. Abre Visual Studio Code.
2. Instala la extensión de Python desde el Marketplace.
3. Abre la carpeta de tu proyecto en VS Code.
4. Selecciona el intérprete de Python de tu entorno virtual:
    - Presiona `Ctrl+Shift+P` y selecciona `Python: Select Interpreter`.
    - Elige el intérprete de tu entorno virtual.

## Ejemplo de código
Crea un archivo `main.py` en tu proyecto con el siguiente contenido:
```python
import mysql.connector

# Configuración de la conexión
config = {
    'user': 'tu_usuario',
    'password': 'tu_contraseña',
    'host': 'localhost',
    'database': 'nombre_de_tu_base_de_datos'
}

# Conectar a la base de datos
try:
    connection = mysql.connector.connect(**config)
    if connection.is_connected():
        print("Conexión exitosa a la base de datos")
except mysql.connector.Error as err:
    print(f"Error: {err}")
finally:
    if connection.is_connected():
        connection.close()
        print("Conexión cerrada")
```

 ## Manipulación y creación de la base de datos mediante SQLTools o script SQL

### Usando SQLTools en VS Code
1. **Instalar la extensión SQLTools**:
    - Abre Visual Studio Code.
    - Ve a la pestaña de Extensiones (`Ctrl+Shift+X`).
    - Busca `SQLTools` e instálala.

2. **Configurar la conexión a MySQL**:
    - Abre el panel de SQLTools (`Ctrl+Alt+S`).
    - Haz clic en `Add New Connection`.
    - Selecciona `MySQL/MariaDB`.
    - Rellena los campos con la información de tu base de datos:
        - **Name**: Nombre de la conexión.
        - **Server/Host**: `localhost`.
        - **Port**: `3306` (o el puerto que hayas configurado).
        - **Database**: `nombre_de_tu_base_de_datos`.
        - **Username**: `tu_usuario`.
        - **Password**: `tu_contraseña`.
    - Haz clic en `Test Connection` para verificar la conexión.
    - Si la conexión es exitosa, haz clic en `Save`.

3. **Ejecutar consultas SQL**:
    - Abre un nuevo archivo SQL (`Ctrl+N` y guarda el archivo con extensión `.sql`).
    - Escribe tus consultas SQL en el archivo.
    - Selecciona la conexión configurada en la esquina inferior derecha.
    - Ejecuta las consultas (`Ctrl+Alt+E`).

### Usando un script SQL
1. **Crear un archivo de script SQL**:
    - Abre un nuevo archivo en VS Code (`Ctrl+N`).
    - Guarda el archivo con extensión `.sql` (por ejemplo, `setup_database.sql`).

2. **Escribir el script SQL**:
    - Escribe las consultas SQL necesarias para crear y manipular la base de datos. Por ejemplo:
    ```sql
    -- Crear una nueva base de datos
    CREATE DATABASE IF NOT EXISTS nombre_de_tu_base_de_datos;

    -- Usar la base de datos
    USE nombre_de_tu_base_de_datos;

    -- Crear una tabla de ejemplo
    CREATE TABLE IF NOT EXISTS usuarios (
        id INT AUTO_INCREMENT PRIMARY KEY,
        nombre VARCHAR(100) NOT NULL,
        email VARCHAR(100) NOT NULL UNIQUE
    );

    -- Insertar datos de ejemplo
    INSERT INTO usuarios (nombre, email) VALUES ('Juan Perez', 'juan.perez@example.com');
    ```

3. **Ejecutar el script SQL**:
    - Abre la terminal de MySQL:
        ```sh
        mysql -u tu_usuario -p
        ```
    - Ejecuta el script SQL:
        ```sh
        source /ruta/a/tu/archivo/setup_database.sql;
        ```

Siguiendo estos pasos, podrás manipular y crear la base de datos directamente desde una sesión de SQLTools en VS Code o mediante un script SQL.