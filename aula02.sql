--DROP TABLE IF EXISTS public.cliente;

-- Criando tabela com a Chave Primária
CREATE TABLE cliente (
	id SERIAL PRIMARY KEY,
	nome VARCHAR(255),
	email VARCHAR(255)
);

INSERT INTO cliente (nome, email) VALUES
('João Silva', 'joao@email.com'),
('Maria Souza', 'maria@email.com');

SELECT * FROM cliente


INSERT INTO cliente (nome, email) VALUES
('Felipe Farias', 'felipe@email.com');

-- Atualizar a linha com o id 3 que está com o nome null
UPDATE public.cliente SET nome='Teresa Divina' WHERE id=3;


--Setar NOT NULL (não permitir valor nulo) coluna nome e email
ALTER TABLE public.cliente
    ALTER COLUMN nome SET NOT NULL,
    ALTER COLUMN email SET NOT NULL;

INSERT INTO cliente (id, nome, email) VALUES
(4, 'Jorge Luucas', 'jlucas@email.com');

--Ordenando por coluna, se não especificar o order o padrão é o ASC (do menor para o maior)
SELECT * FROM cliente
Order by id --ASC

--Ordenar do maior para o menor
SELECT * FROM cliente 
Order by id DESC