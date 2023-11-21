SELECT sub.sub_nome AS 'Subsetor Econômico', seg.seg_nome AS 'Segmento Ecônomico', e.emp_nome AS 'Pregão da Empresa'
FROM b3.empresa e
JOIN b3.segmento seg ON e.seg_id = seg.seg_id

JOIN b3.subsetor sub ON seg.sub_id = sub.sub_id

JOIN b3.setor s ON sub.set_id = s.set_id

WHERE e.gov_id IS NULL AND s.set_nome = 'Tecnologia da Informação';