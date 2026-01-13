CREATE DATABASE employee_attendance_tracker;
USE employee_attendance_tracker;

-- employees
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department VARCHAR(30),
    joining_date DATE
);

-- Attendance
CREATE TABLE attendance (
    attendance_id INT PRIMARY KEY,
    employee_id INT,
    attendance_date DATE,
    status VARCHAR(10),   -- Present / Absent / Late
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

