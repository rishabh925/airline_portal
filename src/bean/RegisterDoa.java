package bean;
import java.sql.*;
public class RegisterDoa {
	public static  int register (RegsiterBean user)
	{
		int status = 0;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/airline_portal",
			            "root", "1234");
		    Statement ps =con.createStatement();
					
			status = ps.executeUpdate("insert into User_info(User_id,first_name,last_name,contact_no,email_id, password, User_type) values('" +user.getEmp_id()+ "','" +user.getfirst_name()+"','"+user.getLast_name()+"','"+user.getContact()+ "','" + user.getEmail() +"','" + user.getPass() +"','" + user.getUserType() +"')");
			Statement st = con.createStatement();
			status = st.executeUpdate("insert into User_status(User_id,approval) values('"+user.getEmp_id()+"','"+user.getApproval()+"')");
		}
		
		
		catch(Exception e) {}
		return status;
	}
	public static int UserExits(String User_id)
	{
		int status = 0;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/airline_portal",
			            "root", "1234");
		    Statement ps =con.createStatement();
		    ResultSet rs;
		    rs = ps.executeQuery("select User_id from User_info where User_id = '"+User_id +"'" );
		    if(rs.next())
		    {
		    	 status = 1;
		    }
		    
					
		}
		catch(Exception e) {}
		System.out.println(status);
		return status;
	}

}
