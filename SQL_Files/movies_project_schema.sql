-- Movies Project database schema



DROP TABLE movies CASCADE;
CREATE TABLE movies (
	movie_id INTEGER  NOT NULL,
	name	VARCHAR,
	year	INTEGER,
	PRIMARY KEY (movie_id));
	

DROP TABLE movies_metadata CASCADE;	
CREATE TABLE movies_metadata (
	id INTEGER NOT NULL,
	release_date DATE,
	runtime	INTEGER,
	PRIMARY KEY (id));
	

DROP TABLE genres CASCADE;
CREATE TABLE genres (
	genre_id INTEGER NOT NULL,
	genre_name VARCHAR,
	PRIMARY KEY (genre_id));



DROP TABLE movie_genre CASCADE;
CREATE TABLE movie_genre (
	mg_id INTEGER NOT NULL,
	movie_id INTEGER,
	genre_id INTEGER,
	PRIMARY KEY (mg_id),
	FOREIGN KEY (movie_id) REFERENCES movies (movie_id),
	FOREIGN KEY (genre_id) REFERENCES genres (genre_id));





DROP TABLE ratings CASCADE;
CREATE TABLE ratings (
	movie_id INTEGER NOT NULL,
	user_id INTEGER,
	rating REAL,
	PRIMARY KEY (movie_id,user_id),
	FOREIGN KEY (movie_id) REFERENCES movies (movie_id));
	


--  DROP TABLE crew CASCADE;
-- CREATE TABLE crew (
-- 	movie_id INTEGER NOT NULL,
--	job VARCHAR,
--	GENDER INTEGER,
--	PRIMARY KEY (movie_id),
--	FOREIGN KEY (movie_id) REFERENCES movie (movie_id));
	
-- CREATE TABLE cast (
-- 	id INTEGER PRIMARY KEY NOT NULL,
-- 	name TEXT,
-- 	order INTEGER,
-- 	gender INTEGER);
	

select count(*) from movies;
select count(*) from genres;
select count(*) from movie_genre;
select count(*) from ratings;


-- Query 

SELECT r.movie_id, r.user_id, r.rating, 
m.name, m.year,
mg.mg_id, mg.genre_id,
g.genre_name
FROM ratings r INNER JOIN movies m
ON r.movie_id = m.movie_id
INNER JOIN movie_genre mg
ON m.movie_id = mg.movie_id
INNER JOIN genres g
ON mg.genre_id = g.genre_id


-- Create sample (mock)data

INSERT INTO genres (genre_id, genre_name) VALUES (1,'Adventure');
INSERT INTO genres (genre_id, genre_name) VALUES (2,'Action');
INSERT INTO genres (genre_id, genre_name) VALUES (3,'Animation');
INSERT INTO genres (genre_id, genre_name) VALUES (4,'Children');
INSERT INTO genres (genre_id, genre_name) VALUES (5,'Comedy');
INSERT INTO genres (genre_id, genre_name) VALUES (6,'Crime');
INSERT INTO genres (genre_id, genre_name) VALUES (7,'Documentary');
INSERT INTO genres (genre_id, genre_name) VALUES (8,'Drama');
INSERT INTO genres (genre_id, genre_name) VALUES (9,'Fantasy');
INSERT INTO genres (genre_id, genre_name) VALUES (10,'Film-Noir');
INSERT INTO genres (genre_id, genre_name) VALUES (11,'Horror');
INSERT INTO genres (genre_id, genre_name) VALUES (12,'IMAX');
INSERT INTO genres (genre_id, genre_name) VALUES (13,'Musical');
INSERT INTO genres (genre_id, genre_name) VALUES (14,'Mystery');
INSERT INTO genres (genre_id, genre_name) VALUES (15,'Romance');
INSERT INTO genres (genre_id, genre_name) VALUES (16,'Si-Fi');
INSERT INTO genres (genre_id, genre_name) VALUES (17,'Thriller');
INSERT INTO genres (genre_id, genre_name) VALUES (18,'War');
INSERT INTO genres (genre_id, genre_name) VALUES (19,'Western');
INSERT INTO genres (genre_id, genre_name) VALUES (20,'No Listed Genre');


INSERT INTO movies (movie_id, name,year) VALUES (1,'Toy Story',1995);
INSERT INTO movies (movie_id, name,year) VALUES (2,'Jumanji',1995);


INSERT INTO movies_metadata (id, release_date, runtime) VALUES (862,'10/30/1995',81);
INSERT INTO movies_metadata (id, release_date, runtime) VALUES (8844,'12/15/1995', 104);	
// id is tmdb id 

INSERT INTO movie_genre (mg_id, movie_id, genre_id) VALUES (1,1,1); 
INSERT INTO movie_genre (mg_id, movie_id, genre_id) VALUES (2,1,3);
INSERT INTO movie_genre (mg_id, movie_id, genre_id) VALUES (3,1,4);
INSERT INTO movie_genre (mg_id, movie_id, genre_id) VALUES (4,1,5);
INSERT INTO movie_genre (mg_id, movie_id, genre_id) VALUES (5,1,9);
INSERT INTO movie_genre (mg_id, movie_id, genre_id) VALUES (6,2,1);
INSERT INTO movie_genre (mg_id, movie_id, genre_id) VALUES (7,2,9);


INSERT INTO ratings (movie_id, user_id,rating) VALUES (1,4,4);
INSERT INTO ratings (movie_id, user_id,rating) VALUES (1,10,5);
INSERT INTO ratings (movie_id, user_id,rating) VALUES (1,14,4.5);
INSERT INTO ratings (movie_id, user_id,rating) VALUES (1,15,4);
INSERT INTO ratings (movie_id, user_id,rating) VALUES (1,22,4);
INSERT INTO ratings (movie_id, user_id,rating) VALUES (2,4,4);
INSERT INTO ratings (movie_id, user_id,rating) VALUES (2,14,4);
INSERT INTO ratings (movie_id, user_id,rating) VALUES (2,39,3.5);
INSERT INTO ratings (movie_id, user_id,rating) VALUES (2,42,3);

