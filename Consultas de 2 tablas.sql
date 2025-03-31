<!--1. Muestra las visitas con el nombre del jesuita que las has realizado.->
SELECT nombre,visita.idJesuita,visita.ip,fechaHora 
	FROM visita INNER JOIN jesuita
			ON visita.idJesuita=jesuita.idJesuita;

<!--2.Muestra todas las visitas con el nombre del jesuita que las ha realizado y el nombre (lugar) de lugar visitado.->

SELECT nombre,visita.idJesuita,visita.ip,fechaHora,lugar 
FROM visita INNER JOIN jesuita
ON visita.idJesuita=jesuita.idJesuita
INNER JOIN lugar
ON lugar.ip=visita.ip;
