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
 * Servlet implementation class PassWordReseter
 */
@WebServlet("/PassWordReseter")
public class PassWordReseter extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		
		
		String emp_id = request.getParameter("employee_id");
		String new_pass = "";
		String email = "";
		int count = 0;
		if(emp_id != null)
		{
			
			count = DataforAODOA.resetPass(emp_id, new_pass);
			email = DataforAODOA.getEmail(emp_id);
		
		}
		HttpSession session = request.getSession();
		if(session.getAttribute("username") == null || session.getAttribute("username")== "")
		{
			LoginBean bean = new LoginBean();  
			bean.setEmp_id("1");
			request.setAttribute("bean", bean);
			session.setAttribute("username", bean.getEmp_id());
			if(count > 0)
			{
				response.setContentType("text/plain;charset=UTF-8");
				
				List<Object> db = new ArrayList<Object>();
				db.addAll(DataforAODOA.GetUsersInfo());
				request.setAttribute("value", db);
				EmailSender ob = new EmailSender();
				ob.setReciever(email);
				ob.main(null);
				String msg = "New Password of employee "+ emp_id + " is " + new_pass;
				request.setAttribute("msg1", msg);
		    	getServletContext().getRequestDispatcher("/WEB-INF/admin.jsp").forward(request, response);
			}
			else {
				
				
				List<Object> db = new ArrayList<Object>();
				db.addAll(DataforAODOA.GetUsersInfo());
				request.setAttribute("value", db);
		    	getServletContext().getRequestDispatcher("/WEB-INF/admin.jsp").forward(request, response);

				
			}

		}
		else {
			
			
			LoginBean bean = new LoginBean();  
			bean.setEmp_id("1");
			request.setAttribute("bean", bean);
			session.setAttribute("username", bean.getEmp_id());
			if(count > 0)
			{
				response.setContentType("text/plain;charset=UTF-8");
				
				List<Object> db = new ArrayList<Object>();
				db.addAll(DataforAODOA.GetUsersInfo());
				request.setAttribute("value", db);
				EmailSender ob = new EmailSender();
				ob.setReciever(email);
				ob.main(null);
			
		    	getServletContext().getRequestDispatcher("/WEB-INF/admin.jsp").forward(request, response);
			}
			else {
				
				
				List<Object> db = new ArrayList<Object>();
				db.addAll(DataforAODOA.GetUsersInfo());
				request.setAttribute("value", db);
		    	getServletContext().getRequestDispatcher("/WEB-INF/admin.jsp").forward(request, response);

				
			}

			
		}
	}

}
