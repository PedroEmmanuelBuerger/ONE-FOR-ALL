SELECT
  COUNT(m.music_id) AS "cancoes",
  COUNT(a.artist_id) AS "artistas",
  COUNT(al.album_id) AS "albuns"
FROM SpotifyClone.musics m
JOIN SpotifyClone.albuns al ON m.album_id = al.album_id
JOIN SpotifyClone.artist a ON al.artist_id = a.artist_id;
