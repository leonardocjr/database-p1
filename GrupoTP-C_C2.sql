SELECT 
    indice.ind_id AS 'Índice',
    indice.ind_nome AS 'Nome do Índice',
    acao.acao_id AS 'Código da Ação',
    listagem.list_percentual AS 'Percentual Máximo'
FROM
    listagem
        JOIN
    acao ON listagem.acao_id = acao.acao_id
        JOIN
    empresa ON acao.emp_id = empresa.emp_id
        JOIN
    indice ON listagem.ind_id = indice.ind_id
WHERE
    (empresa.emp_id , indice.ind_id, listagem.list_percentual) IN (SELECT 
            empresa.emp_id, listagem.ind_id, MAX(list_percentual)
        FROM
            listagem
                JOIN
            acao ON listagem.acao_id = acao.acao_id
                JOIN
            empresa ON acao.emp_id = empresa.emp_id
        GROUP BY empresa.emp_id , listagem.ind_id)
ORDER BY listagem.list_percentual DESC;