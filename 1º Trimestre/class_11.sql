-- Get the amount of cities per country in the database. 
-- Sort them by country, country_id.

SELECT country.country_id,country.country, COUNT(*)
 from city, country
 where country.country_id = city.country_id
 group by country, country.country_id order by country_id 
 
-- Get the amount of cities per country in the database. 
-- Show only the countries with more than 10 cities, order from the highest amount of cities to the lowest   

 SELECT country.country_id,country.country, COUNT(*)
 from city, country
 where country.country_id = city.country_id
 group by country, country.country_id  
  HAVING COUNT(*)>10 
  order by COUNT(*) DESC
  
-- Generate a report with customer (first, last) name, address, total films rented and the total money spent renting films. 
-- Show the ones who spent more money first .

SELECT payment.customer_id, SUM(amount),customer.last_name, customer.first_name, address.address-- , address.address, customer.last_name-- , SUM(amount), rental_id
from payment,customer,address
where payment.customer_id = customer.customer_id and payment.customer_id = address.address_id
GROUP by payment.customer_id, customer.last_name, customer.first_name, address.address
ORDER BY SUM(amount) DESC;


-- Find all the film titles that are not in the inventory

select title
FROM film
where film_id NOT IN  (select film_id 
						 from inventory
						 group by (film_id )order by film_id);
						 
-- Find all the films that are in the inventory but were never rented. 
-- Show title and inventory_id.
-- hint: use sub-queries in FROM and in WHERE or use left join and ask if one of the fields is null						  
select title, inventory_id
FROM film, inventory
where film.film_id = inventory.film_id
AND film.film_id IN  (select film_id 
						 from inventory
						 group by (film_id )order by film_id)
AND title  NOT IN (SELECT DISTINCT film.title -- Muestra una vez el titulo y no cada vez que este en cada tabla como uno distinto y diferente 
FROM film, inventory, rental
WHERE film.film_id = inventory.film_id
AND inventory.inventory_id = rental.inventory_id);
