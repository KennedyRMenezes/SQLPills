
-------------------------------------------------------------------------
# EXERCISE: 
Second Highest Salary

(https://platform.stratascratch.com/coding/10543-second-highest-salary?code_type=1)

Identify the second-highest salary in each department.

Your output should include the department, the second highest salary, and the employee ID. Do not remove duplicate salaries when ordering salaries, and apply the rankings without a gap in the rank. For example, if multiple employees share the same highest salary, the second-highest salary will be the next salary that is lower than the highest salaries.

Table: employee_data

employee_data:
- department:
text
- employee_id:
bigint
- hire_date:
date
- rank:
double precision
- salary:
bigint


# ANSWER:
```sql
WITH RankedSalary as (
    SELECT department,
            salary,
            employee_id,
            dense_rank() over (partition by department order by salary desc) as rank
    from employee_data
)
SELECT department,
        salary as second_highest_salary,
        employee_id
from RankedSalary
where rank = 2
```

|department	|second_highest_salary	|employee_id
|---|---|---|
|HR	|90000	|7
|Marketing	|110000	|1
|Marketing	|110000	|5
|Marketing	|110000	|12
|Sales	|60000	|6
|Sales	|60000	|15

-------------------------------------------------------------------------


