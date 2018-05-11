package Register;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Connection.myConnection;

/**
 * Servlet implementation class registerSemester
 */
@WebServlet("/registerSemester")
public class registerSemester extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		// TODO Auto-generated method stub
		request.getRequestDispatcher("Register.jsp").include(request, response); 
		try
		{
			Connection con=myConnection.getConnection();//Creating connection
			Statement statement=con.createStatement();
			String sfname=request.getParameter("fname");
			String slname=request.getParameter("lname");
			String semester=request.getParameter("sem");
			String section=request.getParameter("section");
			String group=request.getParameter("group");
			String sex=request.getParameter("gen");
			String categorgy=request.getParameter("cat");
			String mail=request.getParameter("smailid");
			String DOB=request.getParameter("dob");
			String rollnumber=request.getParameter("rno");
			String StudentAreaCode=request.getParameter("sareacode");
			String StudentPhoneNumber=request.getParameter("sphone");
			String geolocation=request.getParameter("geoloc");
			String street=request.getParameter("street_number");
			String route=request.getParameter("route");
			String city=request.getParameter("locality");
			String state=request.getParameter("administrative_area_level_1");
			String zip=request.getParameter("postal_code");
			String country=request.getParameter("country");
			String fMotherName=request.getParameter("mfname");
			String lMotherName=request.getParameter("mlname");
			String fFatherName=request.getParameter("ffname");
			String lFatherName=request.getParameter("flname");
			String MotherAreaCode=request.getParameter("mareacode");
			String MotherPhoneNumber=request.getParameter("mphone");
			String FatherAreaCode=request.getParameter("fareacode");
			String FatherPhoneNumber=request.getParameter("fphone");
			String MotherMailid=request.getParameter("mothermailid");
			String FatherMailId=request.getParameter("fathermailid");
			String MotherOccupation=request.getParameter("motheroccupation");
			String FatherOccupation=request.getParameter("fatheroccupation");
			
			
			
			
			
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}

}
