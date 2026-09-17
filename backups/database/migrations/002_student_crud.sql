student Query #1
SELECT * FROM students;

-- student Query #2 - Select students order by id ASC
SELECT * FROM students 
ORDER BY student_id ASC;

-- student Query #3 - Select students order by id DESC
SELECT * FROM students  
     ORDER BY student_id DESC;

-- student Query #4 - Select students order by first name ASC
SELECT
    student_last_name,
    student_first_name,
FROM students
ORDER BY student_last_name ASC;

-- student Query #5 - Select students order by first name DESC
SELECT
    student_last_name,
    student_first_name,
FROM students
ORDER BY student_last_name DESC;

-- student Query #6 - Select students order by course ASC
SELECT  
    student_first_name,
    student_last_name
FROM students
     ORDER BY student_last_name ASC;

-- student Query #7 - Select students order by course DESC
SELECT
    student_first_name,
    student_last_name
FROM students
        ORDER BY student_first_name,

-- student Query #8 - Select students order by created at ASC
SELECT
    student_first_name,
    student_last_name  
FROM students
        WHERE student_id = 1;
        LIMIT 1;
         
-- student Query #9 - Select students order by created at DESC
UPDATE students
SET
    student_first_name = 'Arbiel',
    student_last_name = 'Bayantong',
WHERE student_id = 1; 

--zz
