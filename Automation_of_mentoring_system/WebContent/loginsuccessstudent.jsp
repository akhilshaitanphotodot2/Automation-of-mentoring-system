<%@page import="com.mysql.jdbc.Statement"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@page import="javax.servlet.*"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
   pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student</title>

<link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link href="studentloggedin.css" rel="stylesheet">
<link href="registration.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- Resizing According to the window -->
<meta name="viewport" content="width=device-width,initial-scale=1">


</head>
<body>


<!-- including scriptlet -->
<%
		String user=(String)session.getAttribute("userName");
		String userId=(String)session.getAttribute("user");
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		response.setHeader("progma", "no-cache");
		response.setHeader("Expires","0");
		if(session.getAttribute("user")== null)
		{
			response.sendRedirect("Index.jsp");
		}
%>



<!-- Sidebar -->
<div class="w3-sidebar w3-bar-block w3-border-right" style="display:none" id="mySidebar">
  <button onclick="w3_close()" class="w3-bar-item w3-large">&#x26F9; <%=user %></button>
	   <a href="#"
			onclick="javascript:void(window.open('http://www.mmumullana.org/home/result','blank','scrollbars=yes,toolbar=no,width=1000,height=500'))" class="w3-bar-item w3-button fa fa-pie-chart">Marks</a>
		<a href="#"
			onclick="javascript:void(window.open('http://sms.mmumullana.org','blank','scrollbars=yes,toolbar=no,width=1000,height=500'))" class="w3-bar-item w3-button fa fa-rocket">Attendance</a>
		<a href="#"
			onclick="javascript:void(window.open('Register.jsp','blank','scrollbars=yes,toolbar=no,width=10000,height=10000'))" class="w3-bar-item w3-button fa fa-file">Registration</a>
		<a href="#"
			class="w3-bar-item w3-button fa fa-bug">Complain</a>
		<a href="#"
			onclick="javascript:void(window.open('contact.html','blank','scrollbars=yes,toolbar=no,width=1000,height=500'))'" class="w3-bar-item w3-button fa fa-volume-control-phone">Contact</a>
		<a href="logOut" 
			class="w3-bar-item w3-button">Sign Out</a>
</div>

<!-- Page Content -->
<div class="w3-teal">
  <button class="w3-button w3-teal w3-xlarge" onclick="w3_open()">&#9776</button>
  <div class="w3-container fa fa-user-circle-o">
    <h1><%=user %></h1>
  </div>
</div>

<script>
function w3_open() {
    document.getElementById("mySidebar").style.display = "block";
}
function w3_close() {
    document.getElementById("mySidebar").style.display = "none";
}
</script>


	
</body>
</html>
