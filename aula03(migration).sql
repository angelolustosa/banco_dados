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

INSERT INTO carro (id_tipo, marca, modelo, ano, cor, chassi)
VALUES
-- SUVs (id_tipo = 1)
(1, 'Toyota', 'RAV4', 2021, 'Preto', '9BWZZZ377VT004251'),
(1, 'Honda', 'CR-V', 2022, 'Branco', '8ABZZZ123YT992311'),

-- Hatch (id_tipo = 2)
(2, 'Volkswagen', 'Golf', 2020, 'Prata', '1HGCM82633A123456'),
(2, 'Ford', 'Fiesta', 2019, 'Azul', '3N1BC13E88L999999'),

-- Sedan (id_tipo = 3)
(3, 'Chevrolet', 'Onix Plus', 2023, 'Cinza', '2C3KA63H76H789012'),
(3, 'Hyundai', 'Elantra', 2021, 'Vermelho', '1HGFA16526L007890'),

-- Pickup (id_tipo = 4)
(4, 'Ford', 'Ranger', 2020, 'Branco', '1FTRW12W47KB34567'),

-- Tipo inexistente (para treinar LEFT JOIN)
(99, 'Marca Fantasma', 'Modelo X', 2025, 'Transparente', 'XXXXXXXXXXXXXXX');
