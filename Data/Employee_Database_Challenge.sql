SELECT
	e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	t.title,
	t.from_date,
	t.to_date
INTO retirement_titles
FROM
	employees e
	JOIN titles t on e.emp_no = t.emp_no
WHERE
	e.birth_date >= '1952'
	AND e.birth_date <= '1955'

DROP TABLE retirement_titles

SELECT
	DISTINCT ON(e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	t.title
INTO unique_titles
FROM
	employees e
	JOIN titles t on e.emp_no = t.emp_no
WHERE
	e.birth_date >= '1952-01-01'
	AND e.birth_date <= '1955-12-31'
	AND t.to_date = '9999-01-01'
ORDER BY
	e.emp_no

SELECT
	t.title,
	count(e.emp_no) as title_count
INTO retiring_titles
FROM
	employees e
	join titles t on e.emp_no = t.emp_no
WHERE
	e.birth_date >= '1952-01-01'
	and e.birth_date <= '1955-12-31'
	and t.to_date = '9999-01-01'
GROUP BY
	t.title
ORDER BY
	title_count desc

SELECT
	DISTINCT ON (e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.dept_no,
	de.from_date,
	de.to_date,
	t.title,
	t.from_date as title_from,
	t.to_date as title_to
INTO mentorship_eligability
FROM
	employees e
	JOIN dept_emp de on e.emp_no = de.emp_no
	JOIN titles t on e.emp_no = t.emp_no
WHERE
	e.birth_date >= '1965-01-01'
	AND e.birth_date <= '1965-12-31'
	AND de.to_date = '9999-01-01'
	AND t.to_date = '9999-01-01'
ORDER BY
	e.emp_no