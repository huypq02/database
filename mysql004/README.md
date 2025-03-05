

-- ---------------------------------------------------------
-- ---------------------------------------------------------
```
CREATE DATABASE IF NOT EXISTS bc07;

USE bc07;


CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100),
    department_id INT,
    manager_id INT,
    salary DECIMAL(10, 2)
);


INSERT INTO employees (employee_id, name, department_id, manager_id, salary) VALUES
(1, 'Alice', 1, NULL, 60000),
(2, 'Bob', 1, 1, 55000),
(3, 'Charlie', 2, 1, 70000),
(4, 'David', 2, 3, 65000),
(5, 'Eve', 3, 1, 62000),
(6, 'Frank', 3, 5, 58000),
(7, 'Grace', 4, 1, 72000),
(8, 'Heidi', 4, 7, 71000),
(9, 'Ivan', 5, 1, 75000),
(10, 'Judy', 5, 9, 68000);

INSERT INTO employees (employee_id, name, department_id, manager_id, salary) VALUES
(11, 'HuyPro', 11, NULL, 60000);

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

INSERT INTO departments (department_id, department_name) VALUES
(1, 'HR'),
(2, 'Engineering'),
(3, 'Marketing'),
(4, 'Sales'),
(5, 'Finance');

CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    department_id INT
);

INSERT INTO projects (project_id, project_name, department_id) VALUES
(1, 'Project A', 1),
(2, 'Project B', 2),
(3, 'Project C', 2),
(4, 'Project D', 3),
(5, 'Project E', 4),
(6, 'Project F', 5),
(7, 'Project G', 1),
(8, 'Project H', 3),
(9, 'Project I', 4),
(10, 'Project J', 5);

CREATE TABLE employee_projects (
    employee_id INT,
    project_id INT,
    PRIMARY KEY (employee_id, project_id)
);

INSERT INTO employee_projects (employee_id, project_id) VALUES
(1, 1),
(1, 7),
(2, 1),
(3, 2),
(3, 3),
(4, 2),
(4, 3),
(5, 4),
(5, 8),
(6, 4),
(6, 8),
(7, 5),
(7, 9),
(8, 5),
(8, 9),
(9, 6),
(9, 10),
(10, 6),
(10, 10);
```