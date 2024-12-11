
-------------------------------------------------------------------------
# EXERCISE: 
Same-Day Orders

(https://platform.stratascratch.com/coding/10545-same-day-orders?code_type=1)

Identify users who started a session and placed an order on the same day. For these users, calculate the total number of orders and the total order value for that day.

Your output should include the user, the session date, the total number of orders, and the total order value for that day.

Tables: sessions, order_summary

sessions
session_date:
date
session_id:
bigint
user_id:
bigint

order_summary
order_date:
date
order_id:
bigint
order_value:
bigint
user_id:
bigint

# ANSWER:
```sql
select s.user_id, 
        s.session_date, 
        count(os.order_id) as total_orders,
        sum(os.order_value) as total_order_value
from sessions as s
left join order_summary as os
on s.user_id = os.user_id and os.order_date = s.session_date
where os.order_date IS NOT NULL
group by s.user_id, s.session_date;
```

|content_text	                |modified_text|
---                             |---|
|hello world! this is a TEST.	|Hello world! this is a test.|
|what a great day	            |What a great day|
|WELCOME to the event.	        |Welcome to the event.|

-------------------------------------------------------------------------

