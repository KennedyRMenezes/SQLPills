--- TABLES

/*

- clientes (`cliente_id`, `nome`, `email`, `data_registro`)
- produtos (`produto_id`, `nome`, `preco`, `estoque`)
- pedidos (`pedido_id`, `cliente_id`, `data_pedido`, `valor_total`)
- itens_pedido (`item_id`, `pedido_id`, `produto_id`, `quantidade`, `preco_unitario`)

*/

-- Criação do database
CREATE DATABASE LojaOnline;

-- Entrando no database
USE LojaOnline;

-- Criação das tabelas
CREATE TABLE clientes (
    cliente_id SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    data_registro DATE NOT NULL
);

CREATE TABLE produtos (
    produto_id SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    estoque INT NOT NULL
);

CREATE TABLE pedidos (
    pedido_id SERIAL PRIMARY KEY,
    cliente_id INT REFERENCES clientes(cliente_id),
    data_pedido DATE NOT NULL,
    valor_total DECIMAL(10, 2) NOT NULL
);

CREATE TABLE itens_pedido (
    item_id SERIAL PRIMARY KEY,
    pedido_id INT REFERENCES pedidos(pedido_id),
    produto_id INT REFERENCES produtos(produto_id),
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10, 2) NOT NULL
);

-- Inserção de dados

-- Tabela clientes
INSERT INTO clientes (nome, email, data_registro) VALUES
('João Silva', 'joao.silva@email.com', '2023-01-15'),
('Maria Oliveira', 'maria.oliveira@email.com', '2023-02-10'),
('Pedro Santos', 'pedro.santos@email.com', '2022-12-01'),
('Ana Costa', 'ana.costa@email.com', '2023-01-25'),
('Lucas Almeida', 'lucas.almeida@email.com', '2023-03-05');

-- Tabela produtos
INSERT INTO produtos (nome, preco, estoque) VALUES
('Camiseta Básica', 29.90, 100),
('Calça Jeans', 89.90, 50),
('Tênis Esportivo', 199.90, 30),
('Boné Estiloso', 49.90, 75),
('Jaqueta de Couro', 249.90, 20);

-- Tabela pedidos
INSERT INTO pedidos (cliente_id, data_pedido, valor_total) VALUES
(1, '2023-03-10', 119.80),
(2, '2023-03-12', 89.90),
(3, '2023-03-15', 399.80),
(4, '2023-03-18', 59.80),
(5, '2023-03-20', 29.90);
(1, '2023-03-20', 429.70)


-- Tabela itens_pedido
INSERT INTO itens_pedido (pedido_id, produto_id, quantidade, preco_unitario) VALUES
(1, 1, 2, 29.90),   -- João Silva comprou 2 Camisetas Básicas
(1, 2, 1, 89.90),   -- João Silva comprou 1 Calça Jeans
(2, 3, 1, 199.90),  -- Maria Oliveira comprou 1 Tênis Esportivo
(3, 1, 4, 29.90),   -- Pedro Santos comprou 4 Camisetas Básicas
(3, 5, 1, 249.90),  -- Pedro Santos comprou 1 Jaqueta de Couro
(4, 4, 1, 49.90),   -- Ana Costa comprou 1 Boné Estiloso
(5, 1, 1, 29.90),   -- Lucas Almeida comprou 1 Camiseta Básica
(6, 5, 1, 249.90),
(6, 4, 2, 179.80);