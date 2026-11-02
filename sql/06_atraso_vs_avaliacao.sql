WITH notas_por_pedido AS (
  SELECT
    order_id,
    AVG(review_score) AS nota_media
  FROM `electric-wave-468401-u8.olist.order_reviews`
  GROUP BY order_id
),

pedidos_avaliados AS (
  SELECT
    o.order_id,
    n.nota_media,
    CASE
      WHEN o.order_delivered_customer_date >
           o.order_estimated_delivery_date
        THEN 'Atrasado'
      ELSE 'No prazo ou antecipado'
    END AS situacao_entrega
  FROM `electric-wave-468401-u8.olist.orders` AS o
  JOIN notas_por_pedido AS n
    ON o.order_id = n.order_id
  WHERE o.order_status = 'delivered'
    AND o.order_delivered_customer_date IS NOT NULL
    AND o.order_estimated_delivery_date IS NOT NULL
)

SELECT
  situacao_entrega,
  COUNT(*) AS quantidade_pedidos,
  ROUND(AVG(nota_media), 2) AS nota_media
FROM pedidos_avaliados
GROUP BY situacao_entrega
ORDER BY nota_media;
