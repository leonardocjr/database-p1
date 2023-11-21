SELECT listagem.ind_id, indice.ind_nome, listagem.acao_id, MAX(listagem.list_percentual) AS "Percentual da maior acao"
FROM listagem, indice, empresa, acao
WHERE listagem.ind_id = indice.ind_id AND empresa.emp_id = acao.emp_id AND acao.acao_id = listagem.acao_id
GROUP BY empresa.emp_id ORDER BY MAX(listagem.list_percentual) DESC