SELECT 
    s.theme_id,
    t.name AS theme_name,
    COUNT(s.set_num) AS ca_sets,
    ROUND(AVG(s.num_parts), 2) AS ca_piezas_medias
FROM 
    lego.sets s
JOIN 
    lego.themes t ON s.theme_id = t.id
WHERE 
    s.theme_id BETWEEN 246 AND 251
GROUP BY 
    s.theme_id, t.name
ORDER BY 
    s.theme_id;
