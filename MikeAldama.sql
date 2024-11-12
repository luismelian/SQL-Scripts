SELECT j.nombre, j.apellido, j.salario
FROM liga.jugadores j
WHERE j.salario > (SELECT AVG(salario) FROM liga.jugadores)
ORDER BY j.salario DESC;

SELECT j.nombre AS nombre, j.apellido, j.salario, e.nombre as equipo 
FROM liga.jugadores j
JOIN liga.equipos e ON j.equipo = e.id_equipo
WHERE j.salario BETWEEN 70000 AND 120000
ORDER BY j.salario DESC;

SELECT j.nombre, j.apellido, j.puesto, j.salario
FROM liga.jugadores j
JOIN (
    SELECT puesto, AVG(salario) AS salario_promedio
    FROM liga.jugadores
    GROUP BY puesto
) AS promedio_puesto ON j.puesto = promedio_puesto.puesto
WHERE j.salario > promedio_puesto.salario_promedio
ORDER BY j.salario desc;

SELECT j.puesto, COUNT(*) AS cantidad_jugadores
FROM liga.jugadores j
GROUP BY j.puesto
ORDER BY cantidad_jugadores DESC;

SELECT j.nombre, j.apellido, j.salario, e.nombre
FROM liga.jugadores j
LEFT JOIN liga.equipos e ON j.equipo = e.id_equipo
ORDER BY j.nombre;
