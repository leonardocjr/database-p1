SELECT t.tipo_nome AS 'Nome do Tipo do Índice', COUNT(i.ind_id) AS 'Quantidade de Índices'
FROM b3.tipo_indice t
JOIN b3.indice i ON t.tipo_id = i.tipo_id
GROUP BY t.tipo_nome
ORDER BY COUNT(i.ind_id) DESC;