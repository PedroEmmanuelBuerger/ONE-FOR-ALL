SELECT
al.name AS 'album',
COUNT(f.music_id) AS 'favoritadas'
FROM SpotifyClone.musics AS m
INNER JOIN SpotifyClone.albuns AS al ON m.album_id = al.album_id
INNER JOIN SpotifyClone.favorite_songs AS f ON f.music_id = m.music_id
GROUP BY al.name
ORDER BY favoritadas DESC
LIMIT 3;