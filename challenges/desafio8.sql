SELECT a.name AS 'artista',
	al.name AS 'album'
	FROM SpotifyClone.artist as a
	INNER JOIN SpotifyClone.albuns AS al ON al.artist_id = a.artist_id
	WHERE a.name = 'Elis Regina';