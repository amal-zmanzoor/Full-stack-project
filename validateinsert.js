function validate_input()
{
    let emp_id = document.getElementById("emp_id").value;
    let name = document.getElementById("name").value;
    let address = document.getElementById("address").value;
    let salary = document.getElementById("salary").value;
    let dob = document.getElementById("dob").value;
    let nin = document.getElementById("nin").value;
    let department = document.getElementById("department").value;
    let emergency_name = document.getElementById("emg_name").value;
    let emergency_relationship = document.getElementById("emg_relationsip").value;
    let emergency_phone = document.getElementById("emg_phone").value;

    if(emp_id == "")
    {
        //alert("Employee's assigned manager was updated successfully.");
        document.getElementById("emp_id_error").innerHTML = "Please provide the employee id";
        return false;
    }
    if(name =="")
    {
        document.getElementById("emp_name_error").innerHTML = "Please provide the employee name";
        return false;
    }
    if(address =="")
    {
        document.getElementById("emp_address_error").innerHTML = "Please provide the employee's address";
        return false;
    }
    if(salary =="")
    {
        document.getElementById("emp_salary_error").innerHTML = "Please provide the employee's salary";
        return false;
    }
    if(dob =="")
    {
        document.getElementById("emp_dob_error").innerHTML = "Please provide the employee's DOB";
        return false;
    }
    if(nin =="")
    {
        document.getElementById("emp_nin_error").innerHTML = "Please provide the employee's NIN";
        return false;
    }
    if(department =="")
    {
        document.getElementById("emp_dept_error").innerHTML = "Please provide the employee's department";
        return false;
    }
    if(emergency_name =="")
    {
        document.getElementById("emg_name_error").innerHTML = "Please provide the employee's emergency name";
        return false;
    }
    if(emergency_relationship =="")
    {
        document.getElementById("emg_rel_error").innerHTML = "Please provide the employee's emergency relationship";
        return false;
    }
    if(emergency_phone =="")
    {
        document.getElementById("emg_phone_error").innerHTML = "Please provide the employee's emergency phone number";
        return false;
    }

    return true;
    
}