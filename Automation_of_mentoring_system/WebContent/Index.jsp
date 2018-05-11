<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@page import="org.apache.catalina.valves.ErrorReportValve"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Maharishi Markandeshwar Deemed University</title>

<!-- Linking External Css File -->
<link rel="stylesheet" href="login.css">

<!-- Linking eternal css file for Modal -->
<link rel="stylesheet" href="Modal.css">

</head>
<body>
	<!-- Login box container -->
	<div class="loginbox">

		<!-- logo -->
		<a href="https://www.mmumullana.org/"> <img class="logo"
			src="User.png" alt="logo">
		</a> <br>
		<br>
		<br>
		<!-- Form -->
		<form action="userLogin" method="post" align="centre" id="one">

			<!-- UserName -->
			<input type="text" name="User" placeholder="User Name" id="uname"
				required="required"> <br>

			<!-- Password -->
			<input type="password" id="pass" name="Password"
				placeholder="Password" required="required"> <br>
			<!-- Selection -->
			<select name="usertype" required="required" id="sel" style="width: 135px; height: 29px">
				<option value="Mentor"><font text-align="center">Mentor</font>
				</option>
				<option value="Student"><font text-align="center">Student</font></option>
				<!--<option value="Subject Teacher"><font text-align="center">Subject Teacher</font></option>
      			<option value="Result Branch"><font text-align="center">Result Branch</font></option> -->
			</select> <br> <br>

			<!-- Forget Password -->
			<a href="#" class="fp" onclick=" checkyourself(); savevalue();">Forget
				Password?</a> &nbsp;
			<!-- Change Password -->
			<a href="#" class="cp"
				onclick="document.getElementById('id01').style.display='block'">Change
				Password?</a>
			<!-- Submit Button -->
			<input type="submit" id="submit" name="Submit" value="Sign In">

		</form>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>

	<!-- Inserting webname -->
	<div class="Webtitile">
		<img class="webname" src="webtitle.png" alt="name">
	</div>
	<br>

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
				<button type="submit">Change Password</button>
				<br>
				<button type="button"
					onclick="document.getElementById('id01').style.display='none';"
					class="cancelbtn">Cancel</button>
			</div>
		</form>
	</div>
	<!-- End of Modal -->
	<!-- To check the user type -->
	<script type="text/javascript">
			function checkyourself()
			{
				var x=document.getElementById("sel");
				var utype=x.options[x.selectedIndex].value;
				var answer=confirm("You are "+utype);
				if(answer)
				{
					document.getElementById('fp').style.display='block';
				}
				else
				{
					document.getElementById('fp').style.display='none';
				}
			}
</script>

	<!-- The Modal to forget password-->
	<div id="fp" class="modal">
		<span onclick="document.getElementById('fp').style.display='none'"
			class="close" title="Close Modal">&times;</span>
		<!-- Modal Content -->
		<form name="forgetPassword" method="post" action="ForgetP"
			class="modal-content animate">
			<div class="imgcontainer">
				<img src="changepassword.png" alt="Avatar" class="avatar">
			</div>

			<script type="text/javascript">
			function savevalue()
			{
				var x=document.getElementById("sel");
				var usertype=x.options[x.selectedIndex].value;
				document.getElementById("hidden").value=usertype;
				return usertype;
			}
		</script>

			<div class="container">
				<input type="email" class="modalpass"
					placeholder="Registered Mail Id" name="mailid" required> <br>
				<input type="hidden" name="hidden" value="" id="hidden">
				<button type="submit">Change Password</button>
				<br>
				<button type="button"
					onclick="document.getElementById('fp').style.display='none'"
					class="cancelbtn">Cancel</button>
				<br> <br>
				<caption style="padding: 10px">
					<i><span style="caption-side: inherit;"><font
							style="position: absolute;">Password will be mailed to the
								respective Mail ID</font></i>
				</caption>
			</div>
		</form>
	</div>
	<!-- modal end-->


	<!-- Script Start for change password -->
	<script>
var modal1 = document.getElementById('id01');

window.onclick = function(event) 
{
    if (event.target == modal1) 
    {
        modal1.style.display = "none";
    }
}
</script>
	<!-- Script End -->

	<!-- Script Start for forget password -->
	<script>
var modal = document.getElementById('fp');

window.onclick = function(event) 
{
    if (event.target == modal) 
    {
        modal.style.display = "none";
    }
}
</script>
	<!-- Script End -->

</body>
</html>