
-------------------------------------------------------------------------
# EXERCISE: 
Interaction Summary

(https://platform.stratascratch.com/coding/10542-interaction-summary?code_type=1)

Calculate the total number of interactions and the total number of contents created for each customer. Include all interaction types and content types in your calculations.

Your output should include the customer's ID, the total number of interactions, and the total number of content items.

Tables: customer_interactions, user_content

customer_interactions
- customer_id:
bigint
- interaction_date:
date
- interaction_id:
bigint
- interaction_type:
text

user_content
- content_id:
bigint
- content_text:
text
- content_type:
text
- customer_id:
bigint


# ANSWER:
```sql
SELECT 
    COALESCE(c.customer_id, u.customer_id) AS customer_id,
    COUNT(DISTINCT c.interaction_id) AS total_interactions,
    COUNT(DISTINCT u.content_id) AS total_content_items
FROM 
    customer_interactions c
FULL OUTER JOIN 
    user_content u
ON 
    c.customer_id = u.customer_id
GROUP BY 
    COALESCE(c.customer_id, u.customer_id);
```

-------------------------------------------------------------------------


