-- create.sql

CREATE TABLE Movie (
	id int,
	title varchar(1000),
	year int,
	rating varchar(10),
	company varchar(50),

	PRIMARY KEY(id), -- every movie has a unique ID
	CHECK(id>0), -- unique ID numbers should not be zero
	CHECK(title IS NOT NULL) -- every movie must have a title

)ENGINE = INNODB;


CREATE TABLE Actor (
	id int,
	last varchar(20),
	first varchar(20),
	sex varchar(6),
	dob DATE,
	dod DATE,

	PRIMARY KEY(id), -- every actor has a unique ID
	CHECK(id>0), -- unique ID numbers should not be zero
	CHECK(dob IS NOT NULL), -- every actor must have a date of birth
	CHECK(first IS NOT NULL) -- every actor must have a first name

)ENGINE = INNODB;


CREATE TABLE Sales (
	mid int,
	ticketsSold int,
	totalIncome int,

	FOREIGN KEY(mid) REFERENCES Movie(id) -- mid is a reference to id in the Movie table

)ENGINE = INNODB;


CREATE TABLE Director (
	id int,
	last varchar(20),
	first varchar(20),
	dob DATE,
	dod DATE,

	PRIMARY KEY(id),  -- every director has a unique ID
	CHECK(id>0), -- unique ID numbers should not be zero
	CHECK(dob IS NOT NULL), -- every director must have a date of birth
	CHECK(first IS NOT NULL) -- every director must have a first name

)ENGINE = INNODB;


CREATE TABLE MovieGenre (
	mid int,
	genre varchar(20),

	FOREIGN KEY(mid) REFERENCES Movie(id) -- mid is a reference to id in the Movie table

)ENGINE = INNODB;

CREATE TABLE MovieDirector (
	mid int,
	did int,

	FOREIGN KEY(mid) REFERENCES Movie(id), -- mid is a reference to id in the Movie table
	FOREIGN KEY(did) REFERENCES Director(id) -- did is a reference to id in the Director table
)ENGINE = INNODB;


CREATE TABLE MovieActor (
	mid int,
	aid int,
	role varchar(50),

	FOREIGN KEY(mid) REFERENCES Movie(id), -- mid is a reference to id in the Movie table
	FOREIGN KEY(aid) REFERENCES Actor(id) -- aid is a reference to id in the Actor table

)ENGINE = INNODB;


CREATE TABLE MovieRating (
	mid int,
	imdb int,
	rot int,

	FOREIGN KEY(mid) REFERENCES Movie(id) -- mid is a reference to id in the Movie table

)ENGINE = INNODB;


CREATE TABLE Review (
	name varchar(20),
	time TIMESTAMP,
	mid int,
	rating int,
	comment varchar(500),

	FOREIGN KEY(mid) REFERENCES Movie(id) -- mid is a reference to id in the Movie table

)ENGINE = INNODB;


CREATE TABLE MaxPersonID(
	id int
)ENGINE = INNODB;


CREATE TABLE MaxMovieID(
	id int
)ENGINE = INNODB;



