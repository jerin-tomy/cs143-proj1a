-- violate.sql

---------------------------
-- Primary Key Constraints
---------------------------

/*
The id of the tuple we are trying to insert into the Movie table 
is not unique. The id matches the existing id of "Enter the Dragon".
*/
INSERT INTO Movie
VALUES(1264, 'Bee Movie', 2007, 'PG', 'Dreamworks Animation');
/*
OUTPUT from MySQL:
ERROR 1062 (23000): Duplicate entry '1264' for key 'PRIMARY'
*/


/*
The id of the tuple we are trying to insert into the Actor table 
is not unique. The id matches the existing id of Jessica Alba.
*/
INSERT INTO Actor
VALUES(647, 'Tomy', 'Jerin', 'Male', 19970223, NULL);
/*
OUTPUT from MySQL:
ERROR 1062 (23000): Duplicate entry '647' for key 'PRIMARY'
*/


/*
The id of the tuple we are trying to insert into the Director table 
is not unique. The id matches the existing id of Arnold Schwarzenegger.
*/
INSERT INTO Director
VALUES(55840,'Wong', 'Matthew', 19970223, NULL);
/*
OUTPUT from MySQL:
ERROR 1062 (23000): Duplicate entry '55840' for key 'PRIMARY'
*/


---------------------------
-- Foreign Key Constraints
---------------------------

/*
The mid of the tuple we are trying to insert into the Sales table 
does not exist in the id column of the Movie table. This tuple is 
not referencing an existing movie in the Movie table.
*/
INSERT INTO Sales
VALUES(9999999, 0, 0);
/*
OUTPUT from MySQL:
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails 
(`CS143`.`Sales`, CONSTRAINT `Sales_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `Movie` (`id`))
*/


/*
The mid of the tuple we are trying to insert into the MovieGenre 
table does not exist in the id column of the Movie table. This 
tuple is not referencing an existing movie in the Movie table.
*/
INSERT INTO MovieGenre
VALUES(9999999, 'Comedy');
/*
OUTPUT from MySQL:
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails 
(`CS143`.`MovieGenre`, CONSTRAINT `MovieGenre_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `Movie` (`id`))
*/


/*
The mid of the tuple we are trying to insert into the MovieDirector 
table does not exist in the id column of the Movie table. While did 
references Arnold Schwarzenegger in the Director table, this 
tuple is not referencing an existing movie in the Movie table.
*/
INSERT INTO MovieDirector
VALUES(9999999, 55480);
/*
OUTPUT from MySQL:
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails 
(`CS143`.`MovieDirector`, CONSTRAINT `MovieDirector_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `Movie` (`id`))
*/


/*
The did of the tuple we are trying to insert into the MovieDirector 
table does not exist in the id column of the Director table. While 
mid references "Enter the Dragon" in the Movie table, this tuple 
is not referencing an existing director in the Director table.
*/
INSERT INTO MovieDirector
VALUES(1264, 9999999);
/*
OUTPUT from MySQL:
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails 
(`CS143`.`MovieDirector`, CONSTRAINT `MovieDirector_ibfk_2` FOREIGN KEY (`did`) REFERENCES `Director` (`id`))
*/


/*
The mid of the tuple we are trying to insert into the MovieActor 
table does not exist in the id column of the Movie table. While 
aid references Jessica Alba in the Actor table, this tuple is 
not referencing an existing movie in the Movie table.
*/
INSERT INTO MovieActor
VALUES(9999999, 647, 'Lead');
/*
OUTPUT from MySQL:
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails 
(`CS143`.`MovieActor`, CONSTRAINT `MovieActor_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `Movie` (`id`))
*/


/*
The aid of the tuple we are trying to insert into the MovieActor 
table does not exist in the id column of the Actor table. While 
mid references "Enter the Dragon" in the Movie table, this tuple 
is not referencing an existing actor in the Actor table.
*/
INSERT INTO MovieActor
VALUES(1264, 9999999, 'Lead');
/*
OUTPUT from MySQL:
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails 
(`CS143`.`MovieActor`, CONSTRAINT `MovieActor_ibfk_2` FOREIGN KEY (`aid`) REFERENCES `Actor` (`id`))
*/


/*
The mid of the tuple we are trying to insert into the MovieRating 
table does not exist in the id column of the Movie table. This 
tuple is not referencing an existing movie in the Movie table.
*/
INSERT INTO MovieRating
VALUES(9999999, 10, 99);
/*
OUTPUT from MySQL:
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails 
(`CS143`.`MovieRating`, CONSTRAINT `MovieRating_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `Movie` (`id`))
*/


/*
The mid of the tuple we are trying to insert into the Review 
table does not exist in the id column of the Movie table. This 
tuple is not referencing an existing movie in the Movie table.
*/
INSERT INTO Review
VALUES('Matthew', '1970-01-01 00:00:01', 9999999, 
	10, 'This is the greatest movie I have ever seen!');
/*
OUTPUT from MySQL:
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails 
(`CS143`.`Review`, CONSTRAINT `Review_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `Movie` (`id`))
*/


---------------------------
-- Check Constaints
---------------------------

/*
The id of the tuple we are trying to insert into the Movie table 
is 0. This would violate the CHECK constraint of id > 0.
*/
INSERT INTO Movie
VALUES(0, 'Bee Movie', 2007, 'PG', 'Dreamworks Animation');


/*
The title of the tuple we are trying to insert into the Movie table 
is NULL. This would violate the CHECK constraint of title IS NOT NULL.
*/
INSERT INTO Movie
VALUES(99999, NULL, 2007, 'PG', 'Dreamworks Animation');


/*
The id of the tuple we are trying to insert into the Actor table 
is 0. This would violate the CHECK constraint of id > 0.
*/
INSERT INTO Actor
VALUES(0, 'Tomy', 'Jerin', 'Male', 19970223, NULL);


/*
The dob of the tuple we are trying to insert into the Actor table 
is NULL.  This would violate the CHECK constraint of dob IS NOT NULL.
*/
INSERT INTO Actor
VALUES(99999, 'Tomy', 'Jerin', 'Male', NULL, NULL);


/*
The first name of the tuple we are trying to insert into the Actor table 
is NULL.  This would violate the CHECK constraint of first IS NOT NULL.
*/
INSERT INTO Actor
VALUES(0, 'Tomy', NULL, 'Male', 19970223, NULL);


/*
The id of the tuple we are trying to insert into the Director table 
is 0. This would violate the CHECK constraint of id > 0.
*/
INSERT INTO Director
VALUES(0,'Wong', 'Matthew', 19970223, NULL);


/*
The dob of the tuple we are trying to insert into the Director table 
is NULL. This would violate the CHECK constraint of dob IS NOT NULL.
*/
INSERT INTO Director
VALUES(99999,'Wong', 'Matthew', NULL, NULL);


/*
The first name of the tuple we are trying to insert into the Director table 
is NULL. This would violate the CHECK constraint of first IS NOT NULL.
*/
INSERT INTO Director
VALUES(99999,'Wong', NULL, 19970223, NULL);






