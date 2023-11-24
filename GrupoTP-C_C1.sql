SELECT e.emp_nome AS 'Nome de Pregão da Empresa', 
       seg.seg_nome AS 'Nome do Segmento', 
       CONCAT(g.gov_id, ' - ', g.gov_nome) AS 'Sigla e Nome do Nível de Governança'
FROM b3.empresa e
JOIN b3.segmento seg ON e.seg_id = seg.seg_id
JOIN b3.governanca g ON e.gov_id = g.gov_id
WHERE seg.seg_nome LIKE "_____a__n%" AND g.gov_nome IN ('Novo Mercado', 'Bovespa Mais')
ORDER BY e.emp_nome;