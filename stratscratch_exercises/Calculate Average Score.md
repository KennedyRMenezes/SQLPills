
-------------------------------------------------------------------------
# EXERCISE: 
Calculate Average Score

(https://platform.stratascratch.com/coding/10540-calculate-average-score?code_type=1)

Calculate the average score for each project, but only include projects where more than one team member has provided a score.

Your output should include the project ID and the calculated average score for each qualifying project.

Table: project_data

project_data:
- date:
date
- project_id:
bigint
- score:
bigint
- team_member_id:
bigint


# ANSWER:
```sql
select project_id, avg(score)
from project_data
where project_id in (
    select project_id
    from project_data 
    group by project_id 
    having count(distinct team_member_id) > 1
)
group by project_id;
```

| project_id | team_member_id | score | date       |
|---|---|---|---|
|        101 |              1 |     5 | 2024-07-25 |
|        101 |              2 |     8 | 2024-09-22 |
|        101 |              2 |     3 | 2024-09-24 |
|        101 |              2 |     5 | 2024-10-14 |
|        101 |              6 |     6 | 2024-10-14 |
|        101 |              6 |     5 | 2024-09-13 |
|        102 |              6 |     3 | 2024-09-04 |
|        102 |              6 |     4 | 2024-08-17 |
|        102 |              6 |     3 | 2024-08-22 |
|        102 |              3 |     3 | 2024-08-26 |
|        102 |              1 |     5 | 2024-08-04 |
|        102 |              1 |     2 | 2024-10-12 |
|        102 |              1 |     1 | 2024-08-17 |
|        102 |              4 |     2 | 2024-10-07 |
|        102 |              4 |     2 | 2024-08-24 |
|        102 |              5 |     4 | 2024-07-16 |
|        102 |              5 |     4 | 2024-08-06 |
|        103 |              6 |     4 | 2024-10-14 |
|        103 |              6 |     6 | 2024-08-23 |
|        103 |              4 |     4 | 2024-08-23 |
|        103 |              4 |    93 | 2024-08-14 |
|        103 |              1 |    90 | 2024-09-02 |
|        103 |              1 |    34 | 2024-08-03 |
|        103 |              2 |   100 | 2024-10-02 |
|        103 |              2 |    95 | 2024-08-29 |
|        103 |              3 |    72 | 2024-07-30 |
|        103 |              3 |    87 | 2024-08-15 |
|        103 |              3 |    40 | 2024-07-23 |
|        104 |              4 |     8 | 2024-08-17 |
|        104 |              4 |     8 | 2024-09-17 |
|        104 |              6 |     0 | 2024-07-19 |
|        104 |              6 |     6 | 2024-10-07 |
|        104 |              6 |     7 | 2024-10-15 |
|        104 |              1 |    10 | 2024-07-27 |
|        104 |              1 |     7 | 2024-09-11 |
|        104 |              1 |     2 | 2024-09-13 |
|        104 |              3 |     4 | 2024-09-05 |
|        104 |              3 |     6 | 2024-08-04 |
|        104 |              3 |     7 | 2024-10-04 |
|        104 |              2 |     0 | 2024-08-29 |
|        104 |              2 |     6 | 2024-09-23 |
|        105 |              6 |     1 | 2024-07-09 |
|        105 |              6 |    37 | 2024-08-30 |
|        105 |              6 |    14 | 2024-10-13 |
|        105 |              1 |     5 | 2024-07-18 |
|        106 |             10 |     7 | 2024-11-01 |
|        107 |             11 |     9 | 2024-11-02 |

##### result of subquery
| project_id |
|---|
|        101 |
|        102 |
|        103 |
|        104 |
|        105 |

##### final result
| project_id | avg(score) |
|---|---|
|        101 |     5.3333 |
|        102 |     3.0000 |
|        103 |    56.8182 |
|        104 |     5.4615 |
|        105 |    14.2500 |
-------------------------------------------------------------------------


