CREATE DATABASE loja;

USE loja;

CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    cidade VARCHAR(50)
);

CREATE TABLE produtos (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    categoria VARCHAR(50),
    preco DECIMAL(10,2),
    estoque INT
);

CREATE TABLE pedidos (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,
    data_pedido DATE,
    status VARCHAR(30),

    FOREIGN KEY (id_cliente)
    REFERENCES clientes(id_cliente)
);

CREATE TABLE itens_pedido (
    id_item INT PRIMARY KEY AUTO_INCREMENT,
    id_pedido INT,
    id_produto INT,
    quantidade INT,
    preco_unitario DECIMAL(10,2),

    FOREIGN KEY (id_pedido)
    REFERENCES pedidos(id_pedido),

    FOREIGN KEY (id_produto)
    REFERENCES produtos(id_produto)
);

INSERT INTO clientes (nome, email, cidade)
VALUES
('João Silva', 'joao@email.com', 'Barueri'),
('Maria Santos', 'maria@email.com', 'Osasco'),
('Pedro Oliveira', 'pedro@email.com', 'São Paulo'),
('Ana Costa', 'ana@email.com', 'Barueri');


INSERT INTO produtos (nome, categoria, preco, estoque)
VALUES
('Notebook', 'Informática', 3500.00, 10),
('Mouse', 'Informática', 80.00, 50),
('Teclado', 'Informática', 150.00, 30),
('Monitor', 'Informática', 900.00, 15),
('Headset', 'Acessórios', 250.00, 20);


INSERT INTO pedidos (id_cliente, data_pedido, status)
VALUES
(1, '2026-08-20', 'Enviado'),
(2, '2026-08-21', 'Pago'),
(1, '2026-08-22', 'Entregue'),
(3, '2026-08-23', 'Pendente');


INSERT INTO itens_pedido
(id_pedido, id_produto, quantidade, preco_unitario)
VALUES
(1, 1, 1, 3500.00),
(1, 2, 2, 80.00),
(2, 4, 1, 900.00),
(3, 3, 1, 150.00),
(3, 5, 2, 250.00),
(4, 2, 1, 80.00);


