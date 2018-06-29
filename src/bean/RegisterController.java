package bean;
import java.io.IOException;
import java.io.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegisterController
 */
@WebServlet("/RegisterController")
public class RegisterController extends HttpServlet {
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
		  String userid = request.getParameter("emp_id");
		  String first_name = request.getParameter("first-name");
		  String last_name = request.getParameter("last-name");
		  String contact = request.getParameter("contact");
		  String User_type = request.getParameter("select_user");
		  String pwd = request.getParameter("password");
		  String email = request.getParameter("Email");
		  RegsiterBean bean=new RegsiterBean();  
	        bean.setEmp_id(userid);
	        bean.setfirst_name(first_name);
	        bean.setLast_name(last_name);
	        bean.setContact(contact);
	        bean.setUserType(User_type);
	        bean.setPass(pwd);
	        bean.setEmail(email);
	        bean.setApproval("No");
	        //System.out.println(userid + " " + first_name + " " + last_name + " " + User_type);
	        request.setAttribute("bean",bean);
	        int count = RegisterDoa.register(bean);
	        if(count > 0)
	        {
	        	System.out.println(userid + " " + first_name + "1" + last_name + " " + User_type);
	        	RequestDispatcher rd=request.getRequestDispatcher("Login.jsp");  
	            rd.forward(request, response);  
	        }
	        else {
	        	PrintWriter out = response.getWriter();
	           out.println("sorry, you could not be registered");
	        }
	}

}
