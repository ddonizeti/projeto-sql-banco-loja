# Projeto SQL — Banco de Dados e Consultas de Loja Virtual

## Sobre o Projeto
Este projeto tem como objetivo demonstrar a criação, modelagem e manipulação de um banco de dados relacional para uma loja virtual utilizando **MySQL**. 

Ele abrange desde a criação do esquema (tabelas e chaves estrangeiras) até a construção de consultas analíticas para geração de relatórios de vendas.

---

## Tecnologias Utilizadas
* **Banco de Dados:** MySQL
* **Ferramenta de Gestão:** MySQL Workbench
* **Linguagem:** SQL

---

## Estrutura do Repositório
* `database/loja.sql`: Contém a estrutura de criação do banco de dados (`CREATE DATABASE`), tabelas (`CREATE TABLE`) e inserção de dados de exemplo (`INSERT INTO`).
* `consultas/consultas.sql`: Contém as queries analíticas e relatórios desenvolvidos (`SELECT`, `WHERE`, `JOIN`, `GROUP BY`, `SUM`).

---

## Estrutura do Banco de Dados
O sistema possui 4 tabelas interligadas:
* **clientes:** Armazena dados cadastrais dos clientes.
* **produtos:** Armazena informações dos produtos, categorias, preços e estoque.
* **pedidos:** Registra os pedidos efetuados, vinculando-os a um cliente.
* **itens_pedido:** Relaciona os produtos vendidos em cada pedido com quantidade e valor unitário.

---

## Conceitos e Comandos Praticados
* Definir **Chaves Primárias (PRIMARY KEY)** e **Chaves Estrangeiras (FOREIGN KEY)**.
* Filtragem e ordenação de resultados com **`WHERE` e `ORDER BY`.***
* Junção de múltiplas tabelas usando **`INNER JOIN`.**
* Agrupamento e relatórios financeiros usando **`GROUP BY` e funções de agregação (`SUM`).**

---

## Exemplo de Consulta Analítica
Consulta para identificar o cliente, data e o **valor total** de cada pedido:

```sql
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
