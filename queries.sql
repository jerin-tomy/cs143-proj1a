-- queries.sql


-- Three SELECT statements from Project 1A Spec

-- Names of all the actors in the movie 'Die Another Day'
SELECT concat(first, ' ', last)
FROM Actor
WHERE id IN (SELECT aid
             FROM MovieActor
             WHERE mid IN (SELECT id
                           FROM Movie
                           WHERE title='Die Another Day'));

-- Count of all the actors who acted in multiple movies
SELECT COUNT(*)
FROM (SELECT aid
      FROM MovieActor
      GROUP BY mid
      HAVING count(*)>1);

-- Title of movies that sell more than 1,000,000 tickets
SELECT title
FROM Movie
WHERE id IN (SELECT mid
             FROM Sales
             WHERE ticketsSold>1000000);


-- Two of our own Queries



