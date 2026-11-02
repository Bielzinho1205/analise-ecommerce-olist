
-- Projeto: Análise de E-commerce Olist
-- Consulta: Ticket médio por estado
-- Ferramenta: Google BigQuery
-- Objetivo: Comparar o valor médio dos pedidos por estado,
-- separando o valor dos produtos e o valor do frete.

WITH valor_por_pedido AS (
  SELECT
    order_id,
    SUM(price) AS valor_produtos,
    SUM(freight_value) AS valor_frete
  FROM `electric-wave-468401-u8.olist.order_items`
  GROUP BY order_id
)

SELECT
  c.customer_state AS estado,
  COUNT(*) AS quantidade_pedidos,
  ROUND(AVG(v.valor_produtos), 2) AS ticket_produtos,
  ROUND(AVG(v.valor_frete), 2) AS frete_medio,
  ROUND(AVG(v.valor_produtos + v.valor_frete), 2)
    AS ticket_medio_com_frete
FROM `electric-wave-468401-u8.olist.orders` AS o
JOIN valor_por_pedido AS v
  ON o.order_id = v.order_id
JOIN `electric-wave-468401-u8.olist.customers` AS c
  ON o.customer_id = c.customer_id
WHERE o.order_status <> 'canceled'
GROUP BY c.customer_state
ORDER BY ticket_medio_com_frete DESC;
