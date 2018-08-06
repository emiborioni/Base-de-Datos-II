#Write a query that gets all the customers that live in Argentina.
#Show the first and last name in one column, the address and the city.
#1
SELECT CONCAT(c.first_name, c.last_name), a.address, ci.city
FROM customer c
INNER JOIN address a USING (address_id)
INNER JOIN city ci USING (city_id)
INNER JOIN country cou USING (country_id)
WHERE cou.country = "Argentina";

#Write a query that shows the film title, language and rating.
#Rating shall be shown as the full text described here: 
#https://en.wikipedia.org/wiki/Motion_picture_content_rating_system
#United_States. Hint: use case.
#2
SELECT f.title, l.name, CASE f.rating 
	WHEN 'G' THEN 'All Ages Are Admitted.'
	WHEN 'PG' THEN 'Some Material May Not Be Suitable For Children.'
	WHEN 'PG-13' THEN 'Some Material May Be Inappropriate For Children Under 13.'
	WHEN 'R' THEN 'Under 17 Requires Accompanying Parent Or Adult Guardian.'
	WHEN 'NC-17' THEN 'No One 17 and Under Admitted.'
	END
FROM film f 
INNER JOIN `language` l USING (language_id);


#Write a search query that shows all the films (title and release year) an actor was part of.
#Assume the actor comes from a text box introduced by hand from a web page.
#Make sure to "adjust" the input text to try to find the films as effectively as you think is possible.
#3
SELECT f.title, f.release_year
FROM film f
INNER JOIN film_actor fa USING (film_id)
INNER JOIN actor a USING (actor_id)
WHERE TRIM(LOWER(CONCAT(a.first_name))) LIKE TRIM(LOWER(' Zero '));


#Find all the rentals done in the months of May and June.
#Show the film title, customer name and if it was returned or not.
#There should be returned column with two possible values 'Yes' and 'No'.
#4
SELECT title, first_name, CASE
	WHEN return_date IS NULL THEN "no"
	WHEN return_date Is NOT NULL THEN "yes"
END AS returned
FROM rental
INNER JOIN inventoryz USING (inventory_id)
INNER JOIN film USING (film_id)
INNER JOIN customer USING (customer_id);
