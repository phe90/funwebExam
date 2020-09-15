
-- student 테이블 생성
CREATE TABLE student (
	id       VARCHAR(30) PRIMARY KEY,
	name     VARCHAR(30),
	kor      INT,
	math     INT,
	eng      INT,
	reg_date TIMESTAMP
);

-- student 테이블 제거
DROP TABLE student;





-- GROUP BY 복습



-- 성별 사원수
SELECT gender, count(emp_no)
FROM employees
GROUP BY gender;



-- 직무별 사원수
SELECT title, COUNT(emp_no) count
FROM titles
GROUP BY title;



-- 연도별 채용 사원수
SELECT LEFT(hire_date, 4) hire_date,
       COUNT(emp_no)
FROM employees
GROUP BY LEFT(hire_date, 4)
ORDER BY hire_date DESC;



-- 사원이름별 최대 급여액
SELECT s.emp_no, 
       CONCAT(e.first_name, ' ', e.last_name) emp_name,
       MAX(s.salary) max_salary
FROM salaries s
	LEFT OUTER JOIN employees e ON s.emp_no = e.emp_no
GROUP BY s.emp_no;


-- 사원이름별 최근 급여액
SELECT s.emp_no,
	   CONCAT(e.first_name, ' ', e.last_name) emp_name,
       s.salary
FROM salaries s 
	LEFT OUTER JOIN employees e ON s.emp_no = e.emp_no
WHERE s.from_date = (SELECT MAX(from_date)
					FROM salaries
                    WHERE emp_no = s.emp_no)
GROUP BY s.emp_no;



-- 부서별(부서이름별) 사원수
SELECT de.dept_no, d.dept_name, COUNT(de.emp_no) count
FROM dept_emp de LEFT OUTER JOIN departments d
ON de.dept_no = d.dept_no
GROUP BY de.dept_no;


-- 부서별(부서이름별) 사원수
SELECT d.dept_name, COUNT(de.emp_no) count
FROM dept_emp de LEFT OUTER JOIN departments d
ON de.dept_no = d.dept_no
GROUP BY de.dept_no;




