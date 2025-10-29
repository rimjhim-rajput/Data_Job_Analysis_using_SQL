/*
What are the most in-demand skills for data analysts?
Retrieves the top 5 skills with the highest demand in the job market, 
providing insights into the most valuable skills for job seekers.
*/

SELECT skills, count(*) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim
ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim
ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst'
GROUP BY skills
ORDER BY demand_count DESC
LIMIT 5;

/*
Insights into the most in-demand data analyst skills in 2023:
- SQL Dominance: With over 92,000 mentions, SQL remains the most essential skill for any data analyst role.
- Foundational Tools: Excel still holds a strong position, highlighting its continued relevance in day-to-day analytics.
- Programming Importance: Python ranks third, reflecting the growing shift toward automation, scripting, and machine learning in analytics.
- Visualization Demand: Tableau and Power BI round out the top 5, reinforcing the need for strong data storytelling and presentation abilities.
- Balanced Skill Profile: The top skills span data extraction, analysis, and visualization, defining the core competencies of modern data analysts.
*/