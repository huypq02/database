-- ----------------------------------------------------------------------
-- ----------------------------------------------------------------------

-- QUERIES    
-- cau 1
SELECT * FROM employees e 

-- cau 2
SELECT employee_name, salary 
from employees e 
   
-- cau 3
SELECT employee_name, salary 
from employees e 
WHERE salary  > 50000

-- cau 4
SELECT d.department_name , count(d.department_id) "number_of_department"
FROM employees e 
JOIN departments d ON d.department_id = e.department_id 
GROUP BY d.department_id 


-- CAU 5
SELECT * FROM employees e 
ORDER BY employee_name 

-- CAU 6
SELECT e.employee_name, e.salary, d.department_name 
FROM employees e 
JOIN departments d ON d.department_id = e.department_id 
WHERE e.salary BETWEEN 50000 AND 60000
ORDER BY e.salary desc

-- CAU 7
SELECT SUM(salary) FROM employees e 
ORDER BY employee_name 


-- CAU 8
SELECT e.employee_name, d.department_name 
FROM employees e 
JOIN departments d ON d.department_id = e.department_id 


-- CAU 9
SELECT d.department_name, COUNT(d.department_id) 
FROM employees e 
JOIN departments d ON d.department_id = e.department_id 
GROUP BY d.department_id
HAVING COUNT(d.department_name) > 2



-- CAU 10
SELECT e.employee_name, e.salary
FROM employees e 
JOIN departments d ON d.department_id = e.department_id 
WHERE d.department_name in ('IT', 'Sales')


-- CAU 11
SELECT employee_name, start_date FROM employees e
WHERE year(start_date) > 2020

-- cau 12
SELECT AVG(salary) FROM employees e 
ORDER BY employee_name 

-- CAU 13
SELECT d.department_name, COUNT(d.department_id) 
FROM employees e 
JOIN departments d ON d.department_id = e.department_id 
GROUP BY d.department_id

-- CAU 14
SELECT * FROM employees e 
ORDER BY salary desc
limit 5


-- cau 15
SELECT * FROM employees e 
WHERE employee_name like 'A%'

-- CAU 16
SELECT * 
FROM employees e 
JOIN access_rights ar ON e.employee_id = ar.employee_id 
WHERE ar.access_level = 'Admin'

-- cau 17
SELECT d.department_name, sum(e.salary), COUNT(d.department_id) 
FROM employees e 
JOIN departments d ON d.department_id = e.department_id 
GROUP BY d.department_id 


-- cau 18
SELECT * FROM employees e 
ORDER BY start_date 


-- cau 19
SELECT *
FROM employees e
JOIN (SELECT department_id, MAX(e.salary) max_salary
FROM employees e 
GROUP BY department_id) as max_salaries
ON max_salaries.department_id = e.department_id AND max_salaries.max_salary = e.salary 

-- SELECT salary, ROW_NUMBER() OVER (PARTITION BY component_module_id ORDER BY salary)
-- FROM employees e


-- cau 20
SELECT *
FROM employees e 
LEFT JOIN access_rights ar 
ON e.employee_id = ar.employee_id 


-- -----------------------------------------------------------------------------------------
-- -----------------------------------------------------------------------------------------
