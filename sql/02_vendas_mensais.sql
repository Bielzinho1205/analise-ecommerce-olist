
-- Projeto: Análise de E-commerce Olist
-- Consulta: Vendas mensais
-- Ferramenta: Google BigQuery
-- Objetivo: Analisar a evolução mensal dos pedidos,
-- receita de produtos e valores de frete.

WITH valor_por_pedido AS (
  SELECT
    order_id,
    SUM(price) AS valor_produtos,
    SUM(freight_value) AS valor_frete
  FROM `electric-wave-468401-u8.olist.order_items`
  GROUP BY order_id
),

pedidos_por_mes AS (
  SELECT
    DATE_TRUNC(DATE(o.order_purchase_timestamp), MONTH) AS mes,
    o.order_id,
    v.valor_produtos,
    v.valor_frete
  FROM `electric-wave-468401-u8.olist.orders` AS o
  JOIN valor_por_pedido AS v
    ON o.order_id = v.order_id
  WHERE o.order_status <> 'canceled'
)

SELECT
  mes,
  COUNT(DISTINCT order_id) AS quantidade_pedidos,
  ROUND(SUM(valor_produtos), 2) AS receita_produtos,
  ROUND(SUM(valor_frete), 2) AS valor_frete,
  ROUND(SUM(valor_produtos + valor_frete), 2) AS valor_total_com_frete
FROM pedidos_por_mes
GROUP BY mes
ORDER BY mes;
