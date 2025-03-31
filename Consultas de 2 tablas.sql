/*1. Muestra las visitas con el nombre del jesuita que las has realizado.*/
SELECT nombre,visita.idJesuita,visita.ip,fechaHora 
	FROM visita INNER JOIN jesuita
			ON visita.idJesuita=jesuita.idJesuita;

/*2.Muestra todas las visitas con el nombre del jesuita que las ha realizado y el nombre (lugar) de lugar visitado.*/

SELECT nombre,visita.idJesuita,visita.ip,fechaHora,lugar 
FROM visita INNER JOIN jesuita
ON visita.idJesuita=jesuita.idJesuita
INNER JOIN lugar
ON lugar.ip=visita.ip;

/*3- Añade un jesuita nuevo. Este jesuita no va a realizar ninguna visita.*/

INSERT INTO jesuita(codigo, nombre, nombreAlumno, firma, firmaIngles)
VALUES('ABC15','Bernardino','Tomas','Somos  lo que somos','We are what we are');

/*4- Añade 2 lugares nuevos. Estos lugares no se van a visitar.->
INSERT INTO lugar(ip,nombre_maquina,lugar)*/
VALUES
    ('10.3.19.101', 'WIN-AI43-191', 'Vigo'),
    ('10.3.35.102', 'WIN-AI43-222', 'Barcelona');
/*5 	Muestra todos los jesuitas con el nombre del lugar que han visitado. 
Si algún jesuita no ha realizado visita, también habrá que visualizar sus datos, 
mira que ocurre con el valor del campo lugar en estos casos.
Realiza 2 versiones de la misma consulta, una usando LEFT y otra usando RIGHT.->*/

SELECT nombre,lugar 
FROM visita RIGHT  JOIN jesuita
ON visita.idJesuita=jesuita.idJesuita
RIGHT  JOIN lugar
ON lugar.ip=visita.ip;

SELECT nombre,lugar 
FROM visita LEFT JOIN jesuita
ON visita.idJesuita=jesuita.idJesuita
LEFT JOIN lugar
ON lugar.ip=visita.ip;

/*no me hace nada deberia darme los jesuitas que no tiene visitas pero no lo hace*/
/*6- Muestra todos los lugares con el nombre del jesuita que realiza la visitada. Si algún lugar no se 
ha visitado, también habrá que visualizar sus datos ´mira que ocurre con el valor del campo nombre (jesuita) 
en estos casos.*/

SELECT nombre,lugar 
FROM visita RIGHT  JOIN jesuita
ON visita.idJesuita=jesuita.idJesuita
RIGHT  JOIN lugar
ON lugar.ip=visita.ip;

/*Los campos nombre de los lugares no visitados salen a NULL*/

/*7- Mirando los resultado de la consulta anterior, intenta mostrar solo los lugares que 
NO se han visitado (es la consulta anterior con una condición).*/

SELECT nombre,lugar 
FROM visita RIGHT JOIN jesuita
ON visita.idJesuita=jesuita.idJesuita
RIGHT JOIN lugar
ON lugar.ip=visita.ip
where nombre is NULL;

/*8- Muestra todos los jesuitas con el nombre del lugar que han visitado. 
Si algún jesuita no ha realizado visita, también habrá que visualizar sus datos 
y si algún lugar no se ha visitado también se muestra su nombre (lugar). Realiza 
esta consulta en 2 pasos y ve comprobado qué ocurre al hacer el JOIN.*/
SELECT nombre,lugar 
FROM visita RIGHT  JOIN jesuita
ON visita.idJesuita=jesuita.idJesuita
RIGHT  JOIN lugar
ON lugar.ip=visita.ip
UNION
SELECT nombre,lugar 
FROM visita LEFT JOIN jesuita
ON visita.idJesuita=jesuita.idJesuita
LEFT JOIN lugar
ON lugar.ip=visita.ip;
/*Deberia hacer esto pero tengo el mismo problema que el LEFT no hace nada*/
SELECT nombre,lugar 
FROM visita FULL JOIN jesuita
ON visita.idJesuita=jesuita.idJesuita
FULL JOIN lugar
ON lugar.ip=visita.ip;
/*Con full si aparecen tanto los lugares no visitados como los jesuitas que no han visitado*/

/*9- Muestra el nombre de los jesuitas que han realizado alguna visitas (no hay que mostrar ningún dato más de la visita).*/
SELECT DISTINCT nombre
FROM visita INNER JOIN jesuita
ON visita.idJesuita=jesuita.idJesuita;

/*10- Piensa otra consulta diferente con DISTINCT (con la misma base de datos).*/

SELECT DISTINCT lugar
FROM visita INNER JOIN lugar
ON lugar.ip=visita.ip;




