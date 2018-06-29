package bean;

import java.io.IOException;
import java.sql.Date;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FlightAdder
 */
@WebServlet("/FlightAdder")
public class FlightAdder extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		String flight_number = request.getParameter("flight_num");
		String emp_id = request.getParameter("emp");
		String source = request.getParameter("source");
		System.out.println(source);
		
		String dest = request.getParameter("destination");
		LocalTime arrival_time= LocalTime.parse(request.getParameter("arrival_time"));
		LocalTime depart_time  = LocalTime.parse(request.getParameter("departure_time"));
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
		String arr = request.getParameter("arrival_date");
		String depar = request.getParameter("departure_date");
		java.util.Date date1, date2;
		
		java.sql.Date sqlarrivaldate = null, sqldepartdate = null;
		try {
			date1 = sdf1.parse(arr);
			date2= sdf1.parse(depar);
			sqlarrivaldate = new java.sql.Date(date1.getTime()); 
			sqldepartdate = new java.sql.Date(date2.getTime());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String flight_type = request.getParameter("type");
		
		Time time1 = Time.valueOf(arrival_time);
		Time  time2 = Time.valueOf(depart_time);
			DataBeanAO db = new DataBeanAO();
			db.setDepartDate(sqldepartdate);
			db.setArrival_date(sqlarrivaldate);
        	db.setArrival(time1);
        	db.setDeparture(time2);
        	db.setFlightNo(flight_number);
        	String des = FlightDOA.valReturner(source);
        	System.out.println("des = " + des);
        	db.setSource(FlightDOA.valReturner(source));
        	db.setDestination(FlightDOA.valReturner(dest));
        	db.setStatus("Pending");
        	db.setType(flight_type);
        	LoginBean bean = new LoginBean();
        	bean.setEmp_id(emp_id);
        	int status = DataforAODOA.addFlight(db, emp_id);
        	if(status > 0)
        	{
        		//System.out.println("count = " + count);
        		List<Object> db1 = new ArrayList<Object>();
        		List<Object> db2 = new ArrayList<Object>();
        		db1.addAll(DataforAODOA.getData(emp_id));
        		db2.addAll(DataforAODOA.getPlaceList());
        		request.setAttribute("List", db2);
	        	request.setAttribute("value", db1);
	        	request.setAttribute("bean", bean);
	            getServletContext().getRequestDispatcher("/WEB-INF/User.jsp").forward(request, response);

        	}
        	else {
        		List<Object> db1 = new ArrayList<Object>();
        		List<Object> db2 = new ArrayList<Object>();
        		db1.addAll(DataforAODOA.getData(emp_id));
        		db2.addAll(DataforAODOA.getPlaceList());
        		LoginBean bean1 = new LoginBean();
            	bean1.setEmp_id(emp_id);
            	request.setAttribute("List", db2);
            	request.setAttribute("value", db1);
	        	request.setAttribute("bean", bean1);
	            getServletContext().getRequestDispatcher("/WEB-INF/User.jsp").forward(request, response);
        		
        	}
        	
        	
        	
        }
        
     
        
	}


