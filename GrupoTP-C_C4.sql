SELECT c.cot_data AS 'Data do Pregão', 
       a.acao_id AS 'Código da Ação', 
       c.cot_pfechamento AS 'Preço de Fechamento', 
       i.ind_id AS 'Sigla do Índice', 
       l.list_percentual AS 'Percentual no Índice'
FROM b3.cotacao c
JOIN b3.acao a ON c.acao_id = a.acao_id
JOIN b3.listagem l ON a.acao_id = l.acao_id
JOIN b3.indice i ON l.ind_id = i.ind_id
WHERE i.ind_nome = 'Índice Brasil Amplo' AND l.list_percentual BETWEEN 1 AND 2
ORDER BY c.cot_data DESC;