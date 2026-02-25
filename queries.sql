USE job_portal;

-- 1. Total number of applications
SELECT COUNT(*) AS total_applications
FROM applications;

-- 2. Applications per job
SELECT 
    job_id,
    COUNT(*) AS applications_per_job
FROM applications
GROUP BY job_id;

-- 3. Applications per status
SELECT 
    status,
    COUNT(*) AS total_applications
FROM applications
GROUP BY status;

-- 4. Candidate name + job title for all applications
SELECT 
    candidates.name AS candidate_name,
    jobs.job_title
FROM applications
JOIN candidates 
    ON applications.candidate_id = candidates.candidate_id
JOIN jobs 
    ON applications.job_id = jobs.job_id;

-- 5. Job that received the highest number of applications
SELECT 
    jobs.job_title,
    COUNT(*) AS application_count
FROM applications
JOIN jobs 
    ON applications.job_id = jobs.job_id
GROUP BY jobs.job_title
ORDER BY application_count DESC
LIMIT 1;

-- 6. Selection count per job
SELECT 
    jobs.job_title,
    COUNT(*) AS selected_count
FROM applications
JOIN jobs 
    ON applications.job_id = jobs.job_id
WHERE applications.status = 'Selected'
GROUP BY jobs.job_title;

-- 7. Average experience of selected candidates
SELECT 
    AVG(candidates.experience_years) AS avg_experience_selected
FROM applications
JOIN candidates 
    ON applications.candidate_id = candidates.candidate_id
WHERE applications.status = 'Selected';

-- 8. Classify candidates as Fresher or Experienced
SELECT 
    name,
    experience_years,
    CASE
        WHEN experience_years = 0 THEN 'Fresher'
        ELSE 'Experienced'
    END AS candidate_type
FROM candidates;

-- 9. Jobs with applications more than average (SUBQUERY)
SELECT job_id
FROM applications
GROUP BY job_id
HAVING COUNT(*) >
(
    SELECT AVG(app_count)
    FROM (
        SELECT COUNT(*) AS app_count
        FROM applications
        GROUP BY job_id
    )
);
-- 10. Candidates who applied to more than one job
SELECT candidate_id
FROM applications
GROUP BY candidate_id
HAVING COUNT(DISTINCT job_id) > 1;
