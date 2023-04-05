SELECT
a.name AS 'artista',
al.name AS 'album',
COUNT(ua.artist_id) AS 'pessoas_seguidoras'
FROM SpotifyClone.artist as a 
INNER JOIN SpotifyClone.albuns AS al ON al.artist_id = a.artist_id
INNER JOIN SpotifyClone.user_artist AS ua ON ua.artist_id = a.artist_id
GROUP BY a.name, al.name
ORDER BY pessoas_seguidoras DESC, artista ASC, album ASC;