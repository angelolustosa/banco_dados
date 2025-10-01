--Criando a tabela carro com as colunas marca, modelo e ano
CREATE TABLE carro (
	marca VARCHAR(255),
	modelo VARCHAR(255),
	ano INT
);

--Inserindo dados na tabela
INSERT INTO carro (marca, modelo, ano)
VALUES ('Fiat', 'Cronos', 2025);

--Visualizando os dados da tabela
SELECT * from carro;

--Visualizar uma ou mais colunas
SELECT modelo, ano from carro;

--Adicionando uma nova coluna
ALTER TABLE carro ADD cor VARCHAR(20);

--Conferir se a coluna foi adicionada
SELECT * from carro;


--Inserindo várias linhas ao mesmo tempo na tabela
INSERT INTO carro (marca, modelo, ano, cor)
VALUES
('Fiat', 'Pulse', 2025, 'vermelho'),
('Fiat', 'Uno', 2020, 'verde'),
('Volkswagen', 'T-Cross', 2023, 'Bege Mohave'),
('Volkswagen', 'Taos', 2024, 'Azul Atlantic');

--Conferir se as 4 linhas foram adicionadas
SELECT * from carro;

--Selecionado com condição
SELECT * FROM carro WHERE marca = 'Fiat'

--selecionando com condição sem diferenciar maiúscula e minúuscula
SELECT * FROM carro WHERE marca ilike 'FIAT'
