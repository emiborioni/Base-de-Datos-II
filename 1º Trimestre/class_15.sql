# class 15 
CREATE OR REPLACE VIEW list_of_customer AS 
  SELECT customer_id, CONCAT(first_name ," ", last_name) AS full_name , address.address, address.postal_code, address.phone, city.city, country.country, store_id
  FROM customer 
  INNER JOIN address using (address_id)
  INNER JOIN city  using (city_id) 
  INNER join country  using (country_id);
 
 select * from list_of_customer;

#Create a view named film_details, it should contain the following columns:
#film id,  title, description,  category,  price,  length,  rating, actors  - as a string of all the actors separated by comma. Hint use GROUP_CONCAT

 
 CREATE OR REPLACE VIEW film_details AS
 SELECT film_id, title, description,`length`, rating, category.name,replacement_cost, group_concat(actor.first_name, actor.last_name)
 from film
 INNER JOIN film_category USING (film_id)
 INNER JOIN category USING (category_id)
 INNER JOIN film_actor USING(film_id)
 INNER JOIN actor USING(actor_id)
 group by film_id, title, description,`length`, rating, category.name,replacement_cost
 
 select * from film_details ;
