function validate_input()
{
    if(emp_id =="")
    {
        document.getElementsById("emp_id").innerHTML = "Please provide the employee id";
        return false;
    }
    if(newval =="")
    {
        document.getElementsById("newval").innerHTML = "Please provide the value/text you want to update to";
        return false;
    }
    return true;
    
}