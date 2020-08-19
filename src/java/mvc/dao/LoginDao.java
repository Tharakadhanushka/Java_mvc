
package mvc.dao;


import mvc.bean.LoginBean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Tharaka
 */

public class LoginDao {
     public String authorizeLogin(LoginBean loginBean)  //create function
     {
        String username= loginBean.getUsername();  //get value through login bean and store temperly
        String password= loginBean.getPassword();
        
        String dbusername="";
        String dbpassword="";
        
        
        String url="jdbc:mysql://localhost:3306/ai_logindb";  
        String uname="root";  
        String pass="";  
        
        
        
        try{
            Class.forName("com.mysql.jdbc.Driver"); //load driver
            Connection conn=DriverManager.getConnection(url,uname,pass); //create connection
            
            PreparedStatement pst=null;            
            
            pst=conn.prepareStatement("select * from user where username=? and password=?");
            pst.setString(1,username);
            pst.setString(2,password);
            ResultSet rs=pst.executeQuery();
            
            while(rs.next()){
                dbusername=rs.getString("username"); //fetchable database record uname and pass stored here
                dbpassword=rs.getString("password"); 
                
                
                if(username.equals(dbusername) && password.equals(dbpassword))
                {
                     return "SUCCESS LOGIN"; 
                }
            }
            
            pst.close();
            conn.close();
            
        
        }catch(Exception e)
        {e.printStackTrace();}
        
        return "Invalid Username Or Password";
    }
    
}
