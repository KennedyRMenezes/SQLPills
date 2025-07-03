### Exercise 3-1
Retrieve the actor ID, first name, and last name for all actors. Sort by last name and
then by first name.
    
#### ANSWER:
```sql      
mysql> select actor_id, first_name, last_name from actor;
+----------+-------------+--------------+
| actor_id | first_name  | last_name    |
+----------+-------------+--------------+
|        1 | PENELOPE    | GUINESS      |
|        2 | NICK        | WAHLBERG     |
|        3 | ED          | CHASE        |
|        4 | JENNIFER    | DAVIS        |
|        5 | JOHNNY      | LOLLOBRIGIDA |
....
```

---

### Exercise 3-2
Retrieve the actor ID, first name, and last name for all actors whose last name equals 'WILLIAMS' or 'DAVIS'.
     
#### ANSWER:
```sql      

mysql> select actor_id, first_name, last_name from actor
    -> where last_name IN ('WILLIAMS', 'DAVIS');
+----------+------------+-----------+
| actor_id | first_name | last_name |
+----------+------------+-----------+
|        4 | JENNIFER   | DAVIS     |
|      101 | SUSAN      | DAVIS     |
|      110 | SUSAN      | DAVIS     |
|       72 | SEAN       | WILLIAMS  |
|      137 | MORGAN     | WILLIAMS  |
|      172 | GROUCHO    | WILLIAMS  |
+----------+------------+-----------+
```

---

### Exercise 3-3
Write a query against the rental table that returns the IDs of the customers who ren‐
ted a film on July 5, 2005 (use the rental.rental_date column, and you can use the
date() function to ignore the time component). Include a single row for each distinct
customer ID.
    
#### ANSWER:
```sql      

mysql> select customer_id
    -> from rental
    -> where date(rental_date) = '2005-07-05'
    -> group by customer_id;
+-------------+
| customer_id |
+-------------+
|           8 |
|          37 |
|          60 |
|         111 |
|         114 |
...
```

---

### Exercise 3-4
Fill in the blanks (denoted by <#>) for this multitable query to achieve the following
results:
```sql
mysql> SELECT c.email, r.return_date
 -> FROM customer c
 -> INNER JOIN rental <1>
 -> ON c.customer_id = <2>
 -> WHERE date(r.rental_date) = '2005-06-14'
 -> ORDER BY <3> <4>;
+-----------------------------------------+---------------------+
| email                                   | return_date         |
+-----------------------------------------+---------------------+
| DANIEL.CABRAL@sakilacustomer.org        | 2005-06-23 22:00:38 |
| TERRANCE.ROUSH@sakilacustomer.org       | 2005-06-23 21:53:46 |
| MIRIAM.MCKINNEY@sakilacustomer.org      | 2005-06-21 17:12:08 |
| GWENDOLYN.MAY@sakilacustomer.org        | 2005-06-20 02:40:27 |
| JEANETTE.GREENE@sakilacustomer.org      | 2005-06-19 23:26:46 |
| HERMAN.DEVORE@sakilacustomer.org        | 2005-06-19 03:20:09 |
| JEFFERY.PINSON@sakilacustomer.org       | 2005-06-18 21:37:33 |
| MATTHEW.MAHAN@sakilacustomer.org        | 2005-06-18 05:18:58 |
| MINNIE.ROMERO@sakilacustomer.org        | 2005-06-18 01:58:34 |
| SONIA.GREGORY@sakilacustomer.org        | 2005-06-17 21:44:11 |
| TERRENCE.GUNDERSON@sakilacustomer.org   | 2005-06-17 05:28:35 |
| ELMER.NOE@sakilacustomer.org            | 2005-06-17 02:11:13 |
| JOYCE.EDWARDS@sakilacustomer.org        | 2005-06-16 21:00:26 |
| AMBER.DIXON@sakilacustomer.org          | 2005-06-16 04:02:56 |
| CHARLES.KOWALSKI@sakilacustomer.org     | 2005-06-16 02:26:34 |
| CATHERINE.CAMPBELL@sakilacustomer.org   | 2005-06-15 20:43:03 |
+-----------------------------------------+---------------------+
16 rows in set (0.03 sec)
```    

#### ANSWER:
```sql      
SELECT c.email, r.return_date
FROM customer c
INNER JOIN rental AS r
ON c.customer_id = r.customer_id
WHERE date(r.rental_date) = '2005-06-14'
ORDER BY return_date desc;
```

You’ll need to refer to the following subset of rows from the payment table for the first
two exercises:
```sql
+------------+-------------+--------+--------------------+
| payment_id | customer_id | amount | date(payment_date) |
+------------+-------------+--------+--------------------+
| 101        | 4           | 8.99   | 2005-08-18         |
| 102        | 4           | 1.99   | 2005-08-19         |
| 103        | 4           | 2.99   | 2005-08-20         |
| 104        | 4           | 6.99   | 2005-08-20         |
| 105        | 4           | 4.99   | 2005-08-21         |
| 106        | 4           | 2.99   | 2005-08-22         |
| 107        | 4           | 1.99   | 2005-08-23         |
| 108        | 5           | 0.99   | 2005-05-29         |
| 109        | 5           | 6.99   | 2005-05-31         |
| 110        | 5           | 1.99   | 2005-05-31         |
| 111        | 5           | 3.99   | 2005-06-15         |
| 112        | 5           | 2.99   | 2005-06-16         |
| 113        | 5           | 4.99   | 2005-06-17         |
| 114        | 5           | 2.99   | 2005-06-19         |
| 115        | 5           | 4.99   | 2005-06-20         |
| 116        | 5           | 4.99   | 2005-07-06         |
| 117        | 5           | 2.99   | 2005-07-08         |
| 118        | 5           | 4.99   | 2005-07-09         |
| 119        | 5           | 5.99   | 2005-07-09         |
| 120        | 5           | 1.99   | 2005-07-09         |
+------------+-------------+--------+--------------------+
```

### Exercise 4-1
Which of the payment IDs would be returned by the following filter conditions?
customer_id <> 5 AND (amount > 8 OR date(payment_date) = '2005-08-23')

#### ANSWER:
```sql 
101 e 107
```

-------------------------------------------------------------------------------------
### Exercise 4-2
Which of the payment IDs would be returned by the following filter conditions?
customer_id = 5 AND NOT (amount > 6 OR date(payment_date) = '2005-06-19')

#### ANSWER:
```sql 
108, 110, 111, 112, 113, 115, 116, 117, 118, 119, e 120
```
-------------------------------------------------------------------------------------
### Exercise 4-3
Construct a query that retrieves all rows from the payments table where the amount
is either 1.98, 7.98, or 9.98.

#### ANSWER:
```sql 
select amount
from payment
where amount in (1.98, 7.98, or 9.98)
```

### Exercise 4-4
Construct a query that finds all customers whose last name contains an A in the sec‐
ond position and a W anywhere after the A.

#### ANSWER:
```sql 
select last_name
from customers
where last_name like '_A%W%'
```

---

### Exercise 5-1
Fill in the blanks (denoted by <#>) for the following query to obtain the results that
follow:

#### ANSWER:
```sql
mysql> SELECT c.first_name, c.last_name, a.address, ct.city
 -> FROM customer c
 -> INNER JOIN address a
 -> ON c.address_id = a.address_id
 -> INNER JOIN city ct
 -> ON a.city_id = ct.city_id
 -> WHERE a.district = 'California';
+------------+-----------+------------------------+----------------+
| first_name | last_name | address 		          | 	      city |
+------------+-----------+------------------------+----------------+
| PATRICIA   | JOHNSON   | 1121 Loja Avenue       | San Bernardino |
| BETTY      | WHITE     | 770 Bydgoszcz Avenue   | Citrus Heights |
| ALICE      | STEWART   | 1135 Izumisano Parkway | Fontana        |
| ROSA       | REYNOLDS  | 793 Cam Ranh Avenue    | Lancaster 	   |
| RENEE      | LANE      | 533 al-Ayn Boulevard   | Compton        |
| KRISTIN    | JOHNSTON  | 226 Brest Manor        | Sunnyvale      |
| CASSANDRA  | WALTERS   | 920 Kumbakonam Loop    | Salinas        |
| JACOB      | LANCE     | 1866 al-Qatif Avenue   | El Monte       |
| RENE       | MCALISTER | 1895 Zhezqazghan Drive | Garden Grove   |
+------------+-----------+------------------------+----------------+
9 rows in set (0.00 sec)
```

### Exercise 5-2
Write a query that returns the title of every film in which an actor with the first name
JOHN appeared.

#### ANSWER:
```sql
select f.title
from film AS f
inner join film_actor as fa
 on f.film_id = fa.film_id
inner join actor as ac
 on fa.actor_id = ac.actor_id
where ac.first_name like '%JOHN%';
```

### Exercise 5-3
Construct a query that returns all addresses that are in the same city. You will need to
join the address table to itself, and each row should include two different addresses.

#### ANSWER:
```sql
```

---

### Exercise 6-1
If set A = {L M N O P} and set B = {P Q R S T}, what sets are generated by the follow‐
ing operations?

#### ANSWER:
```sql
• A union B	|- {L M N O P Q R S T}
• A union all B	|- {L M N O P P Q R S T}
• A intersect B	|- {P}
• A except B	|- {L M N O}
```

### Exercise 6-2
Write a compound query that finds the first and last names of all actors and custom‐
ers whose last name starts with L.

#### ANSWER:
```sql
select c.first_name, c.last_name
from customer as c
where c.last_name LIKE 'L%'
union
select a.first_name, a.last_name
from actor as a
where a.last_name LIKE 'L%';
```

### Exercise 6-3
Sort the results from Exercise 6-2 by the last_name column.

#### ANSWER:
```sql
select c.first_name, c.last_name
from customer as c
where c.last_name LIKE 'L%'
union
select a.first_name, a.last_name
from actor as a
where a.last_name LIKE 'L%'
order by last_name;
```

---

### Exercise 7-1
Write a query that returns the 17th through 25th characters of the string 'Please
find the substring in this string'.

#### ANSWER:
```sql
SELECT SUBSTRING('Please find the substring in this string', 17, 25);
```

### Exercise 7-2
Write a query that returns the absolute value and sign (−1, 0, or 1) of the number
−25.76823. Also return the number rounded to the nearest hundredth.

#### ANSWER:
```sql
SELECT -25.76823, SIGN(-25.76823), ABS(-25.76823);
```

### Exercise 7-3
Write a query to return just the month portion of the current date.

#### ANSWER:
```sql
SELECT month(current_date());
```

---

### Exercise 8-1
Construct a query that counts the number of rows in the payment table.

#### ANSWER:
```sql
mysql> SELECT count(*)
    -> FROM payment;
+----------+
| count(*) |
+----------+
|    16044 |
+----------+
1 row in set (0.30 sec)
```


### Exercise 8-2
Modify your query from Exercise 8-1 to count the number of payments made by each
customer. Show the customer ID and the total amount paid for each customer.

#### ANSWER:
```sql
SELECT customer_id, count(*), sum(amount)
FROM payment
GROUP BY customer_id;
```

### Exercise 8-3
Modify your query from Exercise 8-2 to include only those customers who have
made at least 40 payments.

#### ANSWER:
```sql
SELECT customer_id, count(*), sum(amount)
FROM payment
GROUP BY customer_id
HAVING count(*) >= 40;
```

---

### Exercise 9-1
Construct a query against the film table that uses a filter condition with a noncorre‐
lated subquery against the category table to find all action films (category.name =
'Action').

#### ANSWER:
```sql
select title
from film
where film_id in (select film_id
                  from film_category as fc
                  inner join category as c
                    using (category_id)
                  where c.name = 'Action');
```

### Exercise 9-2
Rework the query from Exercise 9-1 using a correlated subquery against the category
and film_category tables to achieve the same results.

#### ANSWER:
```sql
SELECT f.title
FROM film f
WHERE EXISTS(
    SELECT 1
    FROM film_category as fc INNER JOIN category as c
        USING(category_id)
    WHERE c.name = 'Action'
        AND fc.film_id = f.film_id);
```


### Exercise 9-3
Join the following query to a subquery against the film_actor table to show the level
of each actor:

```sql
SELECT 'Hollywood Star' level, 30 min_roles, 99999 max_roles
UNION ALL
SELECT 'Prolific Actor' level, 20 min_roles, 29 max_roles
UNION ALL
SELECT 'Newcomer' level, 1 min_roles, 19 max_roles
```
The subquery against the film_actor table should count the number of rows for each
actor using group by actor_id, and the count should be compared to the
min_roles/max_roles columns to determine which level each actor belongs to.

#### ANSWER:

---

### Exercise 10-1
Using the following table definitions and data, write a query that returns each cus‐
tomer name along with their total payments:
 Customer:
Customer_id Name
----------- ---------------
1 John Smith
2 Kathy Jones
3 Greg Oliver
 Payment:
Payment_id Customer_id Amount
---------- ----------- --------
101 1 8.99
102 3 4.99
103 1 7.99
Include all customers, even if no payment records exist for that customer.

#### ANSWER:

### Exercise 10-2
Reformulate your query from Exercise 10-1 to use the other outer join type (e.g., if
you used a left outer join in Exercise 10-1, use a right outer join this time) such that
the results are identical to Exercise 10-1.

#### ANSWER:

### Exercise 10-3 (Extra Credit)
Devise a query that will generate the set {1, 2, 3, ..., 99, 100}. (Hint: use a cross join
with at least two from clause subqueries.)

#### ANSWER:

---

### Exercise 11-1
Rewrite the following query, which uses a simple case expression, so that the same
results are achieved using a searched case expression. Try to use as few when clauses
as possible.
```sql
SELECT name,
 CASE name
 WHEN 'English' THEN 'latin1'
 WHEN 'Italian' THEN 'latin1'
 WHEN 'French' THEN 'latin1'
 WHEN 'German' THEN 'latin1'
 WHEN 'Japanese' THEN 'utf8'
 WHEN 'Mandarin' THEN 'utf8'
 ELSE 'Unknown'
 END character_set
FROM language;
```

#### ANSWER:

### Exercise 11-2
Rewrite the following query so that the result set contains a single row with five col‐
umns (one for each rating). Name the five columns G, PG, PG_13, R, and NC_17.

```sql
mysql> SELECT rating, count(*)
 -> FROM film
 -> GROUP BY rating;
+--------+----------+
| rating | count(*) |
+--------+----------+
| PG | 194 |
| G | 178 |
| NC-17 | 210 |
| PG-13 | 223 |
| R | 195 |
+--------+----------+
5 rows in set (0.00 sec)
```

#### ANSWER:

---

### Exercise 14-1
Create a view definition that can be used by the following query to generate the given
results:

```sql
SELECT title, category_name, first_name, last_name
FROM film_ctgry_actor
WHERE last_name = 'FAWCETT';

+---------------------+---------------+------------+-----------+
| title | category_name | first_name | last_name |
+---------------------+---------------+------------+-----------+
| ACE GOLDFINGER | Horror | BOB | FAWCETT |
| ADAPTATION HOLES | Documentary | BOB | FAWCETT |
| CHINATOWN GLADIATOR | New | BOB | FAWCETT |
| CIRCUS YOUTH | Children | BOB | FAWCETT |
| CONTROL ANTHEM | Comedy | BOB | FAWCETT |
| DARES PLUTO | Animation | BOB | FAWCETT |
| DARN FORRESTER | Action | BOB | FAWCETT |
| DAZED PUNK | Games | BOB | FAWCETT |
| DYNAMITE TARZAN | Classics | BOB | FAWCETT |
| HATE HANDICAP | Comedy | BOB | FAWCETT |
| HOMICIDE PEACH | Family | BOB | FAWCETT |
| JACKET FRISCO | Drama | BOB | FAWCETT |
| JUMANJI BLADE | New | BOB | FAWCETT |
| LAWLESS VISION | Animation | BOB | FAWCETT |
| LEATHERNECKS DWARFS | Travel | BOB | FAWCETT |
```

#### ANSWER:

---

### Exercise 14-2

The film rental company manager would like to have a report that includes the name
of every country, along with the total payments for all customers who live in each
country. Generate a view definition that queries the country table and uses a scalar
subquery to calculate a value for a column named tot_payments.

#### ANSWER:



