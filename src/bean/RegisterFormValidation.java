package bean;
//import java.io.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegisterFormValidation
 */
@WebServlet("/RegisterFormValidation")
public class RegisterFormValidation extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userid = request.getParameter("User_id");
		
		int ans = RegisterDoa.UserExits(userid);
		System.out.print(ans);
		System.out.println(userid);
		response.setContentType("text/plain;charset=UTF-8");
		 if( ans == 1)
			response.getWriter().write("1");
		 else 
			 {
			 ans = 0;
			 response.getWriter().write("0");
			 }
		

			
		
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doPost(request, response);
	}
	

}
