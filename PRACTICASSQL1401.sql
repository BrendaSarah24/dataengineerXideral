CREATE DATABASE practicajoin;
USE practicajoin;
create table izquierda(izquierda1 varchar(20),izquierda2 varchar(20),izquierda3 varchar(20));
create table derecha(derecha1 varchar(20),derecha2 varchar(20),derecha3 varchar(20));
create table frente(frente1 varchar(20),frente2 varchar(20),frente3 varchar(20));

insert into izquierda values("uno","dos","tres");
INSERT INTO derecha VALUES ("cuatro","cinco","seis");
INSERT INTO derecha VALUES("uno","dos","tres");
INSERT INTO frente VALUES ("siete","ocho","nueve");
INSERT INTO frente VALUES("cuatro","cinco","seis");
 
SELECT * FROM izquierda;
SELECT * FROM derecha;
SELECT * FROM frente;
 
SELECT f.frente1 AS frente, d.derecha1 AS derecha FROM frente AS f INNER JOIN derecha AS d ON f.frente2 = d.derecha2;

