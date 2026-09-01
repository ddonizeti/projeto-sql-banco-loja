USE loja;

-- Consulta 1: Todos os clientes
SELECT * FROM clientes;

-- Consulta 2: Clientes de Barueri
SELECT * FROM clientes 
WHERE cidade = 'Barueri';

-- Consulta 3: Produtos acima de R$ 500,00
SELECT nome, preco 
FROM produtos 
WHERE preco > 500;

-- Consulta 4: Produtos ordenados do mais caro ao mais barato
SELECT nome, preco 
FROM produtos 
ORDER BY preco DESC;

-- Consulta 5: Relatório de pedidos por cliente (JOIN)
SELECT p.id_pedido, c.nome AS cliente, p.data_pedido, p.status
FROM pedidos p
INNER JOIN clientes c ON p.id_cliente = c.id_cliente;

-- Consulta 6: Valor total de cada pedido
SELECT id_pedido, SUM(quantidade * preco_unitario) AS valor_total
FROM itens_pedido
GROUP BY id_pedido;

-- Consulta 7: Relatório completo de vendas (JOIN + GROUP BY)
SELECT 
    p.id_pedido,
    c.nome AS cliente,
    p.data_pedido,
    p.status,
    SUM(i.quantidade * i.preco_unitario) AS total
FROM pedidos p
INNER JOIN clientes c ON p.id_cliente = c.id_cliente
INNER JOIN itens_pedido i ON p.id_pedido = i.id_pedido
GROUP BY p.id_pedido, c.nome, p.data_pedido, p.status
ORDER BY total DESC;
