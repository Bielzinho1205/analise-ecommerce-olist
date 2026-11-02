
-- Projeto: Análise de E-commerce Olist
-- Consulta: Vendas por categoria de produto
-- Ferramenta: Google BigQuery
-- Objetivo: Identificar as categorias com maior receita,
-- quantidade de pedidos, itens vendidos e preço médio.

WITH vendas_por_item AS (
  SELECT
    oi.order_id,
    oi.order_item_id,
    oi.product_id,
    oi.price,
    COALESCE(
      ct.string_field_1,
      p.product_category_name,
      'Sem categoria'
    ) AS categoria
  FROM `electric-wave-468401-u8.olist.order_items` AS oi
  JOIN `electric-wave-468401-u8.olist.orders` AS o
    ON oi.order_id = o.order_id
  JOIN `electric-wave-468401-u8.olist.products` AS p
    ON oi.product_id = p.product_id
  LEFT JOIN `electric-wave-468401-u8.olist.category_translation` AS ct
    ON p.product_category_name = ct.string_field_0
  WHERE o.order_status <> 'canceled'
)

SELECT
  categoria,
  COUNT(DISTINCT order_id) AS quantidade_pedidos,
  COUNT(*) AS quantidade_itens,
  ROUND(SUM(price), 2) AS valor_vendido_produtos,
  ROUND(AVG(price), 2) AS preco_medio_item
FROM vendas_por_item
GROUP BY categoria
ORDER BY valor_vendido_produtos DESC
LIMIT 10;
