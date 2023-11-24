SELECT sub.sub_nome AS 'Nome do Subsetor', 
       seg.seg_nome AS 'Nome do Segmento', 
       e.emp_nome AS 'Nome de Pregão da Empresa'
FROM empresa e
JOIN segmento seg ON e.seg_id = seg.seg_id
JOIN subsetor sub ON seg.sub_id = sub.sub_id
JOIN setor s ON sub.set_id = s.set_id
WHERE s.set_nome = 'Tecnologia da Informação' AND e.gov_id IS NULL;
