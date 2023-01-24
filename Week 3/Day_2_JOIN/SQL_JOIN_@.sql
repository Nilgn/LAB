USE sakila;

# 1. Write a query to display for each store its store ID, city, and country.
SELECT store_id, city, country
FROM store AS s
	INNER JOIN 
    address AS ad
    ON s.address_id = ad.address_id
    LEFT JOIN 
    city AS c
    ON ad.city_id = c.city_id
    INNER JOIN 
    country AS countr
    ON c.country_id = countr.country_id;

# 2. Write a query to display how much business, in dollars, each store brought in.
SELECT store_id, count(amount) AS business
FROM store AS s
	LEFT JOIN 
    inventory AS intv
    ON s.store_id = intv.store_id
    LEFT JOIN 
    payment AS pay
    ON intv.customer_id = pay.customer_id
GROUP BY business
ORDER BY store_id DESC;

# 3.What is the average running time(length) of films by category?
SELECT title, `name`,  avg(length) AS len
	FROM film as f
    LEFT JOIN 
    film_category AS f_cat
    ON f.film_id = f_cat.film_id
    LEFT JOIN
    category AS cat
    ON f_cat.category_id = cat.category_id
GROUP BY `name`;


# 4. Which film categories are longest(length) (find Top 5)? (Hint: You can rely on question 3 output.)
SELECT `name`, round(avg(length), 0) AS len
	FROM film AS f
    INNER JOIN 
    film_category AS f_cat
    USING(film_id)
    INNER JOIN 
    category AS cat 
    USING(category_id)
    GROUP BY `name`
	ORDER BY len DESC LIMIT 5;

# 5. Display the top 5 most frequently(number of times) rented movies in descending order.
