SELECT c.cot_data AS 'Data do Pregão', 
       a.acao_id AS 'Código da Ação', 
       c.cot_pabertura AS 'Preço de Abertura', 
       c.cot_pfechamento AS 'Preço de Fechamento', 
       (c.cot_pfechamento - c.cot_pabertura) AS 'Diferença (R$)', 
       ((c.cot_pfechamento - c.cot_pabertura) / c.cot_pabertura) * 100 AS 'Rentabilidade (%)', 
       c.cot_volumefin AS 'Volume Financeiro Total'
FROM b3.cotacao c
JOIN b3.acao a ON c.acao_id = a.acao_id
WHERE c.cot_volumefin > 1300000000
ORDER BY c.cot_volumefin DESC;