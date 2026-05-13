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

SELECT * FROM departments;

SELECT * FROM roles;

SELECT role_name,
dept_name
FROM roles
INNER JOIN departments
ON roles.dept_id = departments.dept_id;
