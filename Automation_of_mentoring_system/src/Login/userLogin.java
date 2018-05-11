package Login;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;

import Connection.myConnection;

/**
 * Servlet implementation class userLogin
 */
@WebServlet(description = "This Servlet Class will get the value from login.html and will check the user authenticity", urlPatterns = { "/userLogin" })
public class userLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	Blob image=null;
	int unsuccessful=3;
	ArrayList results=new ArrayList();
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try
		{   
			
			
			String userName;
			Connection con=myConnection.getConnection();//Creating connection
			Statement statement=con.createStatement();
			String uname=request.getParameter("User");//getting value from user name text field
			String password=request.getParameter("Password");//getting value from password text field
			String check=request.getParameter("usertype");
			
			//getting value from select option
			String utype="mentorlogin";
			if(check.equals("Mentor"))
			{
				utype="mentorlogin";
			}
			else if (check.equals("Student")) 
			{
				utype="studentlogin";
			}
			else if(check.equals("Subject Teacher"))
			{
				utype="subjectteacherlogin";
			}
			else if(check.equals("Result Branch"))
			{
				utype="resultbranchlogin";
			}
			ResultSet resultset=statement.executeQuery("select * from "+utype+" where uname='"+uname+"'");
			while(resultset.next())
			{
				if(resultset.getString("password").equals(password))
				{
					userName=resultset.getString("userName");
					HttpSession ses=request.getSession();
					ses.setAttribute("user",uname);
					ses.setAttribute("userName",userName);
					if(utype.equals("mentorlogin"))
					{
						response.sendRedirect("loginsuccessmentor.jsp");
					}
					else if (utype.equals("studentlogin")) 
					{
						response.sendRedirect("loginsuccessstudent.jsp");
					}
					/*else if (utype.equals("subjectteacherlogin")) 
					{
						response.sendRedirect("loginsuccesssubjectteacher.jsp");
					}
					else if (utype.equals("resultbranchlogin")) 
					{
						response.sendRedirect("loginsuccessresultbranch.jsp");
					}*/
				}
				else
				{
					if(unsuccessful>=1)
					{
						RequestDispatcher rd=request.getRequestDispatcher("/Loginerror.html");  
				        rd.include(request, response);
				        unsuccessful -=1;
					}
					else
					{
						RequestDispatcher rd=request.getRequestDispatcher("/overattempt.html");  
				        rd.include(request, response);
					}
				}
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
}
