-- 1️⃣ Criar tabela tipo_carro (tabela de dependência)
CREATE TABLE tipo_carro (
    id SERIAL PRIMARY KEY,
    tipo VARCHAR(100) NOT NULL
);

-- 2️⃣ Inserir os tipos de carro
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

-- 3️⃣ Criar tabela carro com a FK
CREATE TABLE carro (
    id SERIAL PRIMARY KEY, 
    id_tipo_carro INT NOT NULL,
    marca VARCHAR(255) NOT NULL,
    modelo VARCHAR(255) NOT NULL,
    ano INT NOT NULL,
    cor VARCHAR(255) NOT NULL,
    chassi VARCHAR(17),
    CONSTRAINT fk_tipo_carro FOREIGN KEY (id_tipo_carro)
        REFERENCES tipo_carro(id)
);

select * from tipo_carro
select * from carro


-- DROP TABLE carro;
-- DROP TABLE tipo_carro;

INSERT INTO carro (id_tipo_carro, marca, modelo, ano, cor, chassi)
VALUES
-- SUVs (id_tipo_carro = 1)
(1, 'Toyota', 'RAV4', 2021, 'Preto', '9BWZZZ377VT004251'),
(1, 'Honda', 'CR-V', 2022, 'Branco', '8ABZZZ123YT992311'),

-- Hatch (id_tipo_carro = 2)
(2, 'Volkswagen', 'Golf', 2020, 'Prata', '1HGCM82633A123456'),
(2, 'Ford', 'Fiesta', 2019, 'Azul', '3N1BC13E88L999999'),

-- Sedan (id_tipo_carro = 3)
(3, 'Chevrolet', 'Onix Plus', 2023, 'Cinza', '2C3KA63H76H789012'),
(3, 'Hyundai', 'Elantra', 2021, 'Vermelho', '1HGFA16526L007890'),

-- Pickup (id_tipo_carro = 4)
(4, 'Ford', 'Ranger', 2020, 'Branco', '1FTRW12W47KB34567'),

-- Tipo inexistente (para treinar LEFT JOIN)
(99, 'Marca Fantasma', 'Modelo X', 2025, 'Transparente', 'XXXXXXXXXXXXXXX');


-- Para saber qual o id_tipo_carro carro será, no exemplo acima 1 (SUV)
select * from tipo_carro 

--conferir o insert
select * from carro

------------- JOIN -------------

--JOIN sem alias (apelido) 
SELECT 
	* 
FROM
	carro 
JOIN tipo_carro  ON carro.id_tipo_carro = tipo_carro.id

--JOIN com alias (apelido) 
SELECT 
	c.modelo, tc.tipo, c.chassi
FROM
	carro c
JOIN tipo_carro tc ON c.id_tipo_carro = tc.id

------------- JOIN, WHERE, LIKE e ILIKE -------------


--Pegar todos os SUVs e da cor Branco
SELECT 
	c.modelo, tc.tipo, c.chassi, c.cor
FROM
	carro c
JOIN tipo_carro tc ON c.id_tipo_carro = tc.id
where c.cor = 'Branco'
and c.id_tipo_carro = 1
and tc.id = 1

--pegar os carros que no chassi contenha 'zzz' em qualquer parte do chassi
select * from carro c
--where chassi ilike '%zzz%'
where chassi ilike '8ab%' --o chassi inicia om 8ab

--like (case sensitive)

--ilike (case insensitive)