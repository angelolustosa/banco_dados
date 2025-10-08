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


--------------------------------------

CREATE TABLE carro (
	marca VARCHAR(255),
	modelo VARCHAR(255),
	ano INT
);

INSERT INTO carro (marca, modelo, ano)
VALUES ('Fiat', 'Cronos', 2025);

SELECT * from carro;

--Criando tabela de realcionamento tipo_carro com carro
CREATE TABLE IF NOT EXISTS tipo_carro
(
	id SERIAL PRIMARY KEY,
    tipo character varying(255) NOT NULL
)

--Inserindo valores na tipo_carro
INSERT INTO tipo_carro (tipo)
VALUES 
('SUV'),
('Hatch'),
('Sedan'),
('Pickup'),
('Crossover'),
('Conversível'),
('Cupê'),
('Minivan');


--Select
SELECT * from tipo_carro


-- Adicionar coluna id se ainda não existir
ALTER TABLE public.carro
    ADD COLUMN IF NOT EXISTS id SERIAL PRIMARY KEY;


Select id,marca, modelo, ano from carro	

-- Adicionar coluna id_tipo_carro (referência para tipo_carro)
ALTER TABLE public.carro
    ADD COLUMN IF NOT EXISTS id_tipo_carro INTEGER;


Select * from carro	


-- Criar a constraint de chave estrangeira
ALTER TABLE public.carro
    ADD CONSTRAINT fk_tipo_carro
    FOREIGN KEY (id_tipo_carro)
    REFERENCES public.tipo_carro (id);


--Inserindo com relacionamentos
INSERT INTO public.carro (marca, modelo, ano, id_tipo_carro)
VALUES ('Jeep', 'Compass', 2025, 1),
       ('Volkswagen', 'Gol', 2023, 2);