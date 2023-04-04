SELECT
	U.name AS 'pessoa_usuaria',
    COUNT(h.user_id) AS 'musicas_ouvidas',
    ROUND(SUM(m.duration / 60), 2) AS 'total_minutos'
FROM SpotifyClone.user AS U
INNER JOIN SpotifyClone.history as h ON h.user_id = U.user_id
INNER JOIN SpotifyClone.musics as m ON m.music_id = h.music_id
GROUP BY U.name
ORDER BY U.name;
