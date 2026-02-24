CREATE DATABASE job_portal;
USE job_portal;

-- Candidates table
CREATE TABLE candidates (
    candidate_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    city VARCHAR(50),
    experience_years INT
);

-- Companies table
CREATE TABLE companies (
    company_id INT PRIMARY KEY AUTO_INCREMENT,
    company_name VARCHAR(50),
    industry VARCHAR(50),
    city VARCHAR(50)
);

-- Jobs table
CREATE TABLE jobs (
    job_id INT PRIMARY KEY AUTO_INCREMENT,
    company_id INT,
    job_title VARCHAR(50),
    salary INT,
    job_type VARCHAR(20),
    posted_date DATE,
    FOREIGN KEY (company_id) REFERENCES companies(company_id)
);

-- Applications table
CREATE TABLE applications (
    application_id INT PRIMARY KEY AUTO_INCREMENT,
    job_id INT,
    candidate_id INT,
    status VARCHAR(20),
    application_date DATE,
    FOREIGN KEY (job_id) REFERENCES jobs(job_id),
    FOREIGN KEY (candidate_id) REFERENCES candidates(candidate_id)
);
