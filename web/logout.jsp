<%-- 
    Document   : logout
    Created on : Aug 19, 2020, 9:34:08 AM
    Author     : Tharaka
--%>

<%
    session.invalidate(); //session destroy
    response.sendRedirect("index.jsp"); //after destroy redirect to index.jsp page
%>