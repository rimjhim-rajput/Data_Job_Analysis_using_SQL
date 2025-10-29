/*
What are the most optimal skills to learn (aka it’s in high demand and a high-paying skill)?
This helps target skills that offer job security (high demand) and financial benefits (high salaries), 
offering strategic insights for career development in data analysis
*/

SELECT skills, round(avg(salary_year_avg),0) as avg_salary, count(skills) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim
ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim
ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst'
    AND job_work_from_home = 'True'
    AND salary_year_avg IS NOT NULL
GROUP BY skills
HAVING count(skills) > 10
ORDER BY avg_salary DESC
LIMIT 25;

/*
Skills that balance strong demand with high salaries:
- Cloud & Big Data Priority: Tools like Snowflake, Azure, AWS, and BigQuery dominate the optimal skill set, reflecting the migration of analytics workloads to the cloud.
- Engineering-Focused Advantage: Skills such as Go and Hadoop are highly paid and increasingly valuable for scalable data infrastructure roles.
- Strategic Upskilling Areas: Focusing on cloud data platforms offers both job security and salary growth, making them ideal skills for aspiring analysts.
- Industry Trend: The convergence of data analysis, cloud systems, and data engineering defines the most rewarding upskilling path in 2023.
*/