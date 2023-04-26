SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;


--List the employee number, last name, first name, sex, and salary of each employee
SELECT em.emp_no,em.last_name,em.first_name,em.sex,sal.salary
FROM employees AS em
INNER JOIN salaries AS sal
ON sal.emp_no = em.emp_no;


--List the first name, last name, and hire date for the employees who were hired in 1986
select em.first_name, em.last_name, em.hire_date
from employees as em
where hire_date between '1/1/1986' and '12/31/1986'
order by hire_date

---List the manager of each department along with their department number, department name, employee number, last name, and first name
SELECT dep.dept_no, dep.dept_name, depman.emp_no, em.last_name, em.first_name
FROM departments AS dep
JOIN dept_manager AS depman
ON (dep.dept_no=depman.dept_no)
JOIN employees as em
ON (depman.emp_no=em.emp_no);
		
--List the department number for each employee along with that employee’s employee number, last name, first name, and department name		
---SELECT em.emp_no, em.last_name, em.first_name, dep.dept_name
--FROM employees AS em
--JOIN dept_emp AS dep
--ON (em.emp_no=de.emp_no)
--JOIN departments as dep
--ON (dep.dept_no=d.dept_no);

---List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name like 'B%';

List each employee in the Sales department, including their employee number, last name, and first name
SELECT em.emp_no, em.last_name, em.first_name
FROM employees AS em
JOIN dept_emp AS de
ON (em.emp_no=de.emp_no)
JOIN departments as dep
ON (dep.dept_no=dep.dept_no)
WHERE dep.dept_name = 'Sales';

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT em.emp_no, em.last_name, em.first_name
FROM employees AS em
JOIN dept_emp AS de
ON (em.emp_no=de.emp_no)
JOIN departments as dep
ON (dep.dept_no=dep.dept_no)
WHERE dep.dept_name = 'Sales' or dep.dept_name= 'Development';

--List the frequency counts, in descending order, of all the employee last names 
SELECT last_name, count(last_name) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency desc;