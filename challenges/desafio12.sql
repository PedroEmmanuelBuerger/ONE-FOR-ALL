SELECT
    a.name AS "artista",
CASE 
        WHEN COUNT(f.music_id) >= 5 THEN "A"
        WHEN COUNT(f.music_id) >= 3 AND COUNT(f.music_id) <= 4 THEN "B"
        WHEN COUNT(f.music_id) >= 1 AND COUNT(f.music_id) <= 2 THEN "C"
        ELSE "-"
END AS 'ranking'
FROM 
  SpotifyClone.artist AS a
  INNER JOIN SpotifyClone.albuns AS al ON al.artist_id = a.artist_id
  INNER JOIN SpotifyClone.musics AS m ON m.album_id = al.album_id
  LEFT JOIN SpotifyClone.favorite_songs AS f ON f.music_id = m.music_id
GROUP BY a.name
ORDER BY 
   COUNT(f.music_id)DESC, a.name ASC;