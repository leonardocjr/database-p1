CREATE SCHEMA b3;

USE b3;

# RN 01
CREATe TABLE setor (
	setor_id VARCHAR(10) NOT NULL PRIMARY KEY,
    setor_nome VARCHAR(100) NOT NULL
);

# RN 02
CREATE TABLE subsetor (
	sub_id VARCHAR(10) NOT NULL PRIMARY KEY,
	sub_nome VARCHAR(100) NOT NULL,
	setor_id VARCHAR(10) NOT NULL,
	CONSTRAINT fk_subsetor_setor
	FOREIGN KEY (setor_id) REFERENCES setor(setor_id)
);

# RN 03
CREATE TABLE segmento (
	seg_id VARCHAR(10) NOT NULL PRIMARY KEY,
	seg_nome VARCHAR(100) NOT NULL,
	sub_id VARCHAR(10) NOT NULL,
	CONSTRAINT fk_segmento_subsetor
	FOREIGN KEY (sub_id) REFERENCES subsetor(sub_id)
);

# RN 04
CREATE TABLE governanca (
	gov_id VARCHAR(10) NOT NULL PRIMARY KEY,
	gov_nome VARCHAR(100) NOT NULL
);

# RN 05
CREATE TABLE empresa (
	emp_id VARCHAR(10) NOT NULL PRIMARY KEY,
	emp_nome VARCHAR(100) NOT NULL,
	gov_id VARCHAR(10),
	CONSTRAINT fk_empresa_governanca
	FOREIGN KEY (gov_id) REFERENCES governanca(gov_id),
	seg_id VARCHAR(10) NOT NULL,
	CONSTRAINT fk_empresa_segmento
	FOREIGN KEY (seg_id) REFERENCES segmento(seg_id)
)

# RN 06
CREATE TABLE acao (
	acao_id VARCHAR(10) NOT NULL PRIMARY KEY,
	emp_id VARCHAR(10) NOT NULL,
	CONSTRAINT fk_acao_empresa
	FOREIGN KEY (emp_id) REFERENCES empresa(emp_id)
)

# RN 07
CREATE TABLE tipo_indice (
	tipo_id VARCHAR(10) NOT NULL PRIMARY KEY,
	tipo_nome VARCHAR(100) NOT NULL
);

# RN 08
CREATE TABLE indice (
	indice_id VARCHAR(10) NOT NULL PRIMARY KEY,
	indice_nome VARCHAR(100) NOT NULL,
	tipo_id VARCHAR(10) NOT NULL,
	CONSTRAINT fk_indice_tipo_indice
	FOREIGN KEY (tipo_id) REFERENCES tipo_indice(tipo_id)
);

# RN 09


# RN 10


# RN 11