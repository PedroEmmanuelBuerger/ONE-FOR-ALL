   SELECT 
CASE
		WHEN u.years <= 30 THEN "Até 30 anos"
        WHEN u.years > 31 AND u.years <= 60 THEN "Entre 31 e 60 anos"
        WHEN u.years > 60 THEN "Maior de 60 anos"
END AS 'faixa_etaria',
COUNT(DISTINCT u.user_id) AS total_pessoas_usuarias,
COUNT(f.user_id) AS 'total_favoritadas'
FROM SpotifyClone.user AS u
LEFT JOIN SpotifyClone.favorite_songs AS f ON u.user_id = f.user_id
GROUP BY faixa_etaria;