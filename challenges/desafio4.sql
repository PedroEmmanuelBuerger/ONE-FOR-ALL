SELECT p.name AS "pessoa_usuaria",
IF(max(YEAR(H.date_reproduction)) >=2021,"Ativa","Inativa") AS "status_pessoa_usuaria" FROM SpotifyClone.user AS p
INNER JOIN SpotifyClone.history AS H ON H.user_id = p.user_id
GROUP BY p.name
ORDER BY p.name;