
-------------------------------------------------------------------------
# EXERCISE: 
High-Density Areas

(https://platform.stratascratch.com/coding/10544-high-density-areas?code_type=1)

Identify the top 3 areas with the highest customer density. Customer density = (total number of unique customers in the area / area size).

Your output should include the area name and its calculated customer density, and ties will be ranked the same.

Tables: transaction_records, stores

transaction_records:
- customer_id:
bigint
- store_id:
bigint
- transaction_amount:
bigint
- transaction_date:
date
- transaction_id:
bigint

stores:
- area_name:
text
- area_size:
bigint
- store_id:
bigint
- store_location:
text
- store_open_date:
date

# ANSWER:
```sql
select s.area_name,
       count(distinct tr.customer_id) / nullif(s.area_size, 0) as customer_density
from transaction_records as tr
join stores as s
    on s.store_id = tr.store_id
group by s.area_name, s.area_size
order by customer_density desc
limit 3;
```

|area_name	|customer_density|
|---|---|
|Area A	|0
|Area B	|0
|Area C	|0

-------------------------------------------------------------------------


