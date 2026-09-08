-- table #1 students table
CREATE TABLE IF NOT EXISTS students (

    -- primary key for the students table
    student_id INT AUTO_INCREMENT PRIMARY KEY,

    -- student name
    student_first_name VARCHAR(50) NOT NULL,
    student_last_name VARCHAR(50) NOT NULL,

    -- student course
    student_course VARCHAR(50) NOT NULL,

    -- student created at timestamp
    student_created_at TIMESTAMP NOT NULL
    DEFAULT CURRENT_TIMESTAMP

) ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_unicode_ci;


-- table #2 books table
CREATE TABLE IF NOT EXISTS books (

    -- primary key for the books table
    course_id INT AUTO_INCREMENT PRIMARY KEY,

    -- book details
    book_name VARCHAR(50) NOT NULL,

    -- book author
    book_author VARCHAR(100) NOT NULL,

    -- book_category
    book_category VARCHAR(50) NOT NULL,

    -- book created at timestamp
    book_created_at TIMESTAMP NOT NULL
    DEFAULT CURRENT_TIMESTAMP

) ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_unicode_ci;


-- table #3 borrow
CREATE TABLE IF NOT EXISTS borrow (

    -- primary key for the borrow table
    borrow_id INT AUTO_INCREMENT PRIMARY KEY,

    -- foreign key for the students table
    student_id INT NOT NULL,

    -- foreign key for the books table
    book_id INT NOT NULL,

    -- borrow timestamp not null by default
    borrow_date TIMESTAMP NOT NULL
    DEFAULT CURRENT_TIMESTAMP,

    -- borrow return timestamp
    return_date TIMESTAMP NULL
    DEFAULT NULL,

    -- Borrow table constraints and foreign keys
    CONSTRAINT fk_borrow_student
    FOREIGN KEY (student_id)
    REFERENCES students(student_id)
    ON DELETE CASCADE,

    CONSTRAINT fk_borrow_book
    FOREIGN KEY (book_id)
    REFERENCES books(course_id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE

) ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_unicode_ci;


-- Insert statement #1: for students
INSERT INTO students
(student_first_name, student_last_name, student_course)
VALUES
('ARBIEL', 'BAYANTONG', 'BSIT'),
('MICKAEL', 'BAYANTONG', 'BSIT'),
('RAIN', 'BAYANTONG', 'BSIT');


-- BOOKS
INSERT INTO books
(book_name, book_author, book_category)
VALUES
('The Great Gatsby', 'F. Scott Fitzgerald', 'Fiction'),
('To Kill a Mockingbird', 'Harper Lee', 'Fiction'),
('1984', 'George Orwell', 'Dystopian');


-- borrow
INSERT INTO borrow
(student_id, book_id)
VALUES
(1, 1),
(2, 2),
(3, 3);
