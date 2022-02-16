-- One to Many Joins Exercise. Code written by Jason Gabunilas

-- Creating a students and papers schema

CREATE TABLE students(
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100)
);

CREATE TABLE papers(
    title VARCHAR(200),
    grade INT,
    student_id INT,
    FOREIGN KEY (student_id) REFERENCES students(id)
);

-- Populate the tables
-- Note that some students have multiple papers, and some students have no papers

INSERT INTO students (first_name) VALUES 
('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');

INSERT INTO papers (student_id, title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);

-- Printing first_name, title, and grade using a join, order by grade in descending order

SELECT first_name, title, grade FROM students 
INNER JOIN papers ON students.id = papers.student_id
ORDER BY grade DESC;

-- Printing first_name, title, and grade using a join, where we include ALL students even if they have no paper (the grade shows up as NULL)

SELECT first_name, title, grade FROM students 
LEFT JOIN papers ON students.id = papers.student_id;

-- Printing first_name, title, and grade using a join, where we again include all students but if they have no paper, their score defaults to 0 and the title defaults to "MISSING"

SELECT first_name, IFNULL(title, 'MISSING') AS title, IFNULL(grade, 0) AS grade FROM students 
LEFT JOIN papers ON students.id = papers.student_id;

-- Printing the average grade for each student, making sure we include all students and count missing papers as 0

SELECT first_name, AVG(IFNULL(grade, 0)) AS average FROM students 
LEFT JOIN papers ON students.id = papers.student_id
GROUP BY first_name
ORDER BY average DESC;

-- Alternatively, you can group by student id, as that is also unique. In fact, that is probably the better approach since student id is always unique, whereas students can have the same name

SELECT first_name, AVG(IFNULL(grade, 0)) AS average FROM students 
LEFT JOIN papers ON students.id = papers.student_id
GROUP BY students.id
ORDER BY average DESC;

-- Printing the average grade for each student as well as whether they are passing or failing. A failing student has an average score of below 75
-- Note that you cannot use a newly-defined alias within the case statement, e.g. in this case for AVG()

SELECT first_name, AVG(IFNULL(grade, 0)) AS average, 
    CASE
        WHEN AVG(grade) >= 75 THEN 'PASSING'
        ELSE 'FAILING'
    END AS passing_status
FROM students
LEFT JOIN papers ON students.id = papers.student_id
GROUP BY students.id
ORDER BY average DESC;

-- It is important to note that while the code above is doing what we want, what is actually happening is that within the CASE statement, the WHEN AVG(grade) clause is resolving to NULL for some of these values. In those instances, the code skips the comparison and moves to the next condition. It is more comprehensive to use an explicit WHEN statement to catch NULL values.

SELECT first_name, AVG(IFNULL(grade, 0)) AS average, 
    CASE
        WHEN AVG(grade) IS NULL THEN 'FAILING'
        WHEN AVG(grade) >= 75 THEN 'PASSING'
        ELSE 'FAILING'
    END AS passing_status
FROM students
LEFT JOIN papers ON students.id = papers.student_id
GROUP BY students.id
ORDER BY average DESC;

