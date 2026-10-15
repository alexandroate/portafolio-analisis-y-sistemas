-- ¿Cuánto ha vendido la empresa en total y cuál es el promedio por artículo?
SELECT
	COUNT(DISTINCT order_id) AS total_pedidos_unicos,
	COUNT(order_item_id) AS total_articulos_vendidos,
	ROUND(SUM(price), 2) AS facturacion_total_bruta,
	ROUND(AVG(price), 2) AS precio_promedio_articulo,
	ROUND(SUM(freight_value), 2) AS costo_total_fletes
FROM detalles_pedido;
	
-- ¿Dónde están concentrados los clientes de la plataforma?
SELECT
	c.customer_state AS estado,
	COUNT(DISTINCT p.order_id) AS total_pedidos,
	ROUND(SUM(d.price), 2) AS total_ventas
FROM pedidos p
JOIN clientes c ON p.customer_id = c.customer_id
JOIN detalles_pedido d ON p.order_id = d.order_id
GROUP BY c.customer_state
ORDER BY total_ventas DESC
LIMIT 5;

-- ¿Qué % de pedidos se entrega con éxito vs cancelafos o con problemas?
SELECT
	order_status AS estado_pedido,
	COUNT(*) AS cantidad_pedidos,
	ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM pedidos), 2) AS porcentaje
FROM pedidos
GROUP BY order_status
ORDER BY cantidad_pedidos DESC;

