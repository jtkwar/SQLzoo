/*
More JOIN operations
Movie, Actor, Casting
*/

/*
1. 1962 Movies
*/
SELECT id, title
FROM movie
WHERE yr=1962

/*
2. When was Citizen Kane released?
*/
select yr
FROM movie
WHERE title = 'Citizen Kane'

/*
3. Star Trek Movies
*/
SELECT id, title, yr
FROM movie
WHERE title LIKE 'Star Trek%'
ORDER BY yr

/*
4. id for Glenn Close
*/
SELECT id
FROM actor
WHERE name = 'Glenn Close'

/*
5. id for Casablanca
*/
select id
FROM movie
WHERE title = 'Casablanca'

/*
6. Cast List for Casablanca
*/
SELECT name FROM casting JOIN actor
ON casting.actorid=actor.id
WHERE casting.movieid=11768

/*
7. Alien Cast LIST
*/
SELECT name FROM
casting JOIN movie ON movie.id=movieid
JOIN actor ON actorid=actor.id
WHERE movie.title='Alien'

/*
8. Harrison Ford Movies
*/
SELECT title FROM
movie JOIN casting ON movie.id=movieid
JOIN actor ON actorid=actor.id
WHERE actor.name='Harrison Ford'

/*
9. Harrison Ford as a Supporting Actor
*/
SELECT title FROM
movie JOIN casting ON movie.id=movieid
JOIN actor ON actorid=actor.id
WHERE actor.name='Harrison Ford' AND casting.ord!=1

/*
10. Lead Actors in 1962 Movies
*/
SELECT title, actor.name FROM
movie JOIN casting ON movie.id=movieid
JOIN actor ON actorid=actor.id
WHERE movie.yr=1962 and casting.ord=1

/*
11. Busy Years for Rock Hudson
Which were the busiest years for 'Rock Hudson', show the year and the number of movies 
he made each year for any year in which he made more than 2 movies.
*/
SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2

/*
12. Lead Actor in Julie Andrews
*/
SELECT title, name FROM movie
JOIN casting x ON movie.id = movieid
JOIN actor ON actor.id =actorid
WHERE ord=1 AND movieid IN
(SELECT movieid FROM casting y
JOIN actor ON actor.id=actorid
WHERE name='Julie Andrews')

/*
13. Actors with 15 leading roles
Obtain a list, in alphabetical order, of actors who've had at least 15 starring roles.
*/
SELECT name
FROM actor
JOIN casting ON (id = actorid AND (SELECT COUNT(ord) FROM casting WHERE actorid = actor.id AND ord=1)>=15)
GROUP BY name

/*
14. List the films released in the year 1978 ordered by the number of actors in the cast, 
then by title.
*/
SELECT title, COUNT(actorid) FROM casting
  JOIN movie ON movieid = movie.id
  WHERE yr = 1978
  GROUP BY movieid, title
  ORDER BY COUNT(actorid) DESC

/*
15. List all people who have worked with 'Art Garfunkel'
*/
SELECT DISTINCT name FROM casting
  JOIN actor ON actorid = actor.id
  WHERE name != 'Art Garfunkel'
	AND movieid IN (
		SELECT movieid
		FROM movie
		JOIN casting ON movieid = movie.id
		JOIN actor ON actorid = actor.id
		WHERE actor.name = 'Art Garfunkel'
)


