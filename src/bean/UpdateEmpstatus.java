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
 * Servlet implementation class UpdateEmpstatus
 */
@WebServlet("/UpdateEmpstatus")
public class UpdateEmpstatus extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */


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
		// TODO Auto-generated method stub
        HttpSession session = request.getSession();
		String emp_id = request.getParameter("emp_id");
		String admin_id = (String)session.getAttribute("username");
		System.out.println(emp_id);
		if(emp_id == null && admin_id !=null )
		{
			List<Object> db = new ArrayList<Object>();
			db.addAll(DataforAODOA.GetUsersInfo());
			request.setAttribute("value", db);
	    	LoginBean bean1 = new LoginBean();  
	        bean1.setEmp_id(admin_id);  
	    	request.setAttribute("bean",bean1); 
	    	//request.setAttribute("msg","updated");
	        getServletContext().getRequestDispatcher("/WEB-INF/admin.jsp").forward(request, response);
		}
		if(admin_id == null)
		{	request.setAttribute("msg", "please Login to enter");
			 getServletContext().getRequestDispatcher("/Login.jsp").forward(request, response);
		}
		else {
			RegsiterBean bean = new RegsiterBean();
			bean.setEmp_id(emp_id);
			String stat = request.getParameter(emp_id);
			if(stat != null)
			{
				if(stat.equals("Activated"))
				{
					bean.setApproval("Yes");
				}
				else bean.setApproval("No");
				int count = DataforAODOA.UpdateStatusUser(bean);
				if(count > 0)
				{
					List<Object> db = new ArrayList<Object>();
					db.addAll(DataforAODOA.GetUsersInfo());
					request.setAttribute("value", db);
					LoginBean bean1 = new LoginBean();  
					bean1.setEmp_id(admin_id);  
					request.setAttribute("bean",bean1); 
					//request.setAttribute("msg","updated");
					getServletContext().getRequestDispatcher("/WEB-INF/admin.jsp").forward(request, response);
		
				}
				else {
					List<Object> db = new ArrayList<Object>();
					db.addAll(DataforAODOA.GetUsersInfo());
					request.setAttribute("value", db);
			    	LoginBean bean1 = new LoginBean();  
			        bean1.setEmp_id(admin_id);  
			    	request.setAttribute("bean",bean1); 
			    	request.setAttribute("msg1","could not update");
			        getServletContext().getRequestDispatcher("/WEB-INF/admin.jsp").forward(request, response);
					
				}
		
			}
			else {
				List<Object> db = new ArrayList<Object>();
				db.addAll(DataforAODOA.GetUsersInfo());
				request.setAttribute("value", db);
		    	LoginBean bean1 = new LoginBean();  
		        bean1.setEmp_id(admin_id);  
		    	request.setAttribute("bean",bean1); 
		    	request.setAttribute("msg1","Please choose an option");
		        getServletContext().getRequestDispatcher("/WEB-INF/admin.jsp").forward(request, response);

			}		
				
		}
	
	

			

		}
	}


