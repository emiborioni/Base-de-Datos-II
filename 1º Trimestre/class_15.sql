# class 15 
#1
CREATE OR REPLACE VIEW list_of_customer AS 
  SELECT customer_id, CONCAT(first_name ," ", last_name) AS full_name , address.address, address.postal_code, address.phone, city.city, country.country, store_id
  FROM customer 
  INNER JOIN address using (address_id)
  INNER JOIN city  using (city_id) 
  INNER join country  using (country_id);
 
 select * from list_of_customer;
#2
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
#3
 #Create view sales_by_film_category, it should return 'category' and 'total_rental' columns. SUM(payment.amount)
 CREATE OR REPLACE VIEW sales_by_film_category AS
 select name, SUM(payment.amount)
 from category
 INNER JOIN film_category USING(category_id)
 INNER JOIN film USING(film_id)
 INNER JOIN inventory USING(film_id)
 INNER JOIN rental USING(inventory_id)
 INNER JOIN payment USING(rental_id)
 group by name
 
 select * from sales_by_film_category ; 

#4
#Create a view called actor_information where it should return, actor id, first name, last name and the amount of films he/she acted on.

 CREATE OR REPLACE VIEW actor_information AS
 select actor_id, first_name, last_name, COUNT(film_actor.actor_id)
 from actor
 INNER join film_actor USING (actor_id)
 where (film_actor.actor_id = actor.actor_id)
 group by actor_id
 ; 
 
 select * from actor_information; 
