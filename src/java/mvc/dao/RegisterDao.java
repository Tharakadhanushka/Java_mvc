
package mvc.dao;

import mvc.bean.RegisterBean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class RegisterDao {
    
    public String authorizeRegister(RegisterBean registerBean)  // create function
    {
        String firstname= registerBean.getFirstname();  // get values through bean object and temporary store
        String lastname= registerBean.getLastname();
        String username= registerBean.getUsername();
        String password= registerBean.getPassword();
        
        
        
        String url = "jdbc:mysql://localhost:3306/ai_logindb";  //db connection
        String uname="root";
        String pass="";
        
        
        
        try{
            Class.forName("com.mysql.jdbc.Driver");//load driver
            Connection conn = DriverManager.getConnection(url, uname, pass);
            
            PreparedStatement pst= null;
            
            pst=conn.prepareStatement("insert into user (firstname,lastname,username,password) values(?,?,?,?)");
            pst.setString(1,firstname);
            pst.setString(2,lastname);
            pst.setString(3,username);
            pst.setString(4,password);
            pst.executeUpdate(); //execute the query
            
            
            pst.close();
            conn.close();
            
            return "SUCCESS REGISTER";  //if valid return
            
        
        }catch(Exception e)
        {e.printStackTrace();}
        
            return "Registration Failed"; 
        
    }
}
