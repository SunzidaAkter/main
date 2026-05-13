DROP DATABASE IF EXISTS Employee_Management_DB;

CREATE DATABASE Employee_Management_DB;
USE Employee_Management_DB;

-- =========================
-- EMPLOYEES TABLE
-- =========================
CREATE TABLE employees (
    emp_id VARCHAR(10) PRIMARY KEY,
    emp_name VARCHAR(50) NOT NULL
);

INSERT INTO employees (emp_id, emp_name) VALUES
('EMP001', 'Rahim'),
('EMP002', 'Karim'),
('EMP003', 'Jamal'),
('EMP004', 'Sadia'),
('EMP005', 'Nabila'),
('EMP006', 'Hasan');

-- =========================
-- ATTENDANCE TABLE
-- =========================
CREATE TABLE attendance (
    att_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_id VARCHAR(10),
    att_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);

INSERT INTO attendance (emp_id, att_date, status) VALUES
('EMP001', '2026-05-08', 'Present'),
('EMP002', '2026-05-08', 'Present'),
('EMP003', '2026-05-08', 'Late'),
('EMP004', '2026-05-08', 'Absent'),
('EMP005', '2026-05-08', 'Present'),
('EMP006', '2026-05-08', 'Late');

-- =========================
-- LEAVE REQUEST TABLE
-- =========================
CREATE TABLE leave_request (
    leave_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_id VARCHAR(10),
    leave_type VARCHAR(30),
    from_date DATE,
    to_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);

INSERT INTO leave_request (emp_id, leave_type, from_date, to_date, status) VALUES
('EMP002', 'Annual Leave', '2026-05-20', '2026-05-22', 'Pending'),
('EMP004', 'Medical Leave', '2026-05-01', '2026-05-05', 'Approved');

-- =========================
-- QUERIES
-- =========================

-- Attendance Report
SELECT e.emp_name, a.att_date, a.status
FROM attendance a
JOIN employees e ON a.emp_id = e.emp_id;

-- Absent Employees
SELECT e.emp_name
FROM attendance a
JOIN employees e ON a.emp_id = e.emp_id
WHERE a.status = 'Absent';

-- Leave Requests
SELECT e.emp_name, l.leave_type, l.from_date, l.to_date, l.status
FROM leave_request l
JOIN employees e ON l.emp_id = e.emp_id;
