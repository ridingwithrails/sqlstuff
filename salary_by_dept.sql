-- Fetch total Salary by dept order by total salar.

select departments.`dept_name`, sum(salaries.`salary`) as total_sal
from employees
join dept_emp on employees.`emp_no` = dept_emp.`emp_no`
join departments on departments.`dept_no` = dept_emp.`dept_no`
join salaries on salaries.`emp_no` = employees.`emp_no`
group by departments.`dept_name`
order by total_sal DESC;

-- Rounded salaries
select departments.`dept_name`, round(avg(salaries.`salary`), 2) as total_sal
from employees
join dept_emp on employees.`emp_no` = dept_emp.`emp_no`
join departments on departments.`dept_no` = dept_emp.`dept_no`
join salaries on salaries.`emp_no` = employees.`emp_no`
group by departments.`dept_name`
order by total_sal DESC;

-- Percentages of titles
select title,
		count(title) as total,
		ROUND((count(title)/(select count(title) as total from titles) * 100), 2)  title_totes
from titles
group by title
order by title_totes DESC;

--  Bucket by month
select count(e.emp_no) as number_hired, DATE_FORMAT(e.hire_date, "%m-%Y") as month
from employees e
group by month
order by number_hired desc;
