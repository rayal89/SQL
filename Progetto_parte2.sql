--qualii sono le skills piu richieste per i lavori piu pagati


WITH top_lavori AS(
    SELECT
        job_postings_fact.*,
        company_dim.name
    FROM job_postings_fact
    LEFT JOIN
        company_dim
        ON
        company_dim.company_id=job_postings_fact.company_id
    WHERE
        job_location='Anywhere' 
        AND
        job_title_short='Data Analyst'
        AND
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)

SELECT
    skills_dim.skills,
    top_lavori.*
FROM
    top_lavori
INNER JOIN
    skills_job_dim
    ON
    skills_job_dim.job_id=top_lavori.job_id
INNER JOIN
    skills_dim
    ON
    skills_dim.skill_id=skills_job_dim.skill_id