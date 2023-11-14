CREATE SCHEMA b3;

USE b3;

#RN 1
CREATE TABLE setor (
    setor_id INT PRIMARY KEY,
    setor_nome VARCHAR(100) NOT NULL
);

#RN 2
CREATE TABLE subsetor (
    sub_id INT PRIMARY KEY,
    sub_nome VARCHAR(100) NOT NULL,
    setor_id INT NOT NULL,
    CONSTRAINT fk_subsetor_setor FOREIGN KEY (setor_id)
        REFERENCES setor (setor_id)
);

#RN 3
CREATE TABLE segmento (
    seg_id VARCHAR(3) PRIMARY KEY,
    seg_nome VARCHAR(100) NOT NULL,
    sub_id INT NOT NULL,
    CONSTRAINT fk_segmento_subsetor FOREIGN KEY (sub_id)
        REFERENCES subsetor (sub_id)
);

#RN 4
CREATE TABLE governanca (
    gov_id VARCHAR(3) PRIMARY KEY,
    gov_nome VARCHAR(100) NOT NULL
);

#RN 5
CREATE TABLE empresa (
    emp_id VARCHAR(5) PRIMARY KEY,
    emp_nome VARCHAR(100) NOT NULL,
    gov_id VARCHAR(3),
    CONSTRAINT fk_empresa_governanca FOREIGN KEY (gov_id)
        REFERENCES governanca (gov_id),
    seg_id VARCHAR(3) NOT NULL,
    CONSTRAINT fk_empresa_segmento FOREIGN KEY (seg_id)
        REFERENCES segmento (seg_id)
);

#RN 6
CREATE TABLE acao (
    acao_id VARCHAR(6) PRIMARY KEY,
    emp_id VARCHAR(5) NOT NULL,
    CONSTRAINT fk_acao_empresa FOREIGN KEY (emp_id)
        REFERENCES empresa (emp_id)
);

#RN 7
CREATE TABLE tipo_indice (
    tipo_id INT PRIMARY KEY,
    tipo_nome VARCHAR(100) NOT NULL
);

#RN 8
CREATE TABLE indice (
    ind_id VARCHAR(6) PRIMARY KEY,
    ind_nome VARCHAR(100) NOT NULL,
    tipo_id INT NOT NULL,
    CONSTRAINT fk_indice_tipo_indice FOREIGN KEY (tipo_id)
        REFERENCES tipo_indice (tipo_id)
);

#RN 9
CREATE TABLE listagem (
    ind_id VARCHAR(6),
    CONSTRAINT fk_listagem_indice FOREIGN KEY (ind_id)
        REFERENCES indice (ind_id),
    acao_id VARCHAR(6),
    CONSTRAINT fk_listagem_empresa FOREIGN KEY (acao_id)
        REFERENCES acao (acao_id),
    list_quadrimestre INT CHECK (list_quadrimestre BETWEEN 1 AND 3),
    list_ano YEAR,
    list_qtdacoes INT NOT NULL,
    list_percentual DECIMAL(4, 2) NOT NULL,
    PRIMARY KEY (ind_id , acao_id , list_quadrimestre , list_ano)
);

#RN 10
CREATE TABLE mercado (
    mer_id INT PRIMARY KEY,
    mer_nome VARCHAR(100) NOT NULL
);

#RN 11
CREATE TABLE cotacao (
    cot_data DATE NOT NULL,
    cot_id INT PRIMARY KEY,
    cot_pabertura DECIMAL(10, 2) NOT NULL,
    cot_pmax DECIMAL(10, 2) NOT NULL,
    cot_pfechamento DECIMAL(10, 2) NOT NULL,
    cot_qtdnegocios INT NOT NULL,
    cot_qtdacoes INT NOT NULL,
    cot_volumefin DECIMAL(14, 2) NOT NULL,
    acao_id VARCHAR(6) NOT NULL,
    CONSTRAINT fk_cotacao_acao FOREIGN KEY (acao_id)
        REFERENCES acao (acao_id),
    mer_id INT NOT NULL,
    CONSTRAINT fk_cotacao_mercado FOREIGN KEY (mer_id)
        REFERENCES mercado (mer_id)
);