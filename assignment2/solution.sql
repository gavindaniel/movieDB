-- query1
CREATE TABLE query1 AS
SELECT 
name, moviecount
FROM
(SELECT genreid, name FROM genres) t1 
INNER JOIN
(SELECT genreid, COUNT(*) AS moviecount FROM hasagenre GROUP BY genreid) t2
ON t1.genreid = t2.genreid;



-- query2
CREATE TABLE query2 AS
SELECT 
name, AVG(rating) as rating 
FROM
((SELECT movieid, genreid FROM hasagenre) t1 
INNER JOIN
(SELECT movieid, rating FROM ratings) t2
ON t1.movieid = t2.movieid
INNER JOIN
(SELECT genreid, name FROM genres) t4
ON t1.genreid = t4.genreid)
GROUP BY t4.name;



-- query3
CREATE TABLE query3 AS
SELECT 
title, countofratings
FROM 
((SELECT movieid, COUNT(rating) as countofratings FROM ratings GROUP BY movieid) t1
INNER JOIN
(SELECT movieid, title FROM movies) t2
ON t1.movieid = t2.movieid)
WHERE t1.countofratings >= 10;



-- query4
CREATE TABLE query4 AS
SELECT
t1.movieid, title
FROM
((SELECT movieid, title FROM movies) t1
INNER JOIN
(SELECT movieid, genreid FROM hasagenre) t2
ON t1.movieid = t2.movieid)
WHERE t2.genreid = 5;


-- query5
CREATE TABLE query5 AS
SELECT
title, average
FROM
((SELECT movieid, AVG(rating) AS average FROM ratings GROUP BY movieid) t1
INNER JOIN 
(SELECT movieid, title FROM movies) t2
ON t1.movieid = t2.movieid);


-- query6
CREATE TABLE query6 AS










