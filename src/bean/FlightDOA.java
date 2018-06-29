package bean;
import java.sql.*;
public class FlightDOA {
	
		public static  int updateFlight(DataBeanAO details)
		{
			int status = 0;

			try {
					Class.forName("com.mysql.jdbc.Driver");
					Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/airline_portal",
					            "root", "1234");
				    Statement ps =con.createStatement();
				    String flight_number = details.getFlightNo();
					ResultSet rs;
					rs = ps.executeQuery("select approval from status where flightNo = '" + flight_number +"';");
					if(rs.next())
					{
						if(rs.getString("approval").equals("Pending"))
						{
							status = 1;
						}
				
					}
					

						
				}
				catch(Exception e) {}
				return status;
		 }
		public static int UpdaterCheck(String flight_number)
		{
			int status = 0;
			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/airline_portal",
				            "root", "1234");
			    Statement ps =con.createStatement();
			    
				ResultSet rs;
				rs = ps.executeQuery("select approval from status where flightNo = '" + flight_number +"';");
				System.out.println("i executed");
				if(rs.next())
				{
					if(rs.getString("approval").equals("Pending"))
					{
						status = 1;
						
					}
					
				}
				

					
			}
			catch(Exception e) {}
			return status;

		}
		public static String valReturner(String code)
		{
			String ans = "";
			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/airline_portal",
				            "root", "1234");
			    Statement ps =con.createStatement();
			    
				ResultSet rs;
				rs = ps.executeQuery("select place from places where code= '" + code +"';");
				System.out.println("i executed");
				if(rs.next())
				{
					ans = rs.getString("place");
				
					
				}
			}
			catch(Exception e) {}
			return ans;
		}
			
			
			
		}


