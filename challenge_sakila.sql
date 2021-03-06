USE sakila;
SHOW TABLES;
DESCRIBE actor;
DESCRIBE film;
DESCRIBE category;
DESCRIBE staff;

#1-List all actors.
SELECT first_name, last_name 
FROM actor;

#2-Find the surname of the actor with the forename 'John'.
SELECT first_name, last_name 
FROM actor 
WHERE first_name = "Joe";

#3-Find all actors with surname 'Neeson'.
SELECT first_name, last_name 
FROM actor 
WHERE last_name = "Neeson";

#4-Find all actors with ID numbers divisible by 10.
SELECT * FROM actor WHERE ((actor_id) % 10)=0;

#5-What is the description of the movie with an ID of 100?
SELECT film_id, title, description
FROM film 
WHERE film_id = 100;

#6-Find every R-rated movie.
SELECT title, rating
FROM film
WHERE rating ="R";

#7-Find every non-R-rated movie.
SELECT title, rating
FROM film
WHERE rating <> "R";

#8-Find the ten shortest movies.
SELECT title, length 
FROM film 
ORDER BY length 
LIMIT 10;

#9-Find the movies with the longest runtime, without using LIMIT.
SELECT title, length
FROM film
WHERE length=(
	SELECT MAX(length)
    FROM film
    WHERE length!=0
);

#10-Find all movies that have deleted scenes.
SELECT title, special_features
FROM film
WHERE special_features="Deleted Scenes";

#11-Using HAVING, reverse-alphabetically list the last names that are not repeated.
SELECT last_name, COUNT(last_name)
FROM actor
GROUP BY last_name
HAVING COUNT(DISTINCT last_name)
ORDER BY last_name DESC;

#12-Using HAVING, list the last names that appear more than once, from highest to lowest frequency.
SELECT last_name, COUNT(last_name)
FROM actor
GROUP BY last_name
HAVING COUNT(DISTINCT last_name)
ORDER BY COUNT(last_name) DESC;

#13-Which actor has appeared in the most films?
SELECT actor.actor_id, actor.first_name, actor.last_name, 
	COUNT(actor_id) AS film_count
FROM actor JOIN film_actor USING (actor_id)
GROUP BY actor_id
ORDER BY film_count DESC
LIMIT 1;

#14-When is 'Academy Dinosaur' due?
SELECT title, rental_duration
FROM film 
WHERE film_id=1;

#15-What is the average runtime of all films?
SELECT AVG(length) 
FROM film;

#16-List the average runtime for every film category.
SELECT category.name, AVG (length)
FROM film
JOIN film_category USING (film_id) JOIN category USING (category_id)
GROUP BY category.name
ORDER BY AVG(length) DESC;

#17-List all movies featuring a robot.
SELECT title, description
FROM film
WHERE description LIKE "%robot%";

#18-How many movies were released in 2010?
SELECT COUNT(release_year) 
FROM film 
WHERE release_year=2010;

#19-Find the titles of all the horror movies. ******
SELECT title, category
FROM film_list
WHERE category = "Horror";

#20-List the full name of the staff member with the ID of 2.
SELECT staff_id, first_name, last_name
FROM staff
WHERE staff_id = 2;

#21-List all the movies that Fred Costner has appeared in.
DESCRIBE film_list;

SELECT actors, title
FROM film_list
WHERE actors="Fred Costner";

#22-How many distinct countries are there? *****
SELECT COUNT(DISTINCT country)
FROM country;

#23-List the name of every language in reverse-alphabetical order.
SELECT name
FROM language
ORDER BY name DESC;

#24-List the full names of every actor whose surname ends with '-son' in alphabetical order by their forename.
SELECT first_name, last_name
FROM actor 
WHERE first_name OR last_name LIKE '%son%';

#25-Which category contains the most films?
DESCRIBE film_list;

SELECT COUNT(title), category FROM film_list
GROUP BY category LIMIT 1;