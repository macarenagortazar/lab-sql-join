# Lab | SQL Join

#In this lab, you will be using the [Sakila](https://dev.mysql.com/doc/sakila/en/) database of movie rentals.
use sakila;

### Instructions

#1. List number of films per `category`.
select c.name as "Category Name", count(f.film_id) as "Number of Films" from sakila.category as c
join sakila.film_category as f
on f.category_id=c.category_id
group by name;

#2. Display the first and last names, as well as the address, of each staff member.
select s.first_name, s.last_name, a.address from sakila.staff as s
join sakila.address as a
on s.address_id=a.address_id;


#3. Display the total amount rung up by each staff member in August of 2005.
select amount, date_format(convert(payment_date,datetime),"%Y-%m-%d") from sakila.payment 
where mid(payment_date,6,2)="08";


select s.first_name, s.last_name, sum(p.amount) as "Amount rung up" from sakila.payment as p
join sakila.staff as s
on s.staff_id=p.staff_id
where mid(date_format(convert(payment_date,datetime),"%Y-%m-%d"),6,2)="08"
group by first_name, last_name;


#4. List each film and the number of actors who are listed for that film.
select f.title, count(fa.actor_id) as "Number of actors" from sakila.film_actor as fa
join sakila.film as f
on fa.film_id=f.film_id
group by title;

#5. Using the tables `payment` and `customer` and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
select c.customer_id, c.first_name, c.last_name, sum(p.amount) as "Total payment" from sakila.payment as p
join sakila.customer as c
on c.customer_id=p.customer_id
group by customer_id
order by last_name;


