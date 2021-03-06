/*
SUM and COUNT Tutorial
SUM, COUNT, MAX, DISTINCT, ORDER BY, AVG, HAVING
*/

/*
1. Total World Population
*/
SELECT SUM(population)
FROM world
/*
2. List of Continents
*/
SELECT DISTINCT(continent)
FROM world
/*
3. GDP of Africa
*/
SELECT SUM(gdp)
FROM world
WHERE continent = 'Africa'
/*
4. Counting the Big Countries
How many countries have an area of at least 1000000
*/
SELECT COUNT(name)
FROM world
WHERE area > 1000000
/*
5. Baltic States Population
What is the total population of ('Estonia', 'Latvia', 'Lithuania')
*/
SELECT SUM(population)
FROM world
WHERE name IN ('Estonia', 'Latvia', 'Lithuania')
/*
6. Counting the countries of each continent
For each continent show the continent and number of countries.
*/
SELECT continent, COUNT(name)
FROM world
GROUP BY continent
/*
7. Counting Big Countries in each Continent
For each continent show the continent and number of countries with populations of at least 10 million
*/
SELECT continent, COUNT(name)
FROM world
WHERE population > 10000000
GROUP BY continent
/*
8. Counting Big Countries
List the continents that have a total population of at least 100 million.
*/
SELECT continent
FROM world
GROUP BY continent
HAVING SUM(population)>100000000