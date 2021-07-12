CREATE DATABASE record_company

USE record_company


CREATE TABLE test (
    test_column INT
);

ALTER TABLE test
ADD another_column VARCHAR(255);

DROP TABLE test;




CREATE TABLE bands(
    id INT IDENTITY(1,1) NOT NULL PRIMARY KEY (id),
    name VARCHAR(255) NOT NULL
    
);

CREATE TABLE albums(
    id INT IDENTITY(1,1) NOT NULL,
    name VARCHAR(255) NOT NULL,
    release_year INT,
    band_id INT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (band_id) REFERENCES bands(id)
);



INSERT INTO bands(name)
VALUES ('Iron Maiden');

INSERT INTO bands(name)
VALUES ('Deuce'), ('Avenged Sevenfold'), ('Ankor');

INSERT INTO albums (name, release_year, band_id)
VALUES ('The Number of the Beast', 1985, 1),
       ('Power Slave', 1984, 1),
       ('Nightmare', 2018, 2),
       ('Nightmare', 2010, 3),
       ('Test Album', NULL, 3);


UPDATE albums              --Modifica datos de una tabla
SET release_year = 1982
WHERE id = 0;

UPDATE albums
SET release_year = 1984
WHERE id=1;


SELECT * FROM bands; --Selecciona toda la tabla

SELECT TOP 3 * FROM bands; --Selecciona los primeros 3 ejemplos

SELECT name FROM bands; --Selecciona SOLO la una columna de la tabla

SELECT id AS 'ID', name AS 'Band Name' --Selecciona distintas columnas y las muestra con otro nombre
FROM bands;

SELECT * FROM bands ORDER BY name DESC; --Selecciona en orden descendente

SELECT * FROM bands ORDER BY name ASC; --Selecciona en orden ascendente

SELECT * FROM bands ORDER BY name; --Default selecciona en orden descendente


SELECT * FROM albums;

SELECT name FROM albums;

SELECT DISTINCT name FROM albums; --Solo nombres sin repetir


SELECT * FROM albums
WHERE release_year < 2000;

SELECT * FROM albums
WHERE name LIKE '%er%';

SELECT * FROM albums
WHERE name LIKE '%er%' OR band_id = 2;

SELECT * FROM albums
WHERE release_year = 1984 AND band_id =1;

SELECT * FROM albums
WHERE release_year BETWEEN 2000 and 2018;

SELECT * FROM albums
WHERE release_year IS NULL;

DELETE FROM albums
WHERE id = 3;

SELECT * FROM bands --tabla a la izquierda
JOIN albums ON bands.id = albums.band_id; --tabla a la derecha

SELECT * FROM bands 
INNER JOIN albums ON bands.id = albums.band_id; --hace los mismo que JOIN
                                                --devuelve la tabla derecha asociada a la izquierda
                                                --siempre que tenga datos asociados

SELECT * FROM bands
LEFT JOIN albums ON bands.id = albums.band_id; --devuelve toda tabla derecha asociada a la izquierda
                                               --aunque no tenga datos asociados

SELECT * FROM albums --tabla izquierda
RIGHT JOIN bands ON bands.id = albums.band_id; --tabla derecha
-- RIGHT JOIN es igual que LEFT JOIN pero flipeado, se usa LEFT JOIN


SELECT AVG(release_year) FROM albums;

SELECT SUM(release_year) FROM albums;

SELECT band_id, COUNT(band_id) FROM albums
GROUP BY band_id;


SELECT b.name AS band_name, COUNT(a.id) AS num_albums
FROM bands AS b
LEFT JOIN albums AS a ON b.id = a.band_id
GROUP BY b.id;

SELECT b.name AS band_name, COUNT(a.id) AS num_albums
FROM bands AS b
LEFT JOIN albums AS a ON b.id = a.band_id
GROUP BY b.id
HAVING num_albums =1;

SELECT b.name AS band_name, COUNT(a.id) AS num_albums
FROM bands AS b
LEFT JOIN albums AS a ON b.id = a.band_id
WHERE b.name='Deuce'
GROUP BY b.id
HAVING num_albums =1;






/* 

Auto incremento

En mysql: id INT AUTO_INCREMENT

En SQLserver: id INT IDENTITY(0,1)

-------------------------------------------------

Seleccionar los primeros x ejemplos

En mysql: SELECT * FROM bands LIMIT 2;

En SQLserver: SELECT TOP 2 * FROM bands;

-------------------------------------------------

En mysql:

En SQLserver: