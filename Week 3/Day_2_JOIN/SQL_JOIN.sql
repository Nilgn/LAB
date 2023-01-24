#Lab | SQL Queries - Join Two Tables
USE sakila;

# 1.Which actor has appeared in the most films?
#Hint:  group by actor_id

SELECT first_name, last_name, count(film_id) AS count_filmid FROM actor 
LEFT JOIN film_actor 
USING(actor_id)
GROUP BY actor_id
ORDER BY count_filmid
DESC LIMIT 1;

# 2. Most active customer (the customer that has rented the most number of films)
SELECT first_name, last_name, count(rental_id) AS rented FROM customer 
LEFT JOIN rental
USING(customer_id)
GROUP BY customer_id 
ORDER BY rented
DESC LIMIT 1;

# 3. List number of films per category.
SELECT `name`, count(category_id) AS n_category
FROM category
LEFT JOIN film_category
USING(category_id)
GROUP BY category_id
ORDER BY n_film;

# 4. Display the first and last names, as well as the address, of each staff member.
SELECT first_name, last_name, district, city_id, postal_code, location 
FROM address
INNER JOIN staff
USING(address_id)
ORDER BY first_name DESC;


# 5. get films titles where the film language is either English or italian, and whose titles starts with letter "M" , sorted by title descending.
SELECT `name`, title FROM film 
INNER JOIN `language`
USING(language_id)
WHERE title LIKE 'M%' AND `name` IN ('English','Italian')
ORDER BY title;

# 6. Display the total amount rung up by each staff member in August of 2005. 
SELECT first_name, last_name, payment_date, sum(amount) AS rung
FROM staff
LEFT JOIN payment
USING(staff_id)
WHERE payment_date LIKE '2005-08%'
GROUP BY payment_date
ORDER BY rung DESC;


# 7. List each film and the number of actors who are listed for that film.
SELECT title, count(actor_id) AS actor_number FROM film LEFT JOIN film_actor USING(film_id)
GROUP BY title
ORDER BY actor_number DESC;

# 8.Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
SELECT last_name, first_name, customer_id, sum(amount) AS customer_amount 
FROM payment 
LEFT JOIN customer 
USING(customer_id)
GROUP BY customer_id
ORDER BY last_name ASC;

# 9. Write sql statement to check if you can find any actor who never particiapted in any film.
SELECT last_name, first_name FROM actor FULL JOIN film_actor USING(actor_id)
WHERE film_id IS NULL
GROUP BY actor_id
ORDER BY last_name ASC;

# 10. get the addresses that have NO customers, and ends with the letter "e"
SELECT first_name, last_name, address, address2 FROM address LEFT JOIN customer USING(address_id)
WHERE address LIKE '%e' AND 'NO'
GROUP BY address_id
ORDER BY first_name ASC;
