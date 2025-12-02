/*
- What is the most optimial skills for high paying data engineer/data analyst jobs?
- Average salary for data engineer/data analyst roles based on skills from the job postings data.
- Why? Understanding the skills associated with higher salaries can help job seekers prioritize their learning and development
*/

SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 0) AS average_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id

WHERE 
    job_title_short LIKE '%Data%'
    AND salary_year_avg IS NOT NULL
    
GROUP BY 
    skills
ORDER BY
    average_salary DESC
LIMIT 25