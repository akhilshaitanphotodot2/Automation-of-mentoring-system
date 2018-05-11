<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@page import="org.apache.catalina.valves.ErrorReportValve"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%><!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Maharishi Markandeswar Deemed University</title>
<!-- Linking External Css File -->
<link rel="stylesheet" href="login.css">

<!-- Linking eternal css file for Modal -->
<link rel="stylesheet" href="Modal.css">

</head>
<body>
	<!-- scriptlet  -->
	<%
		String user=(String)session.getAttribute("userName");
		String userId=(String)session.getAttribute("user");
	%>
	<!-- Inserting webname -->
	<div class="Webtitile" style="margin-right: 200px; margin-top: -55px">
		<img class="webname" src="webtitle.png" alt="name">
	</div>
	<br>
	<!-- End of Webname -->

	<font style="margin-left: 320px" color="red" size="5px;"><b></b><%=session.getAttribute("userName")%><b><i>
				Mail has been successfully sent <small><big></big></small><a
				href="#" class="fp"
				onclick="document.getElementById('id01').style.display='block'"><small><big>Change
							Password</big></small></a>&nbsp;or <a href="Index.jsp" class="fp">LogIn</a>
		</i></b></font>
	<!-- The Modal to change password -->
	<div id="id01" class="modal">
		<span onclick="document.getElementById('id01').style.display='none'"
			class="close" title="Close Modal">&times;</span>

		<!-- Modal Content -->
		<form name="changePassword" method="post"
			class="modal-content animate">
			<div class="imgcontainer">
				<img src="changepassword.png" alt="Avatar" class="avatar">
			</div>

			<div class="container">
				<input type="text" class="modalpass" placeholder="User Name"
					name="uname" required> <br> <input type="password"
					class="modalpass" placeholder="Enter Old-Password" name="oldp"
					required> <br> <input type="password"
					class="modalpass" placeholder="Enter New-Password" name="psw"
					required> <br> <input type="password"
					class="modalpass" placeholder="Confirm New-Password" name="npsw"
					required> <br>
				<button type="submit" style="height: 25px;">Change Password</button>
				<br>
				<button type="button"
					onclick="document.getElementById('id01').style.display='none';"
					class="cancelbtn">Cancel</button>
			</div>
		</form>
	</div>
	<!-- Script Start for forget passowrd -->
	<script>
var modal1 = document.getElementById('id01');

window.onclick = function(event) {
    if (event.target == modal1) {
        modal1.style.display = "none";
    }
}
</script>
	<!-- Script End -->

</body>
</html>