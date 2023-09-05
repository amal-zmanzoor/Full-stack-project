<?php
    if($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['submit']))
    {
        $conn = mysqli_connect('localhost','root','','toby');
        if(isset($_POST['emp_id']) && isset($_POST['name']) && isset($_POST['address']) && isset($_POST['salary'])
        && isset($_POST['dob']) && isset($_POST['nin']) && isset($_POST['department']) && isset($_POST['emergency_name']) 
        && isset($_POST['emergency_relationship']) && isset($_POST['emergency_phone']))
        {
            $emp_id = $_POST['emp_id'];
            $name = $_POST['name'];
            $address = $_POST['address'];
            $salary = $_POST['salary'];
            $dob = $_POST['dob'];
            $nin = $_POST['nin'];
            $department = $_POST['department'];
            $emergency_name = $_POST['emergency_name'];
            $emergency_relationship = $_POST['emergency_relationship'];
            $emergency_phone = $_POST['emergency_phone'];

            if (!empty($emp_id))
            {
                $sql = "INSERT INTO employees (emp_id, name, address, salary, dob, nin, department, emergency_name, emergency_relationship, emergency_phone)
                VALUES ('$emp_id','$name','$address', '$salary', '$dob', '$nin', '$department', '$emergency_name', '$emergency_relationship','$emergency_phone')";
            
                if($conn->query($sql) === TRUE)
                {
                        echo "<script type='text/javascript'>alert('Employee registration was successfull.');</script>";
                }
                else
                {
                    echo "<script type='text/javascript'>alert('An error occured.');</script>";

                }
            }
        }
    }
    
?>