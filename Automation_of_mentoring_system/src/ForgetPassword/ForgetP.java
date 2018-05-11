package ForgetPassword;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.sun.glass.ui.CommonDialogs.Type;

import java.io.*;
import java.util.*;
import java.util.Date;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.mail.*;
import javax.mail.Message.RecipientType;
import javax.mail.internet.*;
//import javax.activation.*;

import Connection.myConnection;

/**
 * Servlet implementation class ForgetP
 */
@WebServlet("/ForgetP")
public class ForgetP extends HttpServlet
{
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	ResultSet rs=null;
	Statement statement = null;
	int count=0;
	HttpSession ses;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		// TODO Auto-generated method stub
		try
		{
			Connection con=myConnection.getConnection();//Creating connection
			String mailid=request.getParameter("mailid");
			String check=request.getParameter("hidden");
			//getting value from select option
			String utype=null;
			if(check.equals("Mentor") || check.equals(null))
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
			statement =con.createStatement();
			rs=statement.executeQuery("select * from "+utype+" where mailid='"+mailid+"'");
			final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
			while(rs.next())
				{
					count++;
					String uname=(String)rs.getString("userName");
					String id=(String)rs.getString("uname");
					String to=(String)rs.getString("mailid");
					String admin=(String)"mentorautomationmmdu@gmail.com";
					String password=(String)rs.getString("password");
					ses=request.getSession();
					String subject="Hey user "+uname+"\n with id "+id+",\n Your Password is =>"+password+"<= make sure this is confidential to you.\n change your password\n for futher query contact administrator";
					String host="localhost";
					Properties prop=System.getProperties();
					
					//get properties object
					prop.setProperty("mail.smtp.host", "smtp.gmail.com");
					prop.setProperty("mail.smtp.socketFactory.class", SSL_FACTORY);
					prop.setProperty("mail.smtp.socketFactory.fallback", "false");
					prop.setProperty("mail.smtp.port", "465");
					prop.setProperty("mail.smtp.socketFactory.port", "465");
					prop.put("mail.smtp.auth", "true");
					prop.put("mail.debug", "true");
					prop.put("mail.store.protocol", "pop3");
					prop.put("mail.transport.protocol", "smtp");
					Session mailsession=Session.getDefaultInstance(prop,new javax.mail.Authenticator()
					{
						@Override
						protected PasswordAuthentication getPasswordAuthentication()
						{
							return new PasswordAuthentication("mentorautomationmmdu@gmail.com","adminmailid");
						}
					});
					mailsession.setDebug(true);
					try
					{
			    	
						//create a new message
						Message message=new MimeMessage(mailsession);
				
						//set the from and to fields
						message.setFrom(new InternetAddress(admin,"Mentor"));
						message.setRecipient(RecipientType.TO,new InternetAddress(to,false));
						message.setSubject("Forget Password");
						message.setText(subject);
						message.setSentDate(new Date());
						Transport.send(message);
					}
					catch(Exception e)
					{
						e.printStackTrace();
					}
				  	ses.setAttribute("userName",uname);
			    	response.sendRedirect("mail_sent.jsp");
				}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		if(count==0)
		{
			request.getSession();
			response.sendRedirect("Index.jsp");
		}
	}
}
			    