SELECT 
MIN(VALUE) AS 'faturamento_minimo',
MAX(VALUE) AS 'faturamento_maximo',
ROUND(AVG(VALUE), 2) AS 'faturamento_medio',
ROUND(SUM(VALUE), 2) AS 'faturamento_total'
FROM SpotifyClone.plans as P
INNER JOIN SpotifyClone.user AS u ON u.plans_id = P.plans_id
;