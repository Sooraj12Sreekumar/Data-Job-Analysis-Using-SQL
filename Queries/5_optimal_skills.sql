/*
- Question: What are the most optimal skills to learn to become a Data Sceintist.
- The analysis focuses on identifying skills that are not only in high demand but also among 
the highest paying for remote Data Scientist roles.
- The insights focuses on Data Scientists roles that are specifically available as Remote Jobs.
*/


WITH skills_demand AS (
    SELECT 
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) AS Demand_Count
    FROM job_postings_fact
    INNER JOIN
        skills_job_dim
    ON
        job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN
        skills_dim
    ON
        skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_postings_fact.job_title_short = 'Data Scientist' AND
        job_postings_fact.job_location = 'Anywhere' AND
        job_postings_fact.salary_year_avg IS NOT NULL
    GROUP BY
        skills_dim.skill_id
), average_salary AS (
    SELECT 
        skills_job_dim.skill_id,
        ROUND(AVG(job_postings_fact.salary_year_avg),0) AS avg_salary
    FROM job_postings_fact
    INNER JOIN
        skills_job_dim
    ON
        job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN
        skills_dim
    ON
        skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_postings_fact.job_title_short = 'Data Scientist' AND
        job_postings_fact.job_location = 'Anywhere' AND
        job_postings_fact.salary_year_avg IS NOT NULL
    GROUP BY
        skills_job_dim.skill_id
)

SELECT
    skills_demand.skill_id,
    skills_demand.skills,
    skills_demand.Demand_Count,
    average_salary.avg_salary
FROM
    skills_demand
INNER JOIN
    average_salary
ON
    skills_demand.skill_id = average_salary.skill_id
WHERE
    Demand_Count > 25
ORDER BY
    avg_salary DESC,
    Demand_Count DESC
LIMIT 25;

/*
- Core skills rule the market: Python (763 postings, $143,828), SQL (591, $142,833), AWS (217, $149,630), Tableau (219, $146,970), and Spark (149, $150,188) are in highest demand, forming the foundation for most remote Data Scientist roles.
- Specialized skills boost pay: Rare skills like C (48 postings, $164,865), Go (57, $164,691), BigQuery (36, $157,142), and Looker (57, $158,715) command higher salaries despite lower demand, rewarding niche expertise.
- Combination is key: Mastering both high-demand skills (Python, SQL, AWS, Tableau, Spark) and specialized skills (C, Go, BigQuery, Looker) positions candidates for the best remote opportunities and top-tier salaries.

/*
[
  {
    "skill_id": 26,
    "skills": "c",
    "demand_count": "48",
    "avg_salary": "164865"
  },
  {
    "skill_id": 8,
    "skills": "go",
    "demand_count": "57",
    "avg_salary": "164691"
  },
  {
    "skill_id": 185,
    "skills": "looker",
    "demand_count": "57",
    "avg_salary": "158715"
  },
  {
    "skill_id": 77,
    "skills": "bigquery",
    "demand_count": "36",
    "avg_salary": "157142"
  },
  {
    "skill_id": 3,
    "skills": "scala",
    "demand_count": "56",
    "avg_salary": "156702"
  },
  {
    "skill_id": 81,
    "skills": "gcp",
    "demand_count": "59",
    "avg_salary": "155811"
  },
  {
    "skill_id": 80,
    "skills": "snowflake",
    "demand_count": "72",
    "avg_salary": "152687"
  },
  {
    "skill_id": 101,
    "skills": "pytorch",
    "demand_count": "115",
    "avg_salary": "152603"
  },
  {
    "skill_id": 78,
    "skills": "redshift",
    "demand_count": "36",
    "avg_salary": "151708"
  },
  {
    "skill_id": 99,
    "skills": "tensorflow",
    "demand_count": "126",
    "avg_salary": "151536"
  },
  {
    "skill_id": 92,
    "skills": "spark",
    "demand_count": "149",
    "avg_salary": "150188"
  },
  {
    "skill_id": 76,
    "skills": "aws",
    "demand_count": "217",
    "avg_salary": "149630"
  },
  {
    "skill_id": 94,
    "skills": "numpy",
    "demand_count": "73",
    "avg_salary": "149089"
  },
  {
    "skill_id": 106,
    "skills": "scikit-learn",
    "demand_count": "81",
    "avg_salary": "148964"
  },
  {
    "skill_id": 95,
    "skills": "pyspark",
    "demand_count": "34",
    "avg_salary": "147544"
  },
  {
    "skill_id": 182,
    "skills": "tableau",
    "demand_count": "219",
    "avg_salary": "146970"
  },
  {
    "skill_id": 2,
    "skills": "nosql",
    "demand_count": "31",
    "avg_salary": "146110"
  },
  {
    "skill_id": 4,
    "skills": "java",
    "demand_count": "64",
    "avg_salary": "145706"
  },
  {
    "skill_id": 93,
    "skills": "pandas",
    "demand_count": "113",
    "avg_salary": "144816"
  },
  {
    "skill_id": 1,
    "skills": "python",
    "demand_count": "763",
    "avg_salary": "143828"
  },
  {
    "skill_id": 108,
    "skills": "matplotlib",
    "demand_count": "40",
    "avg_salary": "143824"
  },
  {
    "skill_id": 97,
    "skills": "hadoop",
    "demand_count": "82",
    "avg_salary": "143322"
  },
  {
    "skill_id": 0,
    "skills": "sql",
    "demand_count": "591",
    "avg_salary": "142833"
  },
  {
    "skill_id": 74,
    "skills": "azure",
    "demand_count": "122",
    "avg_salary": "142306"
  },
  {
    "skill_id": 100,
    "skills": "keras",
    "demand_count": "39",
    "avg_salary": "141634"
  }
]
*/








