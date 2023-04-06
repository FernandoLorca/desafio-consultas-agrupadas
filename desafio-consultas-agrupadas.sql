CREATE DATABASE desafio2_fernando_lorca_123;

CREATE TABLE IF NOT EXISTS INSCRITOS(
    id SERIAL PRIMARY KEY,
    cantidad INT,
    fecha DATE,
    fuente VARCHAR
);

INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 44, '01/01/2021', 'Blog' ), ( 56, '01/01/2021', 'Página' ), ( 39, '01/02/2021', 'Blog' ), ( 81, '01/02/2021', 'Página' ), ( 12, '01/03/2021', 'Blog' ), ( 91, '01/03/2021', 'Página' ), ( 48, '01/04/2021', 'Blog' ), ( 45, '01/04/2021', 'Página' ), ( 55, '01/05/2021', 'Blog' ), ( 33, '01/05/2021', 'Página' ), ( 18, '01/06/2021', 'Blog' ), ( 12, '01/06/2021', 'Página' ), ( 34, '01/07/2021', 'Blog' ), ( 24, '01/07/2021', 'Página' ), ( 83, '01/08/2021', 'Blog' ), ( 99, '01/08/2021', 'Página' );

--01
SELECT COUNT(*) FROM inscritos;

--02
SELECT SUM(cantidad) AS cantidad_inscritos FROM inscritos;

--03
SELECT * FROM inscritos WHERE fecha = (SELECT MIN(fecha) FROM inscritos);

--04
SELECT fecha, SUM(cantidad) AS registros_por_dia FROM inscritos GROUP BY fecha ORDER BY fecha;

--05
SELECT fuente, SUM(cantidad) AS registros_por_fuente FROM inscritos GROUP BY fuente;

--06
SELECT fecha, SUM(cantidad) AS registros_por_dia FROM inscritos GROUP BY fecha ORDER BY registros_por_dia DESC LIMIT 1;

--07
SELECT * FROM inscritos WHERE cantidad = (SELECT MAX(cantidad) FROM inscritos WHERE fuente = 'Blog') LIMIT 1;

--08
SELECT AVG(resultado.registros_por_dia) FROM (SELECT fecha, SUM(cantidad) AS registros_por_dia FROM inscritos GROUP BY fecha ORDER BY fecha) AS resultado;

--09
SELECT fecha, SUM(cantidad) AS registros_por_dia FROM inscritos GROUP BY fecha HAVING SUM(cantidad) > 50;

--10
SELECT AVG(resultado.registros_por_dia) FROM (SELECT fecha, SUM(cantidad) AS registros_por_dia FROM inscritos WHERE fecha >= '01/03/2021' GROUP BY fecha) AS resultado;
