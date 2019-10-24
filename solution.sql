CREATE TABLE users (
	userid int,
	name varchar(255),
	PRIMARY KEY (userid)
);

CREATE TABLE movies (
	movieid int,
	title varchar(255),
	PRIMARY KEY (movieid) 
);

CREATE TABLE taginfo (
	tagid int,
	content varchar(255),
	PRIMARY KEY (tagid)
);

CREATE TABLE genres (
	genreid int,
	name varchar(255),
	PRIMARY KEY (genreid) 
);

CREATE TABLE ratings (
	userid int NOT NULL,
	movieid int NOT NULL,
	rating numeric(3,2),
	timestamp bigint,
	FOREIGN KEY (userid) REFERENCES users(userid) ON DELETE CASCADE,
	FOREIGN KEY (movieid) REFERENCES movies(movieid) ON DELETE CASCADE,
	CHECK (rating>=0 AND rating<= 5)	
);

CREATE TABLE tags (
	userid int NOT NULL,
	movieid int NOT NULL,
	tagid int NOT NULL,
	timestamp bigint,
	FOREIGN KEY (userid) REFERENCES users(userid) ON DELETE CASCADE,
	FOREIGN KEY (movieid) REFERENCES movies(movieid) ON DELETE CASCADE,
	FOREIGN KEY (tagid) REFERENCES taginfo(tagid) ON DELETE CASCADE 
);

CREATE TABLE hasagenre (
	movieid int NOT NULL,
	genreid int NOT NULL,
	FOREIGN KEY (movieid) REFERENCES movies(movieid) ON DELETE CASCADE,
	FOREIGN KEY (genreid) REFERENCES genres(genreid) ON DELETE CASCADE
);