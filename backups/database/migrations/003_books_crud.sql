SELECT * FROM books;

SELECT * FROM books 
     ORDER BY course_id ASC;

SELECT * FROM books  
     ORDER BY course_id DESC;

SELECT
    book_name,
    book_author
FROM books
ORDER BY book_name ASC;

SELECT
    book_title,
    book_author
FROM books
ORDER BY book_name DESC;

SELECT  
    book_name,
    book_author
FROM books
     ORDER BY book_title ASC;

SELECT
    book_name,
    book_author
FROM books
        ORDER BY book_authowr DESC;,

SELECT
    book_name,
    book_author
FROM books
WHERE course_id = 1
LIMIT 1;
         
UPDATE books
SET
    book_name = 'the book thief',
    book_author = 'markus zusak'
WHERE course_id = 1;
