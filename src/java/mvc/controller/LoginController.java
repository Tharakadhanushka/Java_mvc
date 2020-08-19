
package mvc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mvc.bean.LoginBean;
import mvc.dao.LoginDao;

/**
 *
 * @author Tharaka
 */
public class LoginController extends HttpServlet {

  
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if(request.getParameter("login_btn")!=null)  //check not null form
        {
            String username= request.getParameter("txt_username"); //username textbox
            String password= request.getParameter("txt_password"); 
            
            LoginBean loginBean= new LoginBean(); //setting all recived valesjsp page to setter and getter methods
            
            loginBean.setUsername(username); //set through object
            loginBean.setPassword(password); 
            
            LoginDao loginDao = new LoginDao();
            
            String authorize=loginDao.authorizeLogin(loginBean); //send values into the function
            
              if(authorize.equals("SUCCESS LOGIN"))  //check
               {
               HttpSession session=request.getSession(); //session is created
                session.setAttribute("login",loginBean.getUsername()); 
                RequestDispatcher rd=request.getRequestDispatcher("home.jsp"); 
                rd.forward(request, response);
                }
              else{
                request.setAttribute("WrongLoginMsg",authorize);  
                RequestDispatcher rd=request.getRequestDispatcher("index.jsp");  
                rd.include(request, response);
                  }
    
               }
        }    
    
   }

  
