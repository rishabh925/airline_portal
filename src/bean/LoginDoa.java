package bean;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
public class LoginDoa {
	public static int validate(LoginBean bean)
	{
		int status = 0;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/airline_portal",
			            "root", "1234");
		    Statement ps =con.createStatement();
		    ResultSet rs1 = ps.executeQuery("select activation from User_info where User_id = '"+bean.getEmp_id()+"'");
			if(rs1.next()) {
				if(rs1.getString("activation").equals("yes") | rs1.getString("activation").equals("Yes"))
			    {
					Statement ps1 =con.createStatement();
					ResultSet rs = ps1.executeQuery("select * from User_info where User_id = '" + bean.getEmp_id() + "' and password = '" + bean.getPass() + "'");
					if(rs.next()) 
					{
					status = 1;
					}
					else {
						status = 0;
					}
			    }
				else status = -1;
				
			}
			

			
		}
		catch(Exception e)
		{
		}
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
	public static int checkUser(LoginBean bean)
	{
		int status = 0;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/airline_portal",
			            "root", "1234");
		    Statement ps =con.createStatement();
		    ResultSet rs;
		    rs = ps.executeQuery("select User_type from User_info where User_id = '"+bean.getEmp_id() +"'" );
		    if(rs.next())
		    {	
		    	String user_t = (String) rs.getString("User_type");
		    	System.out.println(user_t);
		    	boolean ans1= (rs.getString("User_type").equals("Ad"));
		    	boolean ans2 = (rs.getString("User_type").equals("AO"));
		    	 if(ans2)
		    	 {
		    		 status = 1;
		    	 }
		    	 if(ans1)
		    	 	{
		    	 		
		    	 		status = -1;
		    	 	}
		    }
		}
		catch(Exception e) {}
		return status;
	}
	
	
}
