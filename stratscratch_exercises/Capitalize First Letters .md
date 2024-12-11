
-------------------------------------------------------------------------
# EXERCISE: 
Capitalize First Letters 

(https://platform.stratascratch.com/coding/10546-capitalize-first-letters?code_type=1)

Convert the first letter of each word found in content_text to uppercase, while keeping the rest of the letters lowercase.

Your output should include the original text in one column and the modified text in another column.

content_id	customer_id	content_type	content_text
1		2		comment		hello world! this is a TEST.
2		8		comment		what a great day
3		4		omment		WELCOME to the event.

# ANSWER:
```sql
SELECT content_text,
       INITCAP(content_text) AS modified_text
FROM user_content;
```

content_text	                modified_text
hello world! this is a TEST.	Hello world! this is a test.
what a great day	            What a great day
WELCOME to the event.	        Welcome to the event.

-------------------------------------------------------------------------


