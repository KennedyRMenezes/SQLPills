
-------------------------------------------------------------------------
# EXERCISE: 
Capitalize First Letters 

(https://platform.stratascratch.com/coding/10546-capitalize-first-letters?code_type=1)

Convert the first letter of each word found in content_text to uppercase, while keeping the rest of the letters lowercase.

Your output should include the original text in one column and the modified text in another column.

# ANSWER:
```sql
SELECT content_text,
       INITCAP(content_text) AS modified_text
FROM user_content;
```
## OTHER OPTION:
```sql
SELECT 
    content_id,
    customer_id,
    content_type,
    content_text AS original_text,
    CONCAT(
        UPPER(SUBSTRING(content_text, 1, 1)), 
        LOWER(SUBSTRING(content_text, 2))
    ) AS modified_text
FROM your_table;

```

|content_text	                |modified_text|
---                             |---|
|hello world! this is a TEST.	|Hello world! this is a test.|
|what a great day	            |What a great day|
|WELCOME to the event.	        |Welcome to the event.|

-------------------------------------------------------------------------


