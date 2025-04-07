-- Quali sono i lavori piu pagati per il ruolo di Data Analyst

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










