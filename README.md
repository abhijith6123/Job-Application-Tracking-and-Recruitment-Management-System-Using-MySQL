Job Application Tracking and Recruitment Management System
Project Banner

Overview
A lightweight Job Application Tracking and Recruitment Management System built with MySQL as the database backend and a set of SQL scripts to manage candidates, job postings, applications, interviews, and recruitment workflow. The system is designed for small to medium-sized recruitment teams who need a simple, self‑hosted solution without the overhead of full‑featured ATS platforms.

Features
Candidate Management: Store personal details, resumes, contact information, and status.
Job Posting Management: Create, edit, and archive job listings.
Application Tracking: Record each candidate's application per job, track stages (applied, screened, interviewed, offered, hired, rejected).
Interview Scheduling: Log interview dates, interviewers, feedback, and outcomes.
Reporting: Simple aggregate queries for pipeline health, time‑to‑hire, and source effectiveness.
Export/Import: Easy data dump and restore via the supplied SQL script.
Tech Stack
Database: MySQL 8.x (or compatible MariaDB)
SQL: Pure SQL scripts – no additional server‑side language required.
Version Control: Git (hosted on GitHub)
Getting Started
Prerequisites
MySQL server installed locally or accessible remotely.
Git client (optional, for cloning the repo).
Setup Steps
Clone the repository (if you haven't already):

bash

git clone https://github.com/abhijith6123/Job-Application-Tracking-and-Recruitment-Management-System-Using-MySQL.git
cd Job-Application-Tracking-and-Recruitment-Management-System-Using-MySQL
Create a new database:

sql

CREATE DATABASE job_tracker CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
Import the provided SQL script (Job Application Tracking and Recruitment Management System Using MySQL.sql):

bash

mysql -u <username> -p job_tracker < "Job Application Tracking and Recruitment Management System Using MySQL.sql"
Replace <username> with your MySQL user.

Verify the schema (optional):

sql

SHOW TABLES IN job_tracker;
You should see tables like candidates, jobs, applications, interviews, etc.

Using the System
Since the system is purely SQL‑based, you interact with it via MySQL client tools (MySQL Workbench, DBeaver, CLI, etc.). Below are a few example queries:

Add a candidate:

sql

INSERT INTO candidates (first_name, last_name, email, phone, resume_link, status)
VALUES ('John', 'Doe', 'john.doe@example.com', '+1234567890', 'https://example.com/resume.pdf', 'Active');
Create a job posting:

sql

INSERT INTO jobs (title, department, location, description, posted_date, status)
VALUES ('Software Engineer', 'Engineering', 'Remote', 'Develop awesome features.', CURDATE(), 'Open');
Record an application:

sql

INSERT INTO applications (candidate_id, job_id, applied_date, current_stage)
VALUES (1, 1, CURDATE(), 'Screening');
Schedule an interview:

sql

INSERT INTO interviews (application_id, interview_date, interviewer, feedback, outcome)
VALUES (1, DATE_ADD(CURDATE(), INTERVAL 3 DAY), 'Jane Smith', NULL, NULL);
Generate a simple pipeline report:

sql

SELECT j.title, COUNT(a.id) AS total_applications,
       SUM(CASE WHEN a.current_stage = 'Offered' THEN 1 ELSE 0 END) AS offers,
       SUM(CASE WHEN a.current_stage = 'Hired' THEN 1 ELSE 0 END) AS hires
FROM jobs j
LEFT JOIN applications a ON j.id = a.job_id
GROUP BY j.id;
Contributing
Contributions are welcome! Feel free to:

Add new tables or columns for additional tracking fields.
Write stored procedures or views for common reports.
Improve documentation or add sample data.
Fork the repository.
Create a feature branch.
Commit your changes with clear messages.
Open a Pull Request.
License
This project is licensed under the MIT License – see the LICENSE file for details.

If you have any questions or need assistance, please open an issue on the GitHub repository.

