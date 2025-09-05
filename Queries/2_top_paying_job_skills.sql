/*
- Question: What are the skills that are required for the top
paying data science jobs?
- The insights focuses on Data Scientists roles that are specifically available as Remote Jobs.
*/

WITH top_paying_jobs AS (
    SELECT
        job_id,
        job_title,
        name AS Company_name,
        salary_year_avg
    FROM
        job_postings_fact
    LEFT JOIN
        company_dim
    ON
        job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short = 'Data Scientist' AND
        job_location = 'Anywhere' AND
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)

SELECT 
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN
    skills_job_dim
ON
    top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN
    skills_dim
ON
    skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg;

/*
- Python and SQL appear most consistently, making them core requirements for both technical and business-focused data science roles.
- Cloud platforms like AWS and big data tools like Spark show that companies prioritize scalable data handling and deployment skills.
- TensorFlow highlights the demand for advanced machine learning and deep learning expertise, especially in senior and director-level positions.

*/

/*
[
  {
    "job_id": 226011,
    "job_title": "Distinguished Data Scientist",
    "company_name": "Walmart",
    "salary_year_avg": "300000.0",
    "skills": "scala"
  },
  {
    "job_id": 38905,
    "job_title": "Principal Data Scientist",
    "company_name": "Storm5",
    "salary_year_avg": "300000.0",
    "skills": "java"
  },
  {
    "job_id": 457991,
    "job_title": "Head of Battery Data Science",
    "company_name": "Lawrence Harvey",
    "salary_year_avg": "300000.0",
    "skills": "python"
  },
  {
    "job_id": 457991,
    "job_title": "Head of Battery Data Science",
    "company_name": "Lawrence Harvey",
    "salary_year_avg": "300000.0",
    "skills": "aws"
  },
  {
    "job_id": 457991,
    "job_title": "Head of Battery Data Science",
    "company_name": "Lawrence Harvey",
    "salary_year_avg": "300000.0",
    "skills": "gcp"
  },
  {
    "job_id": 38905,
    "job_title": "Principal Data Scientist",
    "company_name": "Storm5",
    "salary_year_avg": "300000.0",
    "skills": "sql"
  },
  {
    "job_id": 38905,
    "job_title": "Principal Data Scientist",
    "company_name": "Storm5",
    "salary_year_avg": "300000.0",
    "skills": "python"
  },
  {
    "job_id": 38905,
    "job_title": "Principal Data Scientist",
    "company_name": "Storm5",
    "salary_year_avg": "300000.0",
    "skills": "gcp"
  },
  {
    "job_id": 38905,
    "job_title": "Principal Data Scientist",
    "company_name": "Storm5",
    "salary_year_avg": "300000.0",
    "skills": "aws"
  },
  {
    "job_id": 38905,
    "job_title": "Principal Data Scientist",
    "company_name": "Storm5",
    "salary_year_avg": "300000.0",
    "skills": "c"
  },
  {
    "job_id": 226011,
    "job_title": "Distinguished Data Scientist",
    "company_name": "Walmart",
    "salary_year_avg": "300000.0",
    "skills": "kubernetes"
  },
  {
    "job_id": 226011,
    "job_title": "Distinguished Data Scientist",
    "company_name": "Walmart",
    "salary_year_avg": "300000.0",
    "skills": "pytorch"
  },
  {
    "job_id": 226011,
    "job_title": "Distinguished Data Scientist",
    "company_name": "Walmart",
    "salary_year_avg": "300000.0",
    "skills": "tensorflow"
  },
  {
    "job_id": 226011,
    "job_title": "Distinguished Data Scientist",
    "company_name": "Walmart",
    "salary_year_avg": "300000.0",
    "skills": "spark"
  },
  {
    "job_id": 226011,
    "job_title": "Distinguished Data Scientist",
    "company_name": "Walmart",
    "salary_year_avg": "300000.0",
    "skills": "java"
  },
  
]

*/
