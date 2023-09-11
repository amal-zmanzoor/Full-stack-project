<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['submit'])) {
    // Database connection parameters
    $dbHost = 'localhost';
    $dbUsername = 'root';
    $dbPassword = '';
    $dbName = 'toby';

    // Attempt to establish a connection to the database
    $conn = mysqli_connect($dbHost, $dbUsername, $dbPassword, $dbName);

    // Check if the connection was successful
    if (!$conn) {
        die("Connection failed: " . mysqli_connect_error());
    }

    // Get the Employee ID to delete
    $emp_id = $_POST['emp_id'];

    // Construct and execute the SQL query to delete the employee record
    $sql = "DELETE FROM employees WHERE emp_id = '$emp_id'";

    if ($conn->query($sql) === TRUE) {
        echo "<script type='text/javascript'>alert('Employee record deleted successfully.');</script>";
    } else {
        echo "<script type='text/javascript'>alert('Error deleting employee record: " . $conn->error . "');</script>";
    }

    // Close the database connection
    mysqli_close($conn);
}
?>
