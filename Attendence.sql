CREATE DATABASE IF NOT EXISTS Employee_Management_DB;

USE Employee_Management_DB;


CREATE TABLE IF NOT EXISTS departments (
    dept_id INT AUTO_INCREMENT PRIMARY KEY,
    dept_name VARCHAR(50)
);

INSERT INTO departments (dept_name) VALUES
('HR'),
('IT'),
('Finance'),
('Marketing');


CREATE TABLE IF NOT EXISTS employees (
    emp_id VARCHAR(10) PRIMARY KEY,
    emp_name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20),
    salary DECIMAL(10,2),
    dept_id INT,

    FOREIGN KEY (dept_id)
    REFERENCES departments(dept_id)
);

INSERT INTO employees
(emp_id, emp_name, email, phone, salary, dept_id)
VALUES
('EMP001', 'Reshad Rahim', 'reshad@gmail.com', '01711111111', 30000, 1),
('EMP002', 'Sunzida Akter', 'sunzida@gmail.com', '01722222222', 35000, 2),
('EMP003', 'Nabil Hasan', 'nabil@gmail.com', '01733333333', 32000, 2),
('EMP004', 'Ashik Ahmed', 'ashik@gmail.com', '01744444444', 28000, 3),
('EMP005', 'Afsana Jahan', 'afsana@gmail.com', '01755555555', 31000, 4),
('EMP006', 'Karim Uddin', 'karim@gmail.com', '01766666666', 29000, 1);


CREATE TABLE IF NOT EXISTS attendance (
    att_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_id VARCHAR(10),
    att_date DATE,
    status VARCHAR(20),

    FOREIGN KEY (emp_id)
    REFERENCES employees(emp_id)
);

INSERT INTO attendance (emp_id, att_date, status) VALUES
('EMP001', '2026-05-08', 'Present'),
('EMP002', '2026-05-08', 'Present'),
('EMP003', '2026-05-08', 'Late'),
('EMP004', '2026-05-08', 'Absent'),
('EMP005', '2026-05-08', 'Present'),
('EMP006', '2026-05-08', 'Late');


CREATE TABLE IF NOT EXISTS leave_request (
    leave_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_id VARCHAR(10),
    leave_type VARCHAR(30),
    from_date DATE,
    to_date DATE,
    status VARCHAR(20),

    FOREIGN KEY (emp_id)
    REFERENCES employees(emp_id)
);

INSERT INTO leave_request
(emp_id, leave_type, from_date, to_date, status)
VALUES
('EMP002', 'Annual Leave', '2026-05-20', '2026-05-22', 'Pending'),
('EMP004', 'Medical Leave', '2026-05-01', '2026-05-05', 'Approved');


SELECT * FROM employees;


SELECT e.emp_name,
       d.dept_name
FROM employees e
INNER JOIN departments d
ON e.dept_id = d.dept_id;


SELECT e.emp_name,
       a.att_date,
       a.status
FROM attendance a
INNER JOIN employees e
ON a.emp_id = e.emp_id;


SELECT e.emp_name
FROM attendance a
INNER JOIN employees e
ON a.emp_id = e.emp_id
WHERE a.status = 'Absent';


SELECT e.emp_name,
       l.leave_type,
       l.from_date,
       l.to_date,
       l.status
FROM leave_request l
INNER JOIN employees e
ON l.emp_id = e.emp_id;


SELECT emp_name, salary
FROM employees
WHERE salary > 30000;


UPDATE employees
SET salary = 40000
WHERE emp_id = 'EMP001';


DELETE FROM attendance
WHERE emp_id = 'EMP006';

DELETE FROM employees
WHERE emp_id = 'EMP006';
