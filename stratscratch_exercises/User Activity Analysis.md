
-------------------------------------------------------------------------
# EXERCISE: 
User Activity Analysis

(https://platform.stratascratch.com/coding/10541-user-activity-analysis?code_type=1)

Identify users who have logged at least one activity within 30 days of their registration date.

Your output should include the user’s ID, registration date, and a count of the number of activities logged within that 30-day period.

Do not include users who did not perform any activity within this 30-day period.

Tables: user_profiles, user_activities

user_profiles:
- email:
text
- name:
text
- signup_date:
date
- user_id:
bigint

user_activities:
- activity_date:
date
- activity_type:
text
- user_id:
bigint


# ANSWER:
```sql
SELECT
FROM user_profiles as up
JOIN user_activities as ua
    ON up.user_id = ua.user_id
WHERE ua.activity_date BETWEEN up.signup_date AND 
      up.signup_date + interval '30 days'
GROUP BY up.user_id and up.signup_date
HAVING COUNT(ua.activity_date) > 0;

```
-------------------------------------------------------------------------


