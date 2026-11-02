```sql
-- Projeto: Análise de E-commerce Olist
-- Consulta: Atrasos por estado
-- Ferramenta: Google BigQuery (SQL)
-- Objetivo: Comparar a quantidade e o percentual de pedidos
-- entregues com atraso entre os estados brasileiros.
-- Critério: Considera estados com pelo menos 100 pedidos entregues.

SELECT
  c.customer_state AS estado,
  COUNT(*) AS pedidos_entregues,
  COUNTIF(
    o.order_delivered_customer_date >
    o.order_estimated_delivery_date
  ) AS pedidos_atrasados,
  ROUND(
    100.0 * COUNTIF(
      o.order_delivered_customer_date >
      o.order_estimated_delivery_date
    ) / COUNT(*),
    2
  ) AS percentual_atrasados
FROM `electric-wave-468401-u8.olist.orders` AS o
JOIN `electric-wave-468401-u8.olist.customers` AS c
  ON o.customer_id = c.customer_id
WHERE o.order_status = 'delivered'
  AND o.order_delivered_customer_date IS NOT NULL
  AND o.order_estimated_delivery_date IS NOT NULL
GROUP BY c.customer_state
HAVING COUNT(*) >= 100
ORDER BY percentual_atrasados DESC;
```
