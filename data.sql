USE job_portal;

-- Candidates data
INSERT INTO candidates (name, city, experience_years)
VALUES
('Ayesha', 'Hyderabad', 1),
('Rishi', 'Bangalore', 3),
('Neha', 'Pune', 2),
('Arjun', 'Chennai', 5),
('Ahana', 'Hyderabad', 0);

-- Companies data
INSERT INTO companies (company_name, industry, city)
VALUES
('Infosys', 'IT', 'Bangalore'),
('Amazon', 'E-commerce', 'Hyderabad'),
('TCS', 'IT', 'Mumbai'),
('Flipkart', 'E-commerce', 'Bangalore');

-- Jobs data
INSERT INTO jobs (company_id, job_title, salary, job_type, posted_date)
VALUES
(1, 'Data Analyst', 600000, 'Full-time', '2025-01-10'),
(2, 'Business Analyst', 800000, 'Full-time', '2025-01-15'),
(3, 'SQL Developer', 550000, 'Full-time', '2025-02-01'),
(4, 'Operations Analyst', 500000, 'Internship', '2025-02-05');

-- Applications data
INSERT INTO applications (job_id, candidate_id, status, application_date)
VALUES
(1, 1, 'Applied', '2025-01-12'),
(1, 2, 'Interview', '2025-01-13'),
(2, 3, 'Selected', '2025-01-20'),
(3, 2, 'Applied', '2025-02-03'),
(3, 4, 'Interview', '2025-02-05'),
(2, 1, 'Rejected', '2025-01-22');
