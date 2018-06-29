package bean;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class UpdateStatus
 */
@WebServlet("/UpdateStatus")
public class UpdateStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		if((String)session.getAttribute("username")!= null)
		{
			String flight_id = (String)request.getParameter("flightId");
			String emp_id = request.getSession(false).getAttribute("username").toString();
			if(flight_id == null)
		
					{
						List<Object> db = new ArrayList<Object>();
						db.addAll(DataforAODOA.getDataSO(emp_id));
						request.setAttribute("value", db);
				    	LoginBean bean1 = new LoginBean();  
				        bean1.setEmp_id(emp_id);  
				    	request.setAttribute("bean",bean1); 
				    	//request.setAttribute("msg","updated");
				        getServletContext().getRequestDispatcher("/WEB-INF/User1.jsp").forward(request, response);
					}
					else{
									DataBeanAO bean = new DataBeanAO();
									bean.setId(Integer.parseInt(flight_id));
									String stat = request.getParameter(flight_id);
									if(stat != null)
										{
											if(stat.equals("Approved"))
											{
												bean.setStatus("Approved");
											}
											else bean.setStatus("Rejected");
											int count = DataforAODOA.UpdateStatusSO(bean);
											if(count > 0)
											{
												List<Object> db = new ArrayList<Object>();
												db.addAll(DataforAODOA.getDataSO(emp_id));
												request.setAttribute("value", db);
												LoginBean bean1 = new LoginBean();  
												bean1.setEmp_id(emp_id);  
												request.setAttribute("bean",bean1); 
												//request.setAttribute("msg","updated");
												getServletContext().getRequestDispatcher("/WEB-INF/User1.jsp").forward(request, response);
									
											}
											else {
												List<Object> db = new ArrayList<Object>();
												db.addAll(DataforAODOA.getDataSO(emp_id));
												request.setAttribute("value", db);
										    	LoginBean bean1 = new LoginBean();  
										        bean1.setEmp_id(emp_id);  
										    	request.setAttribute("bean",bean1); 
										    	request.setAttribute("msg1","could not update");
										        getServletContext().getRequestDispatcher("/WEB-INF/User1.jsp").forward(request, response);
												
											}
										
										}
									else {
										List<Object> db = new ArrayList<Object>();
										db.addAll(DataforAODOA.getDataSO(emp_id));
										request.setAttribute("value", db);
								    	LoginBean bean1 = new LoginBean();  
								        bean1.setEmp_id(emp_id);  
								    	request.setAttribute("bean",bean1); 
								    	request.setAttribute("msg1","Please choose an option");
								        getServletContext().getRequestDispatcher("/WEB-INF/User1.jsp").forward(request, response);
			
									}		
									
					}
		}
		else {
	    	request.setAttribute("msg","Please Login to Continue");

	        getServletContext().getRequestDispatcher("/Login.jsp").forward(request, response);

			
		}
									
		
		
		
		
	}

}
