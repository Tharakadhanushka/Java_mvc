
package mvc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import mvc.bean.RegisterBean;
import mvc.dao.RegisterDao;


public class RegisterController extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if(request.getParameter("register_btn")!=null)  //check not null form
        {
            String firstname= request.getParameter("txt_firstname");
            String lastname= request.getParameter("txt_lastname");
            String username= request.getParameter("txt_username"); 
            String password= request.getParameter("txt_password"); 
            
            RegisterBean registerBean= new RegisterBean(); //setting all recived valesjsp page to setter and getter methods
            
            registerBean.setFirstname(firstname);
            registerBean.setLastname(lastname);
            registerBean.setUsername(username); //set through object
            registerBean.setPassword(password); 
            
            RegisterDao registerdao = new RegisterDao();
            
            String registerValidate = registerdao.authorizeRegister(registerBean); //send values into the function
            
              if(registerValidate.equals("SUCCESS REGISTER"))  //check
               {
                request.setAttribute("RegisterSuccessMsg", registerValidate); 
                RequestDispatcher rd = request.getRequestDispatcher("index.jsp");//rediarected page
                rd.forward(request, response);
                }
              else{
                request.setAttribute("RegisterErrorMsg", registerValidate); 
                RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
                rd.include(request, response);
                  }
    
               }
        }    
    
   }
