SELECT s.set_nome AS 'Nome do Setor Econômico', 
       SUM(c.cot_volumefin) AS 'Volume Financeiro Total Gerado'
FROM b3.cotacao c
JOIN b3.acao a ON c.acao_id = a.acao_id
JOIN b3.empresa e ON a.emp_id = e.emp_id
JOIN b3.segmento seg ON e.seg_id = seg.seg_id
JOIN b3.subsetor sub ON seg.sub_id = sub.sub_id
JOIN b3.setor s ON sub.set_id = s.set_id
GROUP BY s.set_nome
ORDER BY SUM(c.cot_volumefin) DESC;