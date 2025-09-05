/*
- Question: What are the top 5 demanded skills to become a Data Scientist?
- The analysis focuses on Data Scientists roles that are specifically available as Remote Jobs.
*/

SELECT 
    skills,
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
    job_postings_fact.job_location = 'Anywhere'
GROUP BY
    skills
ORDER BY
    Demand_Count DESC
LIMIT 5;

/*

For remote Data Scientist roles, Python (10,390 postings) and SQL (7,488 postings) dominate as core skills, 
while R (4,674 postings) adds value in statistical and research-focused work. Beyond programming, 
AWS (2,593 postings) highlights the growing need for cloud expertise, and Tableau (2,458 postings) underscores the 
importance of data visualization and business storytelling.

*/

/*

[
  {
    "skills": "python",
    "demand_count": "10390"
  },
  {
    "skills": "sql",
    "demand_count": "7488"
  },
  {
    "skills": "r",
    "demand_count": "4674"
  },
  {
    "skills": "aws",
    "demand_count": "2593"
  },
  {
    "skills": "tableau",
    "demand_count": "2458"
  }
]

*/

