CREATE DATABASE tmdb;

USE tmdb;
/*
CREATE TABLE title(
    [id] INT IDENTITY (1,1) NOT NULL PRIMARY KEY (id),
    [name] NVARCHAR (max) NOT NULL,
    [release] NVARCHAR (50) NULL,
    [genres] NVARCHAR (max) NULL,
    [runtime] NVARCHAR (50) NULL,
    [user_score] NCHAR (10) NULL,
    --[tagline] NVARCHAR (max) NULL,
    [overview] NVARCHAR (max) NULL,
);
*/

CREATE TABLE title(
    [id] INT NOT NULL PRIMARY KEY (id),
    --[id_rtv] INT NOT NULL UNIQUE,
    [name] NVARCHAR (max) NOT NULL,
    [release] NVARCHAR (50) NULL,
    [genres] NVARCHAR (max) NULL,
    [runtime] NVARCHAR (50) NULL,
    [user_score] NCHAR (10) NULL,
    --[tagline] NVARCHAR (max) NULL,
    [overview] NVARCHAR (max) NULL,

);

CREATE TABLE cast_and_crew(
    [person_id] INT NOT NULL,
    [name] NVARCHAR (max) NOT NULL,
    [type] NVARCHAR (max) NOT NULL,
    [id_title] INT NOT NULL
    CONSTRAINT fk_cast_title FOREIGN KEY (id_title)
    REFERENCES title (id)

);

CREATE TABLE aka(
    [country] NVARCHAR (max) NOT NULL,
    [name] NVARCHAR (max) NOT NULL,
    [id_title] INT NOT NULL
    CONSTRAINT fk_aka_title FOREIGN KEY (id_title)
    REFERENCES title (id)

);


CREATE TABLE relases(
    [country] NVARCHAR (max) NOT NULL,
    [date] NVARCHAR (max) NOT NULL,
    [id_title] INT NOT NULL
    CONSTRAINT fk_releases_title FOREIGN KEY (id_title)
    REFERENCES title (id)
);



SELECT * FROM title;

SELECT * FROM cast_and_crew;

SELECT * FROM aka;

SELECT * FROM relases;


DROP TABLE relases;
DROP TABLE cast_and_crew;
DROP TABLE aka;
DROP TABLE title;


SELECT title.name AS movie, cast_and_crew.name AS actor, cast_and_crew.type AS como
    FROM title INNER JOIN cast_and_crew ON cast_and_crew.id_title=title.id


SELECT * FROM title INNER JOIN cast_and_crew ON cast_and_crew.id_title=title.id


SELECT * 
FROM title INNER JOIN cast_and_crew ON cast_and_crew.id_title=title.id
WHERE cast_and_crew.name LIKE '%nico%'


SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='title' AND COLUMN_NAME='id'