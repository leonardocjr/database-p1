SELECT e.emp_id AS 'Código da Empresa', e.emp_nome AS 'Nome de Pregão da Empresa', COUNT(a.acao_id) AS 'Quantidade de Ações'
FROM b3.empresa e
JOIN b3.acao a ON e.emp_id = a.emp_id
GROUP BY e.emp_id, e.emp_nome
HAVING COUNT(a.acao_id) > 4
ORDER BY COUNT(a.acao_id) DESC;