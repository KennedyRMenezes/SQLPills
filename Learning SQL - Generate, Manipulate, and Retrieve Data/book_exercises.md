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

Exercise 5-1
Fill in the blanks (denoted by <#>) for the following query to obtain the results that
follow:
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

Exercise 5-2
Write a query that returns the title of every film in which an actor with the first name
JOHN appeared.

```sql
select f.title
from film AS f
inner join film_actor as fa
 on f.film_id = fa.film_id
inner join actor as ac
 on fa.actor_id = ac.actor_id
where ac.first_name like '%JOHN%';
```

Exercise 5-3
Construct a query that returns all addresses that are in the same city. You will need to
join the address table to itself, and each row should include two different addresses.
```sql
```

Exercise 6-1
If set A = {L M N O P} and set B = {P Q R S T}, what sets are generated by the follow‐
ing operations?

```sql
• A union B	|- {L M N O P Q R S T}
• A union all B	|- {L M N O P P Q R S T}
• A intersect B	|- {P}
• A except B	|- {L M N O}
```

Exercise 6-2
Write a compound query that finds the first and last names of all actors and custom‐
ers whose last name starts with L.

```sql
select c.first_name, c.last_name
from customer as c
where c.last_name LIKE 'L%'
union
select a.first_name, a.last_name
from actor as a
where a.last_name LIKE 'L%';
```

Exercise 6-3
Sort the results from Exercise 6-2 by the last_name column.

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