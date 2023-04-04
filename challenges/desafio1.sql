DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

CREATE TABLE SpotifyClone.artist(
	artist_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
)engine = InnoDB;

CREATE TABLE SpotifyClone.plans(
	plans_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    value DECIMAL(4, 2) NOT NULL
)engine = InnoDB;

CREATE TABLE SpotifyClone.user (
	user_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    years INT NOT NULL,
	plans_id INT NOT NULL,
	assignature_Date DATE NOT NULL,
    FOREIGN KEY (plans_id) REFERENCES SpotifyClone.plans(plans_id)
)engine = InnoDB;

CREATE TABLE SpotifyClone.albuns (
	album_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    released_Year YEAR,
    artist_id INT NOT NULL,
	FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artist(artist_id)
)engine = InnoDB;

CREATE TABLE SpotifyClone.user_artist (
	user_id INT NOT NULL,
    artist_id INT NOT NULL,
    CONSTRAINT PRIMARY KEY(user_id, artist_id),
    FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artist(artist_id),
    FOREIGN KEY (user_id) REFERENCES SpotifyClone.user(user_id)
)engine = InnoDB;

CREATE TABLE SpotifyClone.musics (
	music_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    duration INT NOT NULL,
    album_id INT NOT NULL,
    FOREIGN KEY (album_id) REFERENCES SpotifyClone.albuns(album_id)
)engine = InnoDB;

CREATE TABLE SpotifyClone.history (
	user_id INT NOT NULL,
    music_id INT NOT NULL,
    date_reproduction DATETIME NOT NULL,
    CONSTRAINT PRIMARY KEY(user_id, music_id),
    FOREIGN KEY (music_id) REFERENCES SpotifyClone.musics(music_id),
	FOREIGN KEY (user_id) REFERENCES SpotifyClone.user(user_id)
)engine = InnoDB;

INSERT INTO SpotifyClone.plans (name, value) VALUES 
('free', 0),
('family', 7.99),
('university', 5.99),
('personal', 6.99);

INSERT INTO SpotifyClone.user (name, years, plans_id, assignature_Date) VALUES
('Barbara Liskov', 82, 1, '2019-10-20'),
('Robert Cecil Martin', 58, 1, '2017-01-06'),
('Ada Lovelace', 37, 2, '2017-12-30'),
('Martin Fowler', 46, 2, '2017-01-17'),
('Sandi Metz', 58, 2, '2018-04-29'),
('Paulo Freire', 19, 3, '2018-02-14'),
('Bell Hooks', 26, 3, '2018-01-05'),
('Christopher Alexander', 85, 4, '2019-06-05'),
('Judith Butler', 45, 4, '2020-05-13'),
('Jorge Amado', 58, 4, '2017-02-17');

INSERT INTO SpotifyClone.artist (name) VALUES
('Beyoncé'),
('Queen'),
('Elis Regina'),
('Baco Exu do Blues'),
('Blind Guardian'),
('Nina Simone');

INSERT INTO SpotifyClone.albuns (name, released_Year, artist_id) VALUES
('Renaissance', '2022', 1),
('Jazz', '1978', 2),
('Hot Space', '1982', 2),
('Falso Brilhante', '1998', 3),
('Vento de Maio', '2001', 3),
('QVVJFA?', '2003', 4),
('Somewhere Far Beyond', '2007', 5),
('I Put A Spell On You', '2012', 6);


INSERT INTO SpotifyClone.user_artist (user_id, artist_id) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 3),
(3, 2),
(4, 4),
(5, 5),
(5, 6),
(6, 6),
(7, 1),
(9, 6),
(10, 3),
(10, 2);

INSERT INTO SpotifyClone.musics (title,duration, album_id) VALUES
('BREAK MY SOUL', 279,1),
('VIRGO''S GROOVE', 369,1),
('ALIEN SUPERSTAR', 116,1),
('Don''t Stop Me Now', 203,2),
('Under Pressure', 152,3),
('Como Nossos Pais', 105,4),
('O Medo de Amar é o Medo de Ser Livre', 207,5),
('Samba em Paris', 267,6),
('The Bard''s Song', 244,7),
('Feeling Good', 100,8);

INSERT INTO SpotifyClone.history (user_id, music_id, date_reproduction) VALUES 
(1, 8, '2022-02-28 10:45:55'),
(1, 2, '2020-05-02 05:30:35'),
(1, 10, '2020-03-06 11:22:33'),
(2, 10, '2022-08-05 08:05:17'),
(2, 7, '2020-01-02 07:40:33'),
(3,10, '2020-11-13 16:55:13'),
(3, 2, '2020-12-05 18:38:30'),
(4, 8, '2021-08-15 17:10:10'),
(5, 8, '2022-01-09 01:44:33'),
(5, 5, '2020-08-06 15:23:43'),
(6, 7, '2017-01-24 00:31:17'),
(6, 1, '2017-10-12 12:35:20'),
(7, 4, '2011-12-15 22:30:49'),
(8, 4, '2012-03-17 14:56:41'),
(9, 9, '2022-02-24 21:14:22'),
(10, 3, '2015-12-13 08:30:22');
