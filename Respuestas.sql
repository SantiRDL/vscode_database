--Usa datos de 01 - Inserciones_v2.sql y 02 - Consultas_v2.sql para responder.
INSERT INTO practico1.compra (email, nombre_videojuego, fecha)
VALUES (
        'persona1@gmail.com',
        'Project Zomboid',
        CURRENT_DATE
    );
INSERT INTO practico1.compra (
        email,
        nombre_videojuego,
        nombre_expansion,
        fecha
    )
VALUES (
        'persona1@gmail.com',
        'Battlefield 2042',
        'Battlefield 2042 Ultimate Edition',
        CURRENT_DATE
    );
INSERT INTO practico1.compra (email, nombre_videojuego, fecha)
VALUES (
        'persona8@gmail.com',
        'Magic: The Gathering Arena',
        CURRENT_DATE
    );
INSERT INTO practico1.compra (email, nombre_videojuego, fecha)
VALUES (
        'persona8@gmail.com',
        'Tower of Fantasy',
        CURRENT_DATE
    );
UPDATE practico1.videojuegos
SET costo = 500
WHERE nombre = 'Magic: The Gathering Arena';
INSERT INTO practico1.compra (email, nombre_videojuego, fecha)
VALUES (
        'persona7@gmail.com',
        'Magic: The Gathering Arena',
        CURRENT_DATE
    );
INSERT INTO practico1.compra (email, nombre_videojuego, fecha)
VALUES (
        'persona9@gmail.com',
        'Battlefield 2042',
        CURRENT_DATE
    );
UPDATE practico1.videojuegos
SET costo = costo - 200
WHERE nombre = 'Battlefield 2042';
INSERT INTO practico1.compra (email, nombre_expansion, fecha)
VALUES (
        'persona9@gmail.com',
        'Battlefield 2042 Ultimate Edition',
        CURRENT_DATE
    );
UPDATE practico1.videojuegos
SET costo = costo * 1.10;
SELECT nombre_videojuego,
    MAX(fecha) AS ultima_fecha
FROM practico1.compra
WHERE email = 'usuario@example.com'
GROUP BY nombre_videojuego
ORDER BY ultima_fecha DESC
LIMIT 1;
SELECT p.nombre,
    p.apellido
FROM practico1.amigos a
    JOIN practico1.personas p ON a.email_amigo = p.email
WHERE a.email_persona = 'usuario@example.com';
SELECT COUNT(DISTINCT email) AS jugadores
FROM practico1.compra
WHERE nombre_videojuego = 'nombre_del_videojuego';
SELECT p.edad,
    COUNT(DISTINCT c.email) AS jugadores
FROM practico1.compra c
    JOIN practico1.personas p ON c.email = p.email
WHERE c.nombre_videojuego = 'nombre_del_videojuego'
GROUP BY p.edad;
SELECT CASE
        WHEN p.edad >= 18 THEN 'Mayor de edad'
        ELSE 'Menor de edad'
    END AS grupo_edad,
    COUNT(DISTINCT c.email) AS jugadores
FROM practico1.compra c
    JOIN practico1.personas p ON c.email = p.email
WHERE c.nombre_videojuego = 'nombre_del_videojuego'
GROUP BY grupo_edad;
SELECT c.nombre_videojuego,
    SUM(v.costo) AS ganancias
FROM practico1.compra c
    JOIN practico1.videojuegos v ON c.nombre_videojuego = v.nombre
GROUP BY c.nombre_videojuego
ORDER BY ganancias DESC
LIMIT 1;
SELECT p.email
FROM practico1.personas p
    LEFT JOIN practico1.amigos a ON p.email = a.email_persona
WHERE a.email_persona IS NULL;
SELECT SUM(v.costo) AS total_invertido
FROM practico1.compra c
    JOIN practico1.videojuegos v ON c.nombre_videojuego = v.nombre
WHERE c.email = 'usuario@example.com';
SELECT nombre_videojuego,
    COUNT(nombre_expansion) AS cantidad_expansiones
FROM practico1.compra
WHERE nombre_expansion IS NOT NULL
GROUP BY nombre_videojuego;
SELECT c.email,
    SUM(v.costo) AS total_gastado
FROM practico1.compra c
    JOIN practico1.videojuegos v ON c.nombre_videojuego = v.nombre
GROUP BY c.email
ORDER BY total_gastado DESC;