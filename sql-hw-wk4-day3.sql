-- Week 5 - Wednesday Questions 
-- 1. List all customers who live in Texas (use JOINs)

SELECT first_name, last_name, district
FROM customer
JOIN address
ON customer.address_id = address.address_id
WHERE district = 'Texas';

-- query returned 5 results

-- 2. Get all payments above $6.99 with the Customer's Full Name

SELECT  DISTINCT first_name, last_name
FROM customer
JOIN payment
ON customer.customer_id = payment.customer_id
WHERE amount > 6.99
ORDER BY last_name ASC;

-- 3. Show all customers names who have made payments over $175(use subqueries) 

SELECT first_name, last_name
FROM customer
WHERE customer_id IN (
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount) > 175
	ORDER BY SUM(amount) DESC
);

-- query returned 6 results

-- 4. List all customers that live in Nepal (use the city table) 

SELECT first_name, last_name, city
FROM customer
JOIN address
ON customer.address_id = address.address_id
JOIN city
ON address.city_id = city.city_id
WHERE city = 'Nepal';

-- returned 0 result, Nepal is not in DB

-- 5. Which staff member had the most transactions?

SELECT staff_id, payment_id, COUNT(payment_id)
FROM staff
JOIN payment
ON staff.staff_id = payment.staff_id
GROUP BY staff_id
HAVING COUNT(payment_id);

-- 6. How many movies of each rating are there?

SELECT COUNT(title), rating
FROM film 
GROUP BY rating;

-- 7.Show all customers who have made a single payment above $6.99 (Use Subqueries)

SELECT customer_id, first_name, last_name
FROM customer
WHERE customer_id IN (
	SELECT customer_id
	FROM payment
	WHERE amount > 6.99
	GROUP BY customer
	HAVING COUNT(amount) <> 1
	ORDER BY COUNT(amount) DESC
);

-- 8. How many free rentals did our stores give away?

SELECT rental_id, amount
FROM payment
WHERE amount < .99
GROUP BY rental_id, amount;

-- 24 
