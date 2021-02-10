DROP DATABASE IF EXISTS employees_db;
CREATE DATABASE employees_db;
USE employees_db;
CREATE TABLE department (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(30) NOT NULL,
  PRIMARY KEY (id)
);
CREATE TABLE role (
  id INT NOT NULL AUTO_INCREMENT,
  title VARCHAR(30) NOT NULL,
  salary DECIMAL(10,2) NOT NULL,
  department_id INT, 
  PRIMARY KEY (id)
);
CREATE TABLE employee (
  id INT NOT NULL AUTO_INCREMENT,
  first_name VARCHAR (30) NOT NULL,
  last_name VARCHAR(30) NOT NULL,
  role_id INT NOT NULL, 
  manager_id INT, 
  PRIMARY KEY (id)
);
INSERT INTO department (name)
VALUES ("Sales"), ("Engineering"), ("HR"), ("Legal"), ("Finance"), ("Artists");
INSERT INTO role (title, salary, department_id)
VALUES ("CEO", "150000", "7"), ("Audio Engineer", "75000", "2"), ("Entertainment Lawyer", "70000", "3"), ("Producer", "50000", "4"), ("Writer", "60000", "5"), ("Artist", "70000", "6"), ("Sales Team", "40000", "1");
INSERT INTO employee (first_name, last_name, role_id, manager_id)
VALUES ("Miles", "Mason", "1"), ("Prentice", "Bledsoe", "2", "1"), ("Tim", "Trass", "3", "1"), ("Jalen", "Christopher", "4", "3"), ("Lamar", "Jackson", "5", "1"), ("DJ", "Quik", "Artist", "6", "1"), ("Moneyman", "Smith", "1", "1");
-- Query for view all --
SELECT e.id, e.first_name, e.last_name, d.name AS department, r.title, r.salary, CONCAT_WS(" ", m.first_name, m.last_name) AS manager FROM employee e LEFT JOIN employee m ON m.id = e.manager_id INNER JOIN role r ON e.role_id = r.id INNER JOIN department d ON r.department_id = d.id ORDER BY e.id ASC;
-- Query for view all roles --
SELECT  r.id, r.title, r.salary, d.name as Department_Name FROM role AS r INNER JOIN department AS d ON r.department_id = d.id;
--Query for getting employees --
SELECT id, CONCAT_WS(' ', first_name, last_name) AS Employee_Name FROM employee
-- Query for updating --
UPDATE employee SET role_id = 3 WHERE id = 8;
UPDATE employee SET ? WHERE ?;
-- Query for Delete --
DELETE FROM department WHERE id = 13;