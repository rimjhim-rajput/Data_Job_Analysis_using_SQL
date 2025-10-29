/*
What are the top skills based on salary?
It reveals how different skills impact salary levels for Data Analysts and 
helps identify the most financially rewarding skills to acquire or improve
*/

SELECT skills, round(avg(salary_year_avg),0) as avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim
ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim
ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst'
    AND job_work_from_home = 'True'
    AND salary_year_avg IS NOT NULL
GROUP BY skills
ORDER BY avg_salary DESC
LIMIT 25;

/*
Here’s what the highest-paying data analyst skills reveal:
- High-End Technical Tools: Skills like PySpark ($208K) and Bitbucket ($189K) command top salaries, showing strong value for advanced data and engineering capabilities.
- Emerging Technologies: Platforms such as DataRobot and Watson appear among high-paying skills, indicating rising demand for AI and automation-focused expertise.
- Cross-Functional Tools: Development-related tools like GitLab and Bitbucket signal the increasing overlap between analytics and software engineering.
- Advanced Analytics Edge: Mastery of tools like Jupyter and Pandas suggests that hands-on data manipulation and workflow automation directly influence earning potential.
*/