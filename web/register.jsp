
<%
    if(session.getAttribute("login")!=null)
    {
        response.sendRedirect("index.jsp");
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
        
        
        <script language="javascript">	  //script 
	function validate()
	{
            var first_name= /^[a-z A-Z]+$/; //check alphabetical 
            var last_name= /^[a-z A-Z]+$/;  
            var user_name= /^[a-z A-Z]+$/;  
            var password_valid=/^[A-Z a-z 0-9]{5,12}$/; //password range-5 to 12 range
            
            var fname = document.getElementById("fname"); //textbox id
            var lname = document.getElementById("lname"); 
            var uname = document.getElementById("uname"); 
            var password = document.getElementById("password");  
		
        
            
            if(!first_name.test(fname.value) || fname.value=='') 
            {
		alert("Please Complete the Form"); 
                fname.focus();
                fname.style.background = '#FAAFBE'; //set textbox color
                return false;                    
            }
            if(!last_name.test(lname.value) || lname.value=='')  
            {
		alert("Please Complete the Form");  
                lname.focus();
                lname.style.background = '#FAAFBE'; //set textbox color
                return false;                    
            }
            if(!user_name.test(uname.value) || uname.value=='')  
            {
		alert("Please Complete the Form");  
                uname.focus();
                uname.style.background = '#FAAFBE'; //set textbox color
                return false;                    
            }
            if(!password_valid.test(password.value) || password.value=='')  
            {
		alert("Password length min=5 ");  
                password.focus();
                password.style.background = '#FAAFBE'; //set textbox color
                return false;                    
            }
	}		
	</script>
        <style>
                body {
                  background-color: #98AFC7;
                  background-image: url('img/15.jpg');
                }
        </style>
    </head>
    <body>
    <center>
        <h1>Register</h1>
        
        <form method="post" action="RegisterController" onsubmit="return validate();">
            FirstName <input type="text" name="txt_firstname" id="fname"></br></br>
            LastName <input type="text" name="txt_lastname" id="lname"></br></br>
            UserName <input type="text" name="txt_username" id="uname"></br></br>
            Password <input type="password" name="txt_password" id="password"></br></br>
        
            <input type="submit" name="register_btn" value="Register"></br></br>
            
            
            <h4>Already have account? <a href="index.jsp">Login</a></h4>
        </form>
        
        <h3 style="color:#ff0000">
                <%
                    if(request.getAttribute("RegisterErrorMsg")!=null)
                    {
                        out.println(request.getAttribute("RegisterErrorMsg")); //get register fail error message from "RegisterController"
                    }
                %>
            </h3>
    </center>
    </body>
</html>
