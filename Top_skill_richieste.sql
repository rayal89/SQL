

SELECT
    COUNT(skills_job_dim.job_id) AS conteggio,
    skills_dim.skills
FROM 
    job_postings_fact as job
INNER JOIN
    skills_job_dim
    ON
    job.job_id=skills_job_dim.job_id
INNER JOIN
    skills_dim
    ON
    skills_dim.skill_id=skills_job_dim.skill_id
WHERE
    job_title_short='Data Analyst'
GROUP by
    skills_dim.skills
ORDER BY
    conteggio DESC
LIMIT 5

