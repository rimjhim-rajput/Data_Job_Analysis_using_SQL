/*
What are the top-paying data analyst jobs?
This highlights the top-paying opportunities for Data Analysts,
offering insights into employment options and location flexibility.
*/

SELECT 
    job_id,
    job_title,
    job_location, 
    job_schedule_type,
    round(salary_year_avg,0) as salary_year_avg, 
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
LIMIT 10;

/*
INSIGHTS GAINED FROM THE RESULTS OF THIS QUERY:
- Wide Salary Range: The top 10 paying data analyst roles span from $184,000 to $650,000, showing a large variation based on seniority and specialization.
- Diverse Employers: Companies like SmartAsset, Meta, and AT&T are leading in compensation, indicating strong analytics adoption across different industries.
- Role Diversity: Job titles range from Data Analyst to Director of Analytics and Principal Analyst, highlighting multiple career paths and levels within analytics.
*/