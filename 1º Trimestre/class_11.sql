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
