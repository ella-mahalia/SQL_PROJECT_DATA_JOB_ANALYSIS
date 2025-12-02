/*
What are the most in-demand skills for data engineer/data analyst jobs?
- Identify the top skills required for data engineer/data analyst roles from the job postings data.
- Why? Understanding the most sought-after skills can help job seekers focus their learning and development efforts to enhance their employability in the data field.
*/

SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short LIKE '%Data%'
    AND  job_work_from_home = TRUE
GROUP BY 
    skills
ORDER BY 
    demand_count DESC
LIMIT 5
