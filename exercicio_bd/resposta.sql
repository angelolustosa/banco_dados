--🧱 Parte 1 – Criação da tabela pessoa
CREATE TABLE pessoa (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    data_nascimento DATE NOT NULL,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    sexo CHAR(1) NOT NULL
);


✅ Explicação:

id é a chave primária (PRIMARY KEY).

cpf é único (UNIQUE), impedindo duplicatas.

NOT NULL garante que todas as colunas devem ter valor.

--🏠 Parte 2 – Criação da tabela endereco
CREATE TABLE endereco (
    id SERIAL PRIMARY KEY,
    pessoa_id INT NOT NULL,
    rua VARCHAR(255) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    estado CHAR(2) NOT NULL,
    cep VARCHAR(8) NOT NULL,
    CONSTRAINT fk_pessoa FOREIGN KEY (pessoa_id)
        REFERENCES pessoa (id)
        ON DELETE CASCADE
);


✅ Explicação:

pessoa_id é a chave estrangeira que referencia pessoa(id).

O ON DELETE CASCADE faz com que, se uma pessoa for excluída, seus endereços sejam automaticamente removidos.

Todas as colunas têm NOT NULL.

--✍️ Parte 3 – Inserindo dados
-- Inserindo pessoas
INSERT INTO pessoa (nome, data_nascimento, cpf, sexo)
VALUES 
('João Silva', '1990-05-10', '12345678901', 'M'),
('Maria Souza', '1988-09-25', '98765432100', 'F');

-- Inserindo endereços
INSERT INTO endereco (pessoa_id, rua, cidade, estado, cep)
VALUES
(1, 'Rua A, 123', 'Fortaleza', 'CE', '60000000'),
(1, 'Rua B, 456', 'Caucaia', 'CE', '61600000'),
(2, 'Rua C, 789', 'Maracanaú', 'CE', '61900000');

--🔍 Parte 4 – Consulta com JOIN
SELECT 
    p.nome,
    e.rua,
    e.cidade,
    e.estado,
    e.cep
FROM pessoa p
JOIN endereco e ON p.id = e.pessoa_id;

--🎯 Bônus – Testes de integridade
--1️⃣ Inserir CPF duplicado (erro esperado)
INSERT INTO pessoa (nome, data_nascimento, cpf, sexo)
VALUES ('Carlos Lima', '1985-02-11', '12345678901', 'M');
-- ERRO: duplicate key value violates unique constraint "pessoa_cpf_key"

--2️⃣ Inserir endereço sem pessoa_id existente (erro esperado)
INSERT INTO endereco (pessoa_id, rua, cidade, estado, cep)
VALUES (99, 'Rua X, 101', 'Fortaleza', 'CE', '60100000');
-- ERRO: insert or update on table "endereco" violates foreign key constraint "fk_pessoa"

✅ Resumo final

pessoa → armazena dados pessoais com CPF único.

endereco → armazena endereços relacionados a uma pessoa.

JOIN → retorna as informações completas combinando ambas as tabelas.

UNIQUE e FOREIGN KEY garantem integridade dos dados.