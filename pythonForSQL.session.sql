
SELECT * from personas;
SELECT * from amigos;
SELECT * from tipo_videojuegos;
SELECT * from videojuegos;
SELECT * from expansiones;
SELECT * from compra;
SELECT * from juega;

-- ver donde esta la clave foranea
SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_TYPE = 'FOREIGN KEY' AND TABLE_SCHEMA = 'practico1';
