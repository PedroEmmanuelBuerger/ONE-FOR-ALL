SELECT 
COUNT(h.user_id) AS 'musicas_no_historico'
FROM SpotifyClone.history AS h
INNER JOIN SpotifyClone.user AS u ON u.user_id = h.user_id
WHERE u.name = 'Barbara Liskov';