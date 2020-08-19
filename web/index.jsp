<%-- 
    Document   : index
    Created on : Aug 18, 2020, 10:14:41 PM
    Author     : Tharaka
--%>

<%
    if(session.getAttribute("login")!=null)
    {
        response.sendRedirect("home.jsp"); //session login user not back to index page 
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login page</title>
        
        <script language="javascript">	
	function validate()
	{
            var username = document.LoginForm.txt_username; //store in variable username
            var password = document.LoginForm.txt_password; //store in variable password
				
            if (username.value == null || username.value == "") //check username is empty
            {
		window.alert("Please enter Username"); //alert message 
		username.focus();
		return false;
            }
            
            if (password.value == null || password.value == "") //check password is empty
            {
		window.alert("Please Enter password"); //alert message
		password.focus();
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
        <h1>Login</h1>
        <form method="post" action="LoginController" name="LoginForm" onsubmit="return validate();">            
            Username : <input type="text" name="txt_username"> </br></br>
            Password : <input type="password" name="txt_password"></br></br>
            
            <input type="submit" name="login_btn" value="Login">
            
            <h4>Not registered ? <a href="register.jsp">Register </a> </h4>
        </form>
        
          
        
            <h3 style="color:green">
                <%
                    if(request.getAttribute("RegisterSuccessMsg")!=null)
                    {
                        out.println(request.getAttribute("RegisterSuccessMsg")); //get register success message
                    }
                %>
            </h3>
            
            <h3 style="color:red">
                <%
                    if(request.getAttribute("WrongLoginMsg")!=null)
                    {
                        out.println(request.getAttribute("WrongLoginMsg")); //get login error message 
                    }
                %>
            </h3>
            
    </center>
    </body>
</html>
