package bean;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FlightNoChecker
 */
@WebServlet("/FlightNoChecker")
public class FlightNoChecker extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String flight_number = request.getParameter("Flight_number");
		int status = 0;
		if(flight_number != null || flight_number == "")
				status = FlightDOA.UpdaterCheck(flight_number);
		
		response.setContentType("text/plain;charset=UTF-8");
		
		if(status == 1)response.getWriter().write("1");
		else response.getWriter().write("0");
	}

}
