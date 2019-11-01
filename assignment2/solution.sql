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
name, moviecount
FROM
(SELECT genreid, name FROM genres) t1 
INNER JOIN
(SELECT genreid, COUNT(*) AS moviecount FROM hasagenre GROUP BY genreid) t2
ON t1.genreid = t2.genreid;







-- get's avg rating for each movie
SELECT movieid, AVG(rating) AS avgrating 
FROM ratings 
GROUP BY movieid;


-- testing: gets average of all ratings
SELECT AVG(avgrating) AS rating
FROM (SELECT movieid, AVG(rating) AS avgrating FROM ratings GROUP BY movieid) t1



-- testing: gets average of all ratings
SELECT AVG(avgrating) AS rating
FROM (SELECT movieid, AVG(rating) AS avgrating FROM ratings GROUP BY movieid) t1



-- testing
SELECT *
FROM hasagenre, (SELECT movieid, AVG(rating) AS avgrating FROM ratings GROUP BY movieid) t1
WHERE hasagenre.movieid = t1.movieid;


-- testing
SELECT 
*
FROM
(SELECT movieid, genreid FROM hasagenre) t1 
INNER JOIN
(SELECT movieid, AVG(rating) AS avgrating FROM ratings GROUP BY movieid) t2
ON t1.movieid = t2.movieid;






SELECT *
FROM (((SELECT genreid, movieid FROM hasagenre) t1
	INNER JOIN 
	(SELECT genreid, name FROM genres) t2
	ON t1.genreid = t2.genreid)
	INNER JOIN 
	(SELECT movieid, AVG(rating) AS avgrating FROM ratings GROUP BY movieid) t3
	ON t1.movieid = t3.movieid);




