function validate_input()
{
    if(del_emp_id =="")
    {
        document.getElementsById("del_emp_id").innerHTML = "Please provide the employee id to be deleted";
        return false;
    }
    if( del_by =="")
    {
        document.getElementsById("del_by").innerHTML = "Please provide the employee ID of the manager deleting this record right now";
        return false;
    }

    return true;
    
}