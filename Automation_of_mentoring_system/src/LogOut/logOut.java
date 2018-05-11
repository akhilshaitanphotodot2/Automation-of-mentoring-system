package LogOut;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class logOut
 */
@WebServlet(description = "Kill The Session", urlPatterns = { "/logOut" })
public class logOut extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("loginsuccessstudent.jsp").include(request, response);  
        
        HttpSession session=request.getSession();  
        session.removeAttribute("user");
        session.removeAttribute("userName");
        request.getContextPath();
        session.invalidate(); 
        response.sendRedirect("Index.jsp");
	}

}
