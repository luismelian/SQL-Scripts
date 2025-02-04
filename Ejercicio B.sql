--Prefiero usar JOIN en lugar de subconsultas porque suelen ser más rápidos y eficientes cuando trabajas con varias
--tablas y necesitas datos relacionados. Además, hacen que la consulta sea más fácil de leer y mantener, ya que todo 
--queda más organizado y claro.

SELECT 
    p.color_id,
    c.name AS color,
    SUM(s.num_parts) AS ca_piezas
FROM 
    lego.sets s
JOIN 
    lego.inventories i ON s.set_num = i.set_num
JOIN 
    lego.inventory_parts p ON i.id = p.inventory_id
JOIN 
    lego.colors c ON p.color_id = c.id
WHERE 
    s.theme_id BETWEEN 246 AND 251
GROUP BY 
    p.color_id, c.name
ORDER BY 
    ca_piezas DESC;
