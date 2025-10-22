# Exercício de Banco de Dados: Tabelas `pessoa` e `endereco`

## Objetivo
Criar um banco de dados com duas tabelas relacionadas, aplicando conceitos de:
- **Chave primária (PK)**
- **Chave única (UNIQUE)**
- **NOT NULL**
- **Relacionamento entre tabelas (FK)**

---

## Parte 1 – Tabela `pessoa`

Crie uma tabela chamada `pessoa` com as seguintes colunas:

## 🧍‍♂️ Tabela `pessoa`
| Coluna          | Tipo        |
|-----------------|-------------|
| id              | SERIAL      |
| nome            | VARCHAR(255)|
| data_nascimento | DATE        |
| cpf             | VARCHAR(11) |
| sexo            | CHAR(1)     |
**Regras:**
- O CPF deve ser único para cada pessoa.  
- Nenhuma coluna deve permitir valores nulos.  

---

## Parte 2 – Tabela `endereco`

Crie uma tabela chamada `endereco` com as seguintes colunas:

---

## 🏠 Tabela `endereco`
| Coluna    | Tipo         |
|------------|--------------|
| id         | SERIAL       |
| pessoa_id  | INT          |
| rua        | VARCHAR(255) |
| cidade     | VARCHAR(100) |
| estado     | CHAR(2)      |
| cep        | VARCHAR(8)   |

**Regras:**
- Uma pessoa pode ter **vários endereços** (relacionamento 1:N).  
- Nenhuma coluna deve permitir valores nulos.  

---

## Parte 3 – Inserir dados

Insira pelo menos duas pessoas e três endereços (uma pessoa pode ter dois endereços).

Exemplo de dados:

- Pessoa: João Silva, CPF: 12345678901  
- Pessoa: Maria Souza, CPF: 98765432100  
- Endereços: Rua A 123, Rua B 456, Rua C 789  

---

## Parte 4 – Consulta

Escreva uma consulta SQL que retorne:

- Nome da pessoa  
- Rua, número, cidade, estado e CEP de cada endereço  

**Dica:** Utilize `JOIN` para relacionar as tabelas.

---

## Bônus

- Tente inserir um CPF duplicado e veja como o banco impede a operação.  
- Tente inserir um endereço sem informar o `id_pessoa` e veja como a FK garante a integridade referencial.
