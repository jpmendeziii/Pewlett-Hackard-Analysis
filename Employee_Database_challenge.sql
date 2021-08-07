-- Start Delivereable 1
SELECT e.emp_no, 
e.first_name, 
e.last_name, 
t.title, 
t.from_date, 
t.to_date
INTO retirement_titles
FROM employees as e
LEFT JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

-- Use Distinct with Orderby to remove duplicate rows for unique_titles
SELECT DISTINCT ON (r.emp_no) r.emp_no, 
r.first_name,
r.last_name,
r.title
INTO unique_titles
FROM retirement_titles as r
ORDER BY r.emp_no, r.to_date DESC;

-- File to retrieve the number of employees by their most recent job title who are about to retire.
SELECT COUNT(u.title), u.title
INTO retiring_titles
FROM unique_titles as u
GROUP BY u.title
ORDER BY COUNT(u.title) DESC;
