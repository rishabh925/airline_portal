package bean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.*;
public class DataforAODOA {
	public static List<Object> getData(String emp_id)
	{
		List<Object> data = new ArrayList<Object>();
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/airline_portal",
		            "root", "1234");
			Statement ps = con.createStatement();
			ResultSet rs;
			//System.out.println(emp_name);
			rs = ps.executeQuery("select * from flight_plan where User_id = '" + emp_id + "';");
			
			while(rs.next())
	    		{
				
				System.out.println("yes that executed");
				DataBeanAO db = new DataBeanAO();
				db.setId(rs.getInt("id"));
				
				int no =(int) rs.getInt("id");
				System.out.println(no);
				Statement ps1 = con.createStatement();
				ResultSet rs1;
				rs1 = ps1.executeQuery("select approval from status where id = '"+no+"';");
				System.out.println(rs1);
				try {
				if(rs1.next()) {
					db.setStatus(rs1.getString("approval"));
					}
				}
				catch(Exception e) {}
				db.setFlightNo((rs.getString("flightNo")));
				db.setArrival_date(rs.getDate("Date_arrival"));
				db.setArrival(rs.getTime("Time_arrival"));
				db.setDepartDate(rs.getDate("Date_arrival"));
				db.setDeparture(rs.getTime("Time_departure"));
				db.setSource(rs.getString("source"));
				db.setDestination(rs.getString("destination"));
				db.setType(rs.getString("flight_type"));
				data.add(db);
	    		}
		}
		catch (Exception e)
		{e.printStackTrace();}
		return data;
	}
	
	
	
	public static int updateData(DataBeanAO bean)
	{
		int count = 0;
		try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/airline_portal",
	            "root", "1234");
		Statement ps = con.createStatement();
		System.out.println("this the updator and it is inserting" + bean.getId());
		count = ps.executeUpdate("update flight_plan set Time_arrival = '" + 
				bean.getArrival() + "', Time_departure ='"+bean.getDeparture()+ "', source = '"+bean.getSource()+"',destination ='"+bean.getDestination()+"',flight_type = '"+bean.getType()+"' where id = '" + bean.getId() +"'");
			}
		catch(Exception e) {}
		return count;
	}
	
	
	public static int addFlight(DataBeanAO bean, String emp_id)
	{
		int status = 0;
		try {
			System.out.println("yeh yaha tak to aa agaya");
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/airline_portal",
		            "root", "1234");
			Statement st = con.createStatement();
			ResultSet rs; 
			rs = st.executeQuery("select max(id) from flight_plan");
			if(rs.next())
			{	

				int no = rs.getInt("max(id)") + 1;
				Statement st1 = con.createStatement();
				status = st1.executeUpdate("insert into flight_plan values('" +bean.getFlightNo()+"','"+bean.getSource()
				+"','"+bean.getType()+"','"+bean.getDeparture()+
						"','"+bean.getArrival()+"','"+emp_id+"','"+bean.getDestination()+"','"+no+"','"+bean.getArrival_date()+"','"+bean.getDepartDate()+"');");
				
				if(status > 0)
				{

					
						Statement st2 = con.createStatement();
						status = st2.executeUpdate("insert into status values('"+ bean.getStatus() + "','" + no + "')");
						

						
					
				}
			}
			
			
			
		}
		catch(Exception e) {}
		return status;
	}
	
	
	
	public static List<Object> getDataSO(String emp_id)
	{
		List<Object> data = new ArrayList<Object>();
		//int status = 0;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/airline_portal",
		            "root", "1234");
			Statement ps = con.createStatement();
			ResultSet rs;
			//System.out.println(emp_name);
			// = ps.executeQuery("select * from flight_plan where User_id = '" + emp_id + "';");
			String stat = "Pending";
			rs = ps.executeQuery("select id from status where approval ='"+stat + "';");

			while(rs.next())
	    		{
				
				System.out.println("yes that executed for SO");
				System.out.println("the flightNo = " + rs.getInt("id"));
				DataBeanAO db = new DataBeanAO();
				
				db.setId(rs.getInt("id"));
				int no =(int) rs.getInt("id");
				System.out.println(no);
				Statement ps1 = con.createStatement();
				ResultSet rs1;
				rs1 = ps1.executeQuery("select * from flight_plan where id = '"+no+"'");
				if(rs1.next())
					{
					db.setFlightNo(rs1.getString("flightNo"));
					db.setStatus("Pending");
					db.setArrival_date(rs1.getDate("Date_arrival"));
					db.setDepartDate(rs1.getDate("Date_departure"));
					db.setArrival(rs1.getTime("Time_arrival"));
					db.setDeparture(rs1.getTime("Time_departure"));
					db.setSource(rs1.getString("source"));
					db.setDestination(rs1.getString("destination"));
					db.setType(rs1.getString("flight_type"));
					data.add(db);
					}
	    		}
				
				
		
				
				
	    		
		}
		catch (Exception e)
		{e.printStackTrace();}
		return data;

	}
	public static int UpdateStatusSO(DataBeanAO bean)
	{
		int status  = 0;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/airline_portal",
		            "root", "1234");
			Statement ps = con.createStatement();
			status = ps.executeUpdate("update status set approval = '" + 
					bean.getStatus() + "' where id = '" + bean.getId()+"'");

			
		}
		catch(Exception e) {}
		
		return status;
	}
	public static List<Object> GetUsersInfo()
	{
		List<Object> data = new ArrayList<Object>();

		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/airline_portal",
			            "root", "1234");
			Statement st = con.createStatement();
			ResultSet rs;
			rs = st.executeQuery("select * from User_info where User_id not in (1) ");
			while(rs.next())
			{
				RegsiterBean db = new RegsiterBean();
				db.setEmp_id(rs.getString("User_id"));
				if(rs.getString("activation").equals("Yes") || rs.getString("activation").equals("yes"))
				{
					db.setApproval("Activated");

				}
				else {
					db.setApproval("Deactivated");
				}
				db.setfirst_name(rs.getString("first_name"));
				db.setLast_name(rs.getString("last_name"));
				db.setUserType(rs.getString("User_type"));
				data.add(db);
			}
			
		}
		catch(Exception e) {
			
		}
		return data;
	}
	public static int UpdateStatusUser(RegsiterBean bean)
	{
		int count = 0;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/airline_portal",
		            "root", "1234");
			Statement ps = con.createStatement();
			System.out.println("the user approval set by admin is = "+ bean.getApproval() +"and the emP_id = "+ bean.getEmp_id());
			count = ps.executeUpdate("update User_status set approval = '" + 
					bean.getApproval() + "' where User_id= '" + bean.getEmp_id()+"'");
			System.out.println(count);
			if(count > 0)
			{
				Statement st = con.createStatement();
				count += st.executeUpdate("update User_info set activation = '"+bean.getApproval()+"' where User_id = '" + bean.getEmp_id()+"'");
				System.out.println(count);

			}

			
		}
		catch(Exception e) {}
		
		
		return count;
	}
	public static List<Object> getPlaceList(){
		List<Object> data = new ArrayList<Object>();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/airline_portal",
		            "root", "1234");
			Statement ps = con.createStatement();
			ResultSet rs;
			rs = ps.executeQuery("select * from places");
			System.out.println("tera List to yaha se aa rahi he");
			while(rs.next()){
				DataBeanAO db = new DataBeanAO();
				db.setCode(rs.getString("code"));
				db.setPlace(rs.getString("place"));
				System.out.println(rs.getString("code"));
				data.add(db);
				
			}
			
		}
		catch(Exception e) {}
		return data;
	}
	public static int resetPass(String emp_id, String new_pass)
	{
		int count = 0;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/airline_portal",
		            "root", "1234");
			Statement ps = con.createStatement();
			count = ps.executeUpdate("update User_info set password = '" + 
					new_pass + "' where User_id= '" + emp_id+"'");
			
		

			
		}
		catch(Exception e) {}
		
		
		return count;
	}
	public static String getEmail(String emp_id)
	{
		String email= "";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/airline_portal",
		            "root", "1234");
			Statement ps = con.createStatement();
			ResultSet rs = ps.executeQuery("select email_id from  User_info where User_id= '" + emp_id+"'");
			if(rs.next())
			{
				email = rs.getString("email_id");
			}

			
		}
		catch(Exception e) {}
		
		
		return email;
	}
	

}
