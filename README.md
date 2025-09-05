# SQL Project: Job Data Analysis for Data Scientists
## Project Overview
This project analyzes job postings data to uncover insights about Data Scientist roles, focusing on salaries, skill demand, and optimal skills for career growth. The analysis was conducted using PostgreSQL, with CSV datasets imported into tables for querying.

### The main goals of this project are:

1. Identify the top-paying jobs for the Data Scientist role.

2. Determine the skills required for these top-paying jobs.

3. Find the most in-demand skills for Data Scientist positions.

4. Discover the top skills based on salary.

5. Suggest the most optimal skills for learning to maximize both demand and salary.

## Project Structure
``` bash
SQL_Project_Job_Data_Analysis/
│
├── Queries/                  # SQL queries for analysis
│   ├── 1_top_paying_jobs.sql
│   ├── 2_top_paying_job_skills.sql
│   ├── 3_top_demanded_skills.sql
│   ├── 4_top_paying_skills.sql
│   └── 5_optimal_skills.sql
│
├── Result_Data/              # Query results
│   ├── 1_top_paying_jobs.csv
│   ├── 2_top_paying_jobs_skills.csv
│   ├── 3_top_demanded_skills.csv
│   ├── 4_top_paying_skills.csv
│   └── 5_optimal_skills.csv
│
├── table creation files/     # SQL files for database setup
│   ├── 1_create_database.sql
│   ├── 2_create_tables.sql
│   └── 3_modify_tables.sql
│
└── README.md
```

## Tools Used
- **SQL** – Writing queries to analyze job data
- **PostgreSQL** – Database for storing and managing datasets
- **VS Code** – Code editor for writing SQL scripts and managing files
- **Git & GitHub** – Version control and repository hosting

## Dataset Information

The project uses the following CSV files (imported into PostgreSQL tables):

- ***company_dim.csv*** – Contains company information including names and links.
- ***job_postings_fact.csv*** – Contains job posting details with salary information.
- ***skills_dim.csv*** – Contains skill names and their categories/types.
- ***skills_job_dim.csv*** – Junction table connecting jobs to their required skills.

## Key Insights

**1. Top-Paying Jobs**

Remote Data Scientist salaries range from $300K to $550K, mostly around $325K–$350K. These high-paying roles are mainly senior-level positions (Head of Data Science, Director, Principal, Staff Data Scientist), with only one standard Data Scientist role in the top 10.

**2. Skills Required for Top-Paying Jobs**

Python and SQL are consistent must-haves across both technical and business-oriented roles.

- Cloud platforms (AWS) and big data tools (Spark) show focus on scalable data handling and deployment.
- TensorFlow emphasizes the importance of advanced ML/DL expertise for senior roles.

**3. Most In-Demand Skills**

- Python and SQL dominate.
- R adds value for research/statistics.
- AWS highlights cloud expertise demand.
- Tableau shows the need for visualization and business storytelling.

**4. Top Skills Based on Salary**

- Core skills (Python, SQL) are essential but don’t top salaries.
- Specialized/rare skills (GDPR, Golang, OpenCV) are less common but command higher pay, showing scarcity drives compensation.
- Path to top salary: Combine core proficiency with niche expertise.

**5. Most Optimal Skills to Learn**

- High-demand foundation skills: Python, SQL, AWS, Tableau, Spark.
- Specialized pay-boosting skills: C, Go, BigQuery, Looker.
- Optimal combination: Mastering both foundational and niche skills positions candidates for highest salaries and best remote opportunities.

## Conclusion

This project provides actionable insights for aspiring or current Data Scientists by highlighting salary trends, high-demand skills, and optimal skill combinations for remote roles. It demonstrates how SQL and relational databases can be leveraged to extract meaningful career insights from structured job data.
