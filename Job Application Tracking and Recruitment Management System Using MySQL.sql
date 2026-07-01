CREATE DATABASE JobTrackingSystem;
USE JobTrackingSystem;

CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    experience_years INT,
    skills TEXT
);

SELECT * FROM users;

INSERT INTO Users(full_name,email,phone,experience_years,skills)
VALUES ('Hari Prasath','hari@gmail.com','9876543210',2,'SQL, Python, Java');

SELECT * FROM users;

CREATE TABLE Companies (
    company_id INT PRIMARY KEY AUTO_INCREMENT,
    company_name VARCHAR(100),
    location VARCHAR(100),
    industry VARCHAR(100)
);

SELECT * FROM Companies;

INSERT INTO Companies(company_name,location,industry)
VALUES ('TCS','Chennai','IT Services');

SELECT * FROM Companies;

CREATE TABLE Recruiters (
    recruiter_id INT PRIMARY KEY AUTO_INCREMENT,
    company_id INT,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15)
);

SELECT * FROM Recruiters;

INSERT INTO Recruiters(company_id,name,email,phone)
VALUES (1,'Ravi HR','ravi@tcs.com','9000011111');

SELECT * FROM Recruiters;

CREATE TABLE Jobs (
    job_id INT PRIMARY KEY AUTO_INCREMENT,
    company_id INT,
    recruiter_id INT,
    job_title VARCHAR(100),
    job_description TEXT,
    job_location VARCHAR(100),
    salary DECIMAL(10,2),
    job_type VARCHAR(50),
    posted_date DATE
);

 SELECT * FROM Jobs;
 
INSERT INTO Jobs(company_id,recruiter_id,job_title,job_description,job_location,salary,job_type,posted_date)
VALUES (1,1,'SQL Developer','DB handling role','Chennai',300000,'Full-time',CURDATE());
 
 SELECT * FROM Jobs;

CREATE TABLE Resumes (
    resume_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    resume_link TEXT
);

SELECT * FROM Resumes;

INSERT INTO Resumes(user_id,resume_link)
VALUES (1,'/resumes/hari.pdf');

SELECT * FROM Resumes;

CREATE TABLE Applications (
    application_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    job_id INT,
    resume_id INT,
    applied_date DATE,
    status VARCHAR(50)
);

SELECT * FROM Applications;

INSERT INTO Applications(user_id,job_id,resume_id,applied_date,status)
VALUES (1,1,1,CURDATE(),'Applied');

UPDATE Applications SET status='In Review' WHERE application_id=1;

SELECT * FROM Applications;

CREATE TABLE Interviews (
    interview_id INT PRIMARY KEY AUTO_INCREMENT,
    application_id INT,
    interview_date DATE,
    interview_mode VARCHAR(50),
    interview_status VARCHAR(50),
    feedback TEXT
);

SELECT * FROM Interviews;

INSERT INTO Interviews(application_id,interview_date,interview_mode,interview_status,feedback)
VALUES (1,'2026-07-01','Online','Scheduled','Good communication');

CREATE TABLE Notifications (
    notification_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    message TEXT
);

SELECT * FROM Notifications; 

INSERT INTO Notifications(user_id,message)
VALUES (1,'Your application is under review');

SELECT * FROM Notifications; 

UPDATE Applications SET status='Selected' WHERE application_id=1;

CREATE TABLE Status_History (
    history_id INT PRIMARY KEY AUTO_INCREMENT,
    application_id INT,
    old_status VARCHAR(50),
    new_status VARCHAR(50),
    changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

SELECT * FROM Status_History;

INSERT INTO Status_History(application_id,old_status,new_status)
VALUES (1,'In Review','Selected');


SELECT * FROM Status_History;