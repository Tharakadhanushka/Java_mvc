<%-- 
    Document   : home
    Created on : Aug 19, 2020, 9:06:06 AM
    Author     : Tharaka
--%>

        
        
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home page</title>
        
       
         <style>
                body {
                  background-color: #99ffff;
                  background-image: url('img/14.jpg');
                }
        </style>
        
                            <%-- 
                         navbar
                      --%>
                    <meta name="viewport" content="width=device-width, initial-scale=1">
                            <style>
                            body {
                              margin: 0;
                              font-family: Arial, Helvetica, sans-serif;
                            }

                            .topnav {
                              overflow: hidden;
                              background-color: #333;
                            }

                            .topnav a {
                              float: left;
                              color: #f2f2f2;
                              text-align: center;
                              padding: 14px 16px;
                              text-decoration: none;
                              font-size: 17px;
                            }

                            .topnav a:hover {
                              background-color: #ddd;
                              color: black;
                            }

                            .topnav a.active {
                              background-color: #4CAF50;
                              color: white;
                            }
                            </style>

        
    </head>
    
    
    <body>
                       <%-- 
                         navbar
                      --%>
                      <div class="topnav">
                      <a class="active" href="#home">Home</a>
                      <a href="#about">about</a>
                      <a href="#contact">Contact</a>
                      <a href="#career">Career</a>
                     </div>

                    

        <center>
                <h2>
                    <%
                        if(session.getAttribute("login")==null || session.getAttribute("login")=="")   //cheking session for unauthorized
                        {
                            response.sendRedirect("index.jsp");

                        }
                        %>



                        WELCOME  <%=session.getAttribute("login")%>

                </h2>

                        <h3>
                            <a href="logout.jsp">Logout</a>
                        </h3>
                        </br>
                        <form method="post" action="RegisterController" onsubmit="return validate();">


                            <table>
                                <tr>
                                    <td>
                                        FirstName 
                                    </td>
                                    <td>
                                        <input type="text" name="txt_firstname" id="fname"></br>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        LastName
                                    </td>
                                    <td>
                                        <input type="text" name="txt_lastname" id="lname"></br>
                                    </td>
                                </tr>
                                 <tr>
                                    <td>
                                        Vacancy 
                                    </td>
                                    <td>
                                        <input type="text" name="txt_vacancy" id="vacancy"></br>
                                    </td>
                                </tr>
                                 <tr>
                                    <td>
                                        email 
                                    </td>
                                    <td>
                                        <input type="email" name="txt_username" id="uname"></br>
                                    </td>
                                </tr>
                                 <tr>
                                    <td>
                                        Contact
                                    </td>
                                    <td>
                                        <input type="text" name="txt_contact" id="contact"></br>
                                    </td>
                                </tr>
                                 <tr>
                                    <td>
                                        Messege
                                    </td>
                                    <td>
                                         <textarea id="messege" name="messege" rows="4" cols="25"></textarea></br>
                                    </td>
                                </tr> <tr>
                                    <td>
                                        <label for="myfile">Attach CV:</label>
                                    </td>
                                    <td>
                                         <input type="file" id="myfile" name="myfile"> </br>
                                    </td>
                                </tr>
                            </table>
                            </br></br>


                            <input type="submit" name="register_btn" value="Submit"></br></br>



                </form>
            </center>
</body>
</html>