package bean;
import java.io.*;
import javax.servlet.*;
import java.util.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ControllerServlet
 */
@WebServlet("/ControllerServlet")
public class ControllerServlet extends HttpServlet {
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
		 response.setContentType("text/html");  
	        //PrintWriter out=response.getWriter();  
	          
	        String name=request.getParameter("emp_id");  
	        String password=request.getParameter("password");  
	        HttpSession session = request.getSession();
	        System.out.println("name = " + name + " passWord" + password);
	        if(session.getAttribute("username") == null || session.getAttribute("session") == "")
	        	{
			        	request.setAttribute("username",name);
			        	request.setAttribute("password", password);
			        	
			        	LoginBean bean = new LoginBean();  
				        bean.setEmp_id(name);  
				        bean.setPass(password);  
				        request.setAttribute("bean",bean);  
				        
				        int status=LoginDoa.validate(bean);
				        if(status == 1)
				        	{
				        	session.setAttribute("username", bean.getEmp_id());
		        			session.setAttribute("password", bean.getPass());

				        	}
				        
				        System.out.println("this was when, the session was not set"+status);
				        
				        int user_type = 0;;
				        	
				        if(status == 1){
				        	 user_type = LoginDoa.checkUser(bean);
				        	 System.out.println("the UserType is" + user_type);
					        		if(user_type == 1)
					        		{	
					        			
					        			List<Object> db = new ArrayList<Object>();
					        			db.addAll(DataforAODOA.getData(bean.getEmp_id()));
						        		request.setAttribute("value", db);
					        			List<Object> db1 = new ArrayList<Object>();

						        		db1.addAll(DataforAODOA.getPlaceList());
					        			request.setAttribute("List", db1);
						        		//out.println(vd.getDepartment())
						        		getServletContext().getRequestDispatcher("/WEB-INF/User.jsp").forward(request, response);
						        	
					        		}
					        		else if(user_type == 0) {
					        			List<Object> db = new ArrayList<Object>();
					        			db.addAll(DataforAODOA.getDataSO(bean.getEmp_id()));
						        		request.setAttribute("value", db);
						        		getServletContext().getRequestDispatcher("/WEB-INF/User1.jsp").forward(request, response);
					        		}
					        		else {
					        			List<Object> db = new ArrayList<Object>();
					        			db.addAll(DataforAODOA.GetUsersInfo());
						        		request.setAttribute("value", db);
						        		getServletContext().getRequestDispatcher("/WEB-INF/admin.jsp").forward(request, response);
					        		}
					        		
					        	
				           
				        
				        	}  
				        else if(status == 0){  
				        	if(session.getAttribute("username")!=null)
				        	{
				        		System.out.println("the password was incorrect session set");
				        		request.setAttribute("msg", "your password or username may be wrong");

					        	 getServletContext().getRequestDispatcher("/Login.jsp").forward(request, response);

				        	}
				        	else{
				        		request.setAttribute("msg", "your password or username may be wrong");
				        	
				        	
				        	 getServletContext().getRequestDispatcher("/Login.jsp").forward(request, response);
				        	}
				        }
				        else {
				        	System.out.println("your admin hasn;t approved session set");
				        	
				        	request.setAttribute("msg", "you haven't been approved by the admin");
				        	
				        	 getServletContext().getRequestDispatcher("/Login.jsp").forward(request, response);
					        }
	        	}
	        else {
	        	LoginBean bean = new LoginBean();  
		        String uname = (String) session.getAttribute("username");  
		        String pass = (String) session.getAttribute("password");
		        System.out.println(uname + pass);
		        bean.setPass(pass);  
		        bean.setEmp_id(uname);
		        int status=LoginDoa.validate(bean);
		        if(status == 1)
		        {
		        	request.setAttribute("bean",bean);
		        	session.setAttribute("username", uname);
		        
		        	
			        int user_type1 = LoginDoa.checkUser(bean);
			        if(user_type1 == 1)
			        	
			        	{
			        	List<Object> db = new ArrayList<Object>();
	        			db.addAll(DataforAODOA.getData(bean.getEmp_id()));
	        			List<Object> db1 = new ArrayList<Object>();
	        			db1.addAll(DataforAODOA.getPlaceList());
	        			request.setAttribute("List", db1);
		        		request.setAttribute("value", db);
			        	getServletContext().getRequestDispatcher("/WEB-INF/User.jsp").forward(request, response);
			        	}
			        else if(user_type1 == 0)
			        	{
			        	
			        	List<Object> db = new ArrayList<Object>();
	        			db.addAll(DataforAODOA.getDataSO(bean.getEmp_id()));
		        		request.setAttribute("value", db);
			        	getServletContext().getRequestDispatcher("/WEB-INF/User1.jsp").forward(request, response);
			        	}
			        else {
			        	List<Object> db = new ArrayList<Object>();
	        			db.addAll(DataforAODOA.GetUsersInfo());
		        		request.setAttribute("value", db);
			        	getServletContext().getRequestDispatcher("/WEB-INF/admin.jsp").forward(request, response);

			        	
			        }

		        }
		        if(status == 0)
		        {	
		        	if(session.getAttribute("username")!=null)
		        	{
		        	 getServletContext().getRequestDispatcher("/Login.jsp").forward(request, response);
		        	
		        	System.out.println("the password was incorrect");
		        	}
		        else {
		        	request.setAttribute("msg", "your password or username may be wrong");
		        	
		        	 getServletContext().getRequestDispatcher("/Login.jsp").forward(request, response);
		        	
		        }
		        	
		             
		        }
		        else {
		        	System.out.println("your admin hasn;t approved");
		        	
		        	request.setAttribute("msg", "You haven't been approved by the admin");
		        	 getServletContext().getRequestDispatcher("/Login.jsp").forward(request, response);
		             
		        	
		        }
		        
	        }
	}

}
