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

    // Get the form data
    $tableField = $_POST['table_field'];
    $emp_id = $_POST['emp_id'];
    $newVal = $_POST['newval'];

    // Construct and execute the SQL query to update the employee record
    $sql = "UPDATE employees SET $tableField = '$newVal' WHERE emp_id = '$emp_id'";

    if ($conn->query($sql) === TRUE) {
        echo "<script type='text/javascript'>alert('Employee record updated successfully.');</script>";
    } else {
        echo "<script type='text/javascript'>alert('Error updating employee record: " . $conn->error . "');</script>";
    }

    // Close the database connection
    mysqli_close($conn);
}
?>
