SELECT i.ind_id AS 'Sigla do Índice', 
       i.ind_nome AS 'Nome do Índice', 
       l.acao_id AS 'Código da Ação', 
       MAX(l.list_percentual) AS 'Percentual'
FROM b3.listagem l
JOIN b3.indice i ON l.ind_id = i.ind_id
GROUP BY i.ind_id, i.ind_nome, l.acao_id
ORDER BY MAX(l.list_percentual) DESC;
