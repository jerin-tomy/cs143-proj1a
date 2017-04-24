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
      HAVING count(*)>1) as actors_in_multiple_movies;

-- Title of movies that sell more than 1,000,000 tickets
SELECT title
FROM Movie
WHERE id IN (SELECT mid
             FROM Sales
             WHERE ticketsSold>1000000);


-- Two of our own Queries

-- List Directors and their total income from all their movies from highest to lowest incomes.
SELECT concat(d.first, ' ', d.last) as Name, sum(s.totalIncome) as Total_Income
FROM Director as d, MovieDirector as md, Sales as s
WHERE d.id = md.did
    and md.mid = s.mid
GROUP BY d.id
ORDER BY Total_Income desc;

-- List Actors and their average IMDB ratings based on the ratings from all of their movies if the value is greater than 90.
SELECT concat(a.first, ' ', a.last) as Name, avg(mr.imdb) as Avg_IMDB
FROM Actor as a, MovieActor as ma, MovieRating as mr
WHERE a.id = ma.aid
    and ma.mid = mr.mid
GROUP BY a.id
HAVING Avg_IMDB > 90;







