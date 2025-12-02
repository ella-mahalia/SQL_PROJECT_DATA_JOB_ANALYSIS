/* Idenitfy the top 5 highest paying jobs based on average salary */
/* Focus on job postings with specified salaries */

/* Highlighing the top-paying opportunities for Data Analysts, offering insights into employment opportunities and salary trends */

SELECT 
    j.job_id,
    j.job_title,
    j.job_location,
    j.job_schedule_type,
    j.salary_year_avg,
    j.job_posted_date,
    c.name AS company_name
FROM job_postings_fact AS j
LEFT JOIN company_dim AS c 
    ON j.company_id = c.company_id
WHERE 
    j.job_title_short LIKE '%Data%'
    AND j.job_location = 'New Jersey'
    AND j.salary_year_avg IS NOT NULL
ORDER BY
    j.salary_year_avg DESC
LIMIT 10;

    