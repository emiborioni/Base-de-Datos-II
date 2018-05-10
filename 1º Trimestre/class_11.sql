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
