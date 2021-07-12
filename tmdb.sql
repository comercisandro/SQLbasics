CREATE DATABASE tmdb;

USE tmdb;

CREATE TABLE title(
    [id] INT IDENTITY (1,1) NOT NULL PRIMARY KEY (id),
    [name] NVARCHAR (max) NOT NULL,
    [release] NVARCHAR (50) NOT NULL,
    [genres] NVARCHAR (max) NULL,
    [runtime] NVARCHAR (50) NULL,
    [user_score] NCHAR (10) NULL,
    [tagline] NVARCHAR (max) NULL,
    [overview] NVARCHAR (max) NULL,
);

SELECT * FROM title;