/*
What skills are requirted for the top-paying data engineer/data analyst jobs?
- The top highest paying Data Analyst jobs from the first query
- The skills required for these jobs from the skills_job_dim and skills_dim tables
- Why? It provides insights into the skills that are in demand for high-paying roles, helping job seekers tailor their skillsets accordingly.
*/

WITH top_paying_jobs AS (
    SELECT 
        job_id,
        job_title,
        salary_year_avg,
        name AS company_name
    FROM job_postings_fact
    LEFT JOIN company_dim
        ON job_postings_fact.company_id = company_dim.company_id
    WHERE 
        job_postings_fact.job_title_short LIKE '%Data%'
        AND job_postings_fact.job_location = 'New Jersey'
        AND job_postings_fact.salary_year_avg IS NOT NULL
    ORDER BY
        job_postings_fact.salary_year_avg DESC
    LIMIT 10
)
SELECT 
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim AS sjd ON top_paying_jobs.job_id = sjd.job_id
INNER JOIN skills_dim AS sd ON sjd.skill_id = sd.skill_id
ORDER BY salary_year_avg DESC;