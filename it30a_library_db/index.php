<?php

$host = 'localhost';
$db = 'it30a';
$user = 'root';
$pass = '';
$charset = 'utf8mb4';

$dsn = "mysql:host=$host;dbname=$db;charset=$charset";

$options = [
    PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
    PDO::ATTR_EMULATE_PREPARES => false
];

try {
    $pdo = new PDO($dsn, $user, $pass, $options);
} catch (PDOException $e) {
    die("Database connection failed: " . $e->getMessage());
}

session_start();

$section = $_GET['section'] ?? 'students';
$action = $_GET['action'] ?? '';


// ==============================
// ADD STUDENT
// ==============================

if ($section === 'students' && $action === 'create') {

    if ($_SERVER['REQUEST_METHOD'] === 'POST') {

        $first_name = $_POST['first_name'] ?? '';
        $last_name = $_POST['last_name'] ?? '';
        $course = $_POST['course'] ?? '';

        if ($first_name !== '' && $last_name !== '' && $course !== '') {

            $stmt = $pdo->prepare("
                INSERT INTO students
                (
                    student_first_name,
                    student_last_name,
                    student_course
                )
                VALUES (?, ?, ?)
            ");

            $stmt->execute([
                $first_name,
                $last_name,
                $course
            ]);

            header("Location: index.php?section=students");
            exit;
        }
    }
}


// ==============================
// GET STUDENTS
// ==============================

$stmt = $pdo->query("
    SELECT *
    FROM students
    ORDER BY student_id DESC
");

$students = $stmt->fetchAll();

?>

<!DOCTYPE html>

<html>

<head>

    <title>Simple Library System</title>

</head>

<body>

<h1>Simple Library System</h1>

<p>

    <a href="index.php?section=students">
        Students
    </a>

    |

    <a href="index.php?section=books">
        Books
    </a>

    |

    <a href="index.php?section=borrow">
        Borrow
    </a>

</p>

<hr>


<?php if ($section === 'students'): ?>

    <h2>Students</h2>


    <?php if ($action !== 'create'): ?>


        <!-- STUDENTS PAGE -->

        <p>

            <a href="index.php?section=students&action=create">

                <button type="button">
                    ADD STUDENT
                </button>

            </a>

        </p>


        <table border="1" cellpadding="10">

            <tr>

                <th>ID</th>

                <th>First Name</th>

                <th>Last Name</th>

                <th>Course</th>

                <th>Created At</th>

                <th>Actions</th>

            </tr>


            <?php foreach ($students as $student): ?>

                <tr>

                    <td>
                        <?= htmlspecialchars($student['student_id']) ?>
                    </td>

                    <td>
                        <?= htmlspecialchars($student['student_first_name']) ?>
                    </td>

                    <td>
                        <?= htmlspecialchars($student['student_last_name']) ?>
                    </td>

                    <td>
                        <?= htmlspecialchars($student['student_course']) ?>
                    </td>

                    <td>
                        <?= htmlspecialchars($student['student_created_at']) ?>
                    </td>

                    <td>

                        <a href="#">
                            Edit
                        </a>

                        |

                        <a href="#">
                            Delete
                        </a>

                    </td>

                </tr>

            <?php endforeach; ?>

        </table>


    <?php else: ?>


        <!-- ADD STUDENT FORM -->

        <h2>Add Student</h2>


        <!-- CLICKABLE ADD STUDENT BUTTON -->

        <p>

            <a href="index.php?section=students">

                <button type="button">
                    ADD STUDENT
                </button>

            </a>

        </p>


        <form method="POST">

            <p>

                <label for="first_name">
                    First Name:
                </label>

                <br>

                <input
                    type="text"
                    id="first_name"
                    name="first_name"
                    required
                >

            </p>


            <p>

                <label for="last_name">
                    Last Name:
                </label>

                <br>

                <input
                    type="text"
                    id="last_name"
                    name="last_name"
                    required
                >

            </p>


            <p>

                <label for="course">
                    Course:
                </label>

                <br>

                <input
                    type="text"
                    id="course"
                    name="course"
                    required
                >

            </p>


            <p>

                <button type="submit">
                    SAVE
                </button>

                &nbsp;

                <a href="index.php?section=students">
                    CANCEL
                </a>

            </p>

        </form>


    <?php endif; ?>

<?php endif; ?>


<?php if ($section === 'books'): ?>

    <h2>Books</h2>

<?php endif; ?>


<?php if ($section === 'borrow'): ?>

    <h2>Borrow</h2>

<?php endif; ?>


</body>

</html>
