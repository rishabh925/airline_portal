package bean;
import java.time.*;
import java.util.ArrayList;
import java.util.List;
import java.sql.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FlightUpdate
 */
@WebServlet("/FlightUpdate")
public class FlightUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String emp_id = request.getParameter("employee_id");
		String flight_id = request.getParameter("flight_id");
		String flight_number = request.getParameter("Flight_number");
		String source = request.getParameter("source");
		String destination = request.getParameter("destination");
		LocalTime arrival_time= LocalTime.parse(request.getParameter("arrival"));
		LocalTime departure_time = LocalTime.parse(request.getParameter("departure"));
		Time time_arrival = Time.valueOf(arrival_time);
		Time time_departure = Time.valueOf(departure_time);
		String type = request.getParameter("type");
		String status = request.getParameter("status");
		
		
		DataBeanAO bean = new DataBeanAO();
		bean.setId(Integer.parseInt(flight_id));
		bean.setFlightNo(flight_number);
		bean.setSource(source);
		bean.setDestination(destination);
		bean.setArrival(time_arrival);
		bean.setDeparture(time_departure);
		bean.setType(type);
		bean.setStatus(status);
		int count = DataforAODOA.updateData(bean);
		System.out.println("count = " + count);
		if(count > 0)
			{
			List<Object> db = new ArrayList<Object>();
			db.addAll(DataforAODOA.getData(emp_id));
			request.setAttribute("value", db);
			LoginBean bean1 = new LoginBean();  
			bean1.setEmp_id(emp_id);  
			request.setAttribute("bean",bean1); ;
			response.setContentType("text/plain;charset=UTF-8");
			response.getWriter().write("1");
			getServletContext().getRequestDispatcher("/WEB-INF/User.jsp").forward(request, response);
		            
			}
			else {
				List<Object> db = new ArrayList<Object>();
				db.addAll(DataforAODOA.getData(emp_id));
				request.setAttribute("value", db);
				LoginBean bean1 = new LoginBean();  
				bean1.setEmp_id(emp_id);  
				request.setAttribute("bean",bean1); 
				
				response.setContentType("text/plain;charset=UTF-8");
				response.getWriter().write("0");
				getServletContext().getRequestDispatcher("/WEB-INF/User.jsp").forward(request, response);
			     }
				
				
			}
	
	}


	
