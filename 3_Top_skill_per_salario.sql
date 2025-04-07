-- Si valuta le skill piu richieste in base ai lavori più pagati considerando un numero di lavori postati per quella skill non inferiore a 100

WITH prova as(
    SELECT
        COUNT(skills_job_dim.job_id) AS conteggio,
        skills_dim.skills,
        round(AVG(job.salary_year_avg),0) AS salario_medio
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
        AND
        job.salary_year_avg IS NOT NULL
    GROUP by
        skills_dim.skills
    ORDER BY
        salario_medio DESC
    
)

SELECT
    prova.*
FROM 
    prova
WHERE
    conteggio>100
