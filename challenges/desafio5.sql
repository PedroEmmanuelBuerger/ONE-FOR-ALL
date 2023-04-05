SELECT
m.title AS "cancao",
COUNT(h.music_id) AS "reproducoes"
FROM SpotifyClone.musics AS m
INNER JOIN SpotifyClone.history as h ON h.music_id = m.music_id
GROUP BY cancao
ORDER BY reproducoes DESC, cancao ASC
LIMIT 2;