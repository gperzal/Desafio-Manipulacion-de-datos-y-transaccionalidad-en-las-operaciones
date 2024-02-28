
-- Creación de la base de datos
CREATE DATABASE desafio2_guido_perez_669;

-- Creación de la tabla INSCRITOS
CREATE TABLE IF NOT EXISTS INSCRITOS(cantidad INT, fecha DATE, fuente VARCHAR);



-- Inserción de registros
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 44, '01/01/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 56, '01/01/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 39, '01/02/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 81, '01/02/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 12, '01/03/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 91, '01/03/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 48, '01/04/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 45, '01/04/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 55, '01/05/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 33, '01/05/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 18, '01/06/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 12, '01/06/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 34, '01/07/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 24, '01/07/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 83, '01/08/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente) VALUES ( 99, '01/08/2021', 'Página' );



/* 1. ¿Cuántos registros hay?
 - Para contar el número total de registros en la tabla INSCRITOS, se puede usar la función COUNT(). 
*/
SELECT COUNT(*) AS total_registros FROM INSCRITOS;


/* 2. ¿Cuántos inscritos hay en total?
 - Para sumar el total de inscritos de todos los registros, se utiliza la función SUM() sobre la columna cantidad.
*/

SELECT SUM(cantidad) AS total_inscritos FROM INSCRITOS;

/*
3. ¿Cuál o cuáles son los registros de mayor antigüedad?
HINT: ocupar subconsultas

 - Para encontrar los registros más antiguos, podemos ordenar los resultados por la fecha en orden ascendente y luego seleccionar el registro superior. 
 - Para manejar posibles empates, se pueden usar subconsultas para encontrar todas las entradas que coincidan con la fecha más antigua.
*/

SELECT * FROM INSCRITOS 
WHERE fecha = (SELECT MIN(fecha) FROM INSCRITOS);

/*
4. ¿Cuántos inscritos hay por día? (entendiendo un día como una fecha distinta de
ahora en adelante)
 
 - Para contar el número de inscritos por día, se agrupan los registros por la fecha y se suma la cantidad de inscritos para cada grupo.
SELECT fecha, SUM(cantidad) AS inscritos_por_dia
*/


SELECT fecha, SUM(cantidad) AS inscritos_por_dia
FROM INSCRITOS
GROUP BY fecha
ORDER BY fecha;

/*
5. ¿Qué día se inscribieron la mayor cantidad de personas y cuántas personas se
inscribieron en ese día?
 - Para encontrar el día con la mayor cantidad de inscritos, primero, se suman los inscritos por día como en la consulta anterior y luego se utiliza una subconsulta para seleccionar el día con el máximo número de inscritos.
*/
SELECT fecha, SUM(cantidad) AS inscritos
FROM INSCRITOS
GROUP BY fecha
ORDER BY inscritos DESC
LIMIT 1;
