SELECT empresa.emp_nome, segmento.seg_nome, governanca.gov_id, governanca.gov_nome
FROM empresa, segmento, governanca
WHERE empresa.seg_id = segmento.seg_id AND empresa.gov_id = governanca.gov_id AND segmento.seg_nome LIKE "_____a__n%" AND (governanca.gov_id = "NM" OR governanca.gov_id = "MA");