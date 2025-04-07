/*
quali sono i lavori piu pagati per ruolo
qualii sono le skills piu richieste per i lavori piu pagati
quali sono le skill piu richieste per i ruolii
quali sono le migliori skill in base al salrio per ruolo
quali sono le migliori skill da imparare

*/


--quali sono i lavori piu pagati per data analyst
--identificare i 10 lavori piu pagati come data analyst che sono disponibili da remoto
--focalizzati su lavori postati con specifici salari togliere i nulli
--perche 


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

--








