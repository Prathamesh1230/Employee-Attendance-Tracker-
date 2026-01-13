-- 1 Total Working Days per Employee
SELECT 
  e.employee_name,
  COUNT(a.attendance_date) AS total_days
FROM employees e
LEFT JOIN attendance a
ON e.employee_id = a.employee_id
GROUP BY e.employee_name;

-- 2 Present Days Count
SELECT 
  e.employee_name,
  SUM(CASE WHEN a.status = 'Present' THEN 1 ELSE 0 END) AS present_days
FROM employees e
LEFT JOIN attendance a
ON e.employee_id = a.employee_id
GROUP BY e.employee_name;

-- 3 Attendance Percentage
SELECT 
  e.employee_name,
  ROUND(
    SUM(CASE WHEN a.status = 'Present' THEN 1 ELSE 0 END) 
    / COUNT(a.attendance_date) * 100, 2
  ) AS attendance_percentage
FROM employees e
JOIN attendance a
ON e.employee_id = a.employee_id
GROUP BY e.employee_name;

-- 4 Late Arrival Count
SELECT 
  e.employee_name,
  COUNT(*) AS late_days
FROM employees e
JOIN attendance a
ON e.employee_id = a.employee_id
WHERE a.status = 'Late'
GROUP BY e.employee_name;

-- 5 Employees with Poor Attendance (<70%)
SELECT e.employee_name,
  ROUND(
    SUM(CASE WHEN a.status = 'Present' THEN 1 ELSE 0 END) 
    / COUNT(*) * 100, 2
  ) AS attendance_percentage
FROM employees e
JOIN attendance a
ON e.employee_id = a.employee_id
GROUP BY e.employee_name
HAVING attendance_percentage < 70;

