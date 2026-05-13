DROP DATABASE IF EXISTS Employee_Management_DB;
CREATE DATABASE Employee_Management_DB;
USE Employee_Management_DB;

CREATE TABLE departments (
    dept_id INT AUTO_INCREMENT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL,
    location VARCHAR(50)
);

INSERT INTO departments (dept_name, location) VALUES
('Engineering', 'New York'),
('Human Resource', 'Chicago'),
('Finance', 'Los Angeles'),
('Marketing', 'Houston');

CREATE TABLE roles (
    role_id INT AUTO_INCREMENT PRIMARY KEY,
    role_name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

INSERT INTO roles (role_name, dept_id) VALUES
('Software Engineer', 1),
('Senior Engineer', 1),
('HR Manager', 2),
('Accountant', 3),
('Marketing Executive', 4);

CREATE TABLE employees (
    emp_id VARCHAR(10) PRIMARY KEY,
    emp_name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(20),
    salary DECIMAL(10,2),
    join_date DATE,
    dept_id INT,
    role_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id),
    FOREIGN KEY (role_id) REFERENCES roles(role_id)
);

INSERT INTO employees VALUES
('EMP001','Alex Chen','alex@gmail.com','01711111111',95000,'2020-01-10',1,2),
('EMP002','Maria Santos','maria@gmail.com','01722222222',75000,'2021-03-15',1,1),
('EMP003','James Okafor','james@gmail.com','01733333333',88000,'2019-05-20',2,3),
('EMP004','Priya Nair','priya@gmail.com','01744444444',62000,'2022-07-01',2,3),
('EMP005','David Kim','david@gmail.com','01755555555',92000,'2018-09-12',3,4),
('EMP006','Omar Hassan','omar@gmail.com','01766666666',70000,'2023-02-10',4,5);

CREATE TABLE attendance (
    att_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_id VARCHAR(10),
    att_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);

INSERT INTO attendance VALUES
(1,'EMP001','2026-05-08','Present'),
(2,'EMP002','2026-05-08','Present'),
(3,'EMP003','2026-05-08','Late'),
(4,'EMP004','2026-05-08','Absent'),
(5,'EMP005','2026-05-08','Present'),
(6,'EMP006','2026-05-08','Late');

CREATE TABLE leave_request (
    leave_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_id VARCHAR(10),
    leave_type VARCHAR(30),
    from_date DATE,
    to_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);

INSERT INTO leave_request VALUES
(1,'EMP002','Annual Leave','2026-05-20','2026-05-22','Pending'),
(2,'EMP004','Medical Leave','2026-05-01','2026-05-05','Approved');

CREATE TABLE payroll (
    payroll_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_id VARCHAR(10),
    pay_month VARCHAR(20),
    basic_salary DECIMAL(10,2),
    bonus DECIMAL(10,2),
    deduction DECIMAL(10,2),
    net_salary DECIMAL(10,2),
    payment_status VARCHAR(20),
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);

INSERT INTO payroll VALUES
(1,'EMP001','April 2026',95000,5000,18000,82000,'Paid'),
(2,'EMP002','April 2026',75000,3000,14000,64000,'Paid'),
(3,'EMP003','April 2026',88000,4000,16000,76000,'Paid'),
(4,'EMP004','April 2026',62000,2000,9000,55000,'Unpaid'),
(5,'EMP005','April 2026',92000,5000,17500,79500,'Paid');

CREATE TABLE training (
    training_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_id VARCHAR(10),
    course_name VARCHAR(100),
    provider VARCHAR(50),
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);

INSERT INTO training VALUES
(1,'EMP001','Advanced System Design','Coursera'),
(2,'EMP002','React Development','Udemy'),
(3,'EMP003','HR Analytics','LinkedIn'),
(4,'EMP005','Financial Modelling','CFI');

CREATE TABLE performance (
    performance_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_id VARCHAR(10),
    review_period VARCHAR(20),
    rating VARCHAR(20),
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);

INSERT INTO performance VALUES
(1,'EMP001','Q1 2026','Excellent'),
(2,'EMP002','Q1 2026','Good'),
(3,'EMP003','Q1 2026','Excellent'),
(4,'EMP004','Q1 2026','Average');
