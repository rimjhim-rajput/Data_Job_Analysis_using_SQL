/*
What skills are required for the top-paying data analyst jobs?
It provides a detailed look at which high-paying jobs demand certain skills, 
helping job seekers understand which skills to develop that align with top salaries
*/

WITH top_paying_jobs AS 
    (SELECT 
        job_id,
        job_title,
        job_location, 
        job_schedule_type,
        round(salary_year_avg,0) AS salary_year_avg, 
        job_posted_date,
        name as company_name
    FROM job_postings_fact
    LEFT JOIN company_dim
    ON job_postings_fact.company_id = company_dim.company_id
    WHERE 
        job_title_short = 'Data Analyst'
        AND job_location = 'Anywhere'
        AND salary_year_avg IS NOT NULL
    ORDER BY salary_year_avg DESC
    LIMIT 10)

SELECT top_paying_jobs.*, skills
FROM top_paying_jobs
INNER JOIN skills_job_dim
ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim
ON skills_dim.skill_id = skills_job_dim.skill_id
ORDER BY salary_year_avg DESC;

/*
Key takeaways from the skills behind the highest-paying data analyst role:
- Comprehensive Skill Set: The top-paying position demands a mix of programming (Python, R), data management (SQL, Pandas), and big data tools (PySpark, Databricks).
- Cloud Expertise: Skills like AWS and Azure appear among the top requirements, reflecting the increasing integration of cloud technologies in data roles.
- Analytical Ecosystem: Tools like Jupyter and Excel indicate that both modern and traditional data tools continue to hold importance.
*/