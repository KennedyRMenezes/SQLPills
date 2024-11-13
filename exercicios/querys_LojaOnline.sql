
--- 1 - Identificar produtos mais vendidos: 
---Liste os produtos com maior número de unidades vendidas.
SELECT p.nome, 
       sum(ip.quantidade)
FROM itens_pedido AS ip
    INNER JOIN produtos AS p
        ON ip.produto_id = p.produto_id
GROUP BY p.nome;

/*
+------------------+--------------------+
| nome             | sum(ip.quantidade) |
+------------------+--------------------+
| Camiseta Básica  |                  7 |
| Calça Jeans      |                  1 |
| Tênis Esportivo  |                  1 |
| Jaqueta de Couro |                  1 |
| Boné Estiloso    |                  1 |
+------------------+--------------------+
*/


--- 2 - Clientes mais lucrativos: 
--- Identifique os clientes que geraram maior receita para a loja. 
--- Mostre o cliente e o total de valor gasto
SELECT cliente_id, 
       sum(valor_total) AS total_gasto
FROM pedidos
GROUP BY cliente_id
ORDER BY total_gasto DESC;

/*
+------------+-------------+
| cliente_id | total_gasto |
+------------+-------------+
|          1 |      549.50 |
|          3 |      399.80 |
|          2 |       89.90 |
|          4 |       59.80 |
|          5 |       29.90 |
+------------+-------------+
*/

--- 3 - Desconto em produtos com vendas baixas: 
--- Identifique produtos com menos vendas e mostre um valor de desconto.
SELECT nome, 
			 preco, 
			 quantidade, 
			 preco * 0.6 AS desconto_40 
FROM (
			SELECT p.produto_id, 
						 p.nome, p.preco, 
						 sum(ip.quantidade) AS quantidade
			FROM itens_pedido AS ip
				INNER JOIN produtos AS p
					ON ip.produto_id = p.produto_id
			GROUP BY p.produto_id
			HAVING quantidade < 3
			ORDER BY quantidade
) AS q;

/*
+------------------+--------+------------+-------------+
| nome             | preco  | quantidade | desconto_40 |
+------------------+--------+------------+-------------+
| Calça Jeans      |  89.90 |          1 |      53.940 |
| Tênis Esportivo  | 199.90 |          1 |     119.940 |
| Jaqueta de Couro | 249.90 |          2 |     149.940 |
+------------------+--------+------------+-------------+
*/