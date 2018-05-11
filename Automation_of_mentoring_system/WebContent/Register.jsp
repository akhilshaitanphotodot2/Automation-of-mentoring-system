<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student Registration Form</title>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link href="registration.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- Resizing According to the window -->
<meta name="viewport" content="width=device-width,initial-scale=1">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
				


<style type="text/css">
::placeholder
{
	text-shadow: 2.5px;
	text-align: center;
	opacity: 1;
}
button
{
	margin-left: 42%;	
}
.checkbox
{
	margin-left:"50%";
}
</style>

<script type="text/javascript">
var placeSearch, autocomplete;
var componentForm = {
  street_number: 'short_name',
  route: 'long_name',
  locality: 'long_name',
  administrative_area_level_1: 'short_name',
  country: 'long_name',
  postal_code: 'short_name'
};

function initAutocomplete() {
// Create the autocomplete object, restricting the search to geographical
// location types.
autocomplete = new google.maps.places.Autocomplete(
  /** @type {!HTMLInputElement} */(document.getElementById('autocomplete')),
  {types: ['geocode']});

// When the user selects an address from the dropdown, populate the address
// fields in the form.
autocomplete.addListener('place_changed', fillInAddress);
}

function fillInAddress() {
// Get the place details from the autocomplete object.
var place = autocomplete.getPlace();

for (var component in componentForm) {
  document.getElementById(component).value = '';
  document.getElementById(component).disabled = false;
}

// Get each component of the address from the place details
// and fill the corresponding field on the form.
for (var i = 0; i < place.address_components.length; i++) {
  var addressType = place.address_components[i].types[0];
  if (componentForm[addressType]) {
    var val = place.address_components[i][componentForm[addressType]];
    document.getElementById(addressType).value = val;
  }
}
}

//Bias the autocomplete object to the user's geographical location,
//as supplied by the browser's 'navigator.geolocation' object.
function geolocate() {
if (navigator.geolocation) {
  navigator.geolocation.getCurrentPosition(function(position) {
    var geolocation = {
      lat: position.coords.latitude,
      lng: position.coords.longitude
    };
    var circle = new google.maps.Circle({
      center: geolocation,
      radius: position.coords.accuracy
    });
    autocomplete.setBounds(circle.getBounds());
  });
}
}
</script>
</head>

<body>
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
<div class="container-fluid">
	<div>
		<h1><i class="fa fa-registered" style="font-size:36px"></i>Register</h1>
		<p>Only for students *</p>
	</div>
<!-- Reg For Started -->
<form action="register" method="Post">
    <!-- Name -->
    <div class="form-group">
      <label for="Student Name">*Student Name:</label>
      <input type="text" class="form-control fa fa-pencil" id="fname" placeholder="Enter First Name" name="fname" required>
      <input type="text" class="form-control fa fa-pencil" id="lname" placeholder="Enter Last Name" name="lname" required>
    </div>
    
     <div class="form-group">
      <label for="Student Name">*Registering To Semester:</label>
      <input type="number" min="1" max="8" class="form-control fa fa-pencil" id="sem" placeholder="Enter the semester You are registering for" name="Semester" required>
     </div>
    
    <!-- Class -->
    <div class="form-group">
      <label for="Class">*Class:</label>
      <input type="text" class="form-control fa fa-flag" id="Section" placeholder="Section" name="section" required>
      <input type="text" class="form-control fa fa-flag" id="group" placeholder="Group" name="group" required>
    </div>
    <!-- Gender -->
    <div class="form-group">
      <label for="gender">*Gender:</label> <br>
      			<select name="gender" class="form-dropdown validate[required] form-validation-error fa fa-venus-mars form-control" required="required">
					<option value="" class="fa fa-venus-mars">Select Your Gender</option>
					<option value="Male" class="fa fa-male" id="gen">Male</option>
					<option value="Female" class="fa fa-female" id="gen">Female</option>
					<option value="Other" class="fa fa-random" id="gen">Others</option>
				</select>
    </div>
    <!-- Category -->
  	<div class="form-group">
      <label for="category">*Category:</label> 
      			<select name="category" data-component="dropdown" id="category" class="form-dropdown form-control" required="required">
      				<option value="">Select Your Category</option>
					<option value="GN(General)" id="cat">GN(General)</option>
					<option value="OBC(Other Backward Class)" id="cat">OBC(Other Backward Class)</option>
					<option value="SC(Schedule Caste)" id="cat">SC(Schedule Caste)</option>
					<option value="ST(Schedule Tribe)" id="cat">ST(Schedule Tribe)</option>
				</select>
	</div>
	
	   <!-- mail -->
    <div class="form-group">
      <label for="roll-number">*Mail Id:</label><p>(Updates Will be mailed to this mail id)</p>
             <input type="email" id="studentmailid" name="smailid" id="smailid"
					class="form-control form-number-input form-textbox validate[required] form-validation-error"
					value="" placeholder="example@example.com" required>
	</div>
	
	<!-- DOB -->
	<div class="form-group">
      <label for="dob">*Date of Birth:</label> <br>
      		<input type="date" class="form-control" id="dob" class="form-textbox jfInput-input jfCardDateInput" value="2018-05-05" data-age="" max="2100-12-30" required="required"> 
    </div>
    <!-- rOLL nUMBER -->
    <div class="form-group">
      <label for="roll-number">*Roll Number:</label> <br>
       <input type="text" class="form-control" id="rno" name="rollnumber" value="<%=userId%>" readonly="readonly">
	</div>
	<!-- Student Phone Number id -->
   <div class="form-group">
      <label for="Phone Number">*Student Phone Number:</label> <br>
				<div class="jfQuestion-fields" data-wrapper-react="true">
					<div class="jfField" data-type="areaCode">
						<input type="tel" id="sareacode" name="studentPhonearea"
							class="form-textbox form-control validate[required] forPhone jfInput-input hasSublabel"
							autocomplete="tel-area-code" size="3" value=""
							data-component="areaCode" required="" aria-required="true"
							aria-describedby="input_3_area_description" placeholder="Area Code">
					</div>
					
					<div class="jfField" data-type="phone">
						<input type="tel" id="sphone" name="studentPhonephone"
							class="form-textbox form-control formcontrol validate[required] forPhone jfInput-input hasSublabel"
							autocomplete="tel-local" size="8" value="" data-component="phone"
							required="" aria-required="true"
							aria-describedby="input_3_phone_description" placeholder="Phone Number">
					</div>
				</div>
	</div>
	<!-- Student Permanent Address -->
    <div class="form-group">
      	   <div class="container">
  <div class="panel panel-primary">
    <div class="panel-heading">
      <h2 class="panel-title">Permanent Address</h2>
    </div>
    <div class="panel-body">
      <input id="autocomplete" placeholder="Enter your address" id="geoloc" onFocus="geolocate()" type="text" class="form-control">
      <div id="address">
        <div class="row">
          <div class="col-md-6">
            <label class="control-label">Street address</label>
            <input class="form-control" id="street_number" name="pstreet" disabled="true">
          </div>
          <div class="col-md-6">
            <label class="control-label">Route</label>
            <input class="form-control" id="route" name="proute" disabled="true">
          </div>
        </div>
        <div class="row">
          <div class="col-md-6">
            <label class="control-label">City</label>
            <input class="form-control field" id="locality" name="pcity" disabled="true">
          </div>
          <div class="col-md-6"> 
            <label class="control-label">State</label>
            <input class="form-control" id="administrative_area_level_1" name="pstate" disabled="true">
          </div>
        </div>
        <div class="row">
          <div class="col-md-6">
            <label class="control-label">Zip code</label>
            <input class="form-control" id="postal_code" name="pzipcode" disabled="true">
          </div>
          <div class="col-md-6">
            <label class="control-label">Country</label>
            <input class="form-control" id="country" name="pcountrycode" disabled="true">
          </div>
        </div>
      </div>
    </div>
  </div>
</div>			
</div>
<caption>We will consider your Permanent Address also as a current address. To change your current address contact your mentor</caption>
				<script
					src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCCXGEngWtNxgz14FXkf7dCo7ukwudwyt0&libraries=places&callback=initAutocomplete"
					async defer>
				</script>
				
				

		
	<!-- Name -->
    <div class="form-group">
      <label for="Student Name">Mother's Name:</label>
      <input type="text" class="form-control fa fa-pencil" id="mfname" placeholder="Enter First Name" name="mfname" required>
      <input type="text" class="form-control fa fa-pencil" id="mlname" placeholder="Enter Last Name" name="mlname" required>
    </div>				    
    
    <!-- Name -->
    <div class="form-group">
      <label for="Student Name">Father's Name:</label>
      <input type="text" class="form-control fa fa-pencil" id="ffname" placeholder="Enter First Name" name="ffname" required>
      <input type="text" class="form-control fa fa-pencil" id="flname" placeholder="Enter Last Name" name="flname" required>
    </div>
    
    <!-- Mother's Name Phone Number id -->
   <div class="form-group">
      <label for="Phone Number">*Mother's Phone Number:</label> <br>
				<div class="jfQuestion-fields" data-wrapper-react="true">
					<div class="jfField" data-type="areaCode">
						<input type="tel" id="mareacode" name="motherPhonearea"
							class="form-textbox form-control validate[required] forPhone jfInput-input"
							autocomplete="tel-area-code" size="3" value=""
							data-component="areaCode" required="" aria-required="true" placeholder="Area Code">
					</div>
					
					<div class="jfField" data-type="phone">
						<input type="tel" id="mphone" name="motherPhonephone"
							class="form-textbox form-control formcontrol validate[required] forPhone jfInput-input"
							autocomplete="tel-local" size="8" value="" data-component="phone"
							required="" aria-required="true" placeholder="Phone Number">
					</div>
				</div>
	</div>
	<!-- Father's Phone Number id -->
   <div class="form-group">
      <label for="Phone Number">*Father's Phone Number:</label> <br>
				<div class="jfQuestion-fields" data-wrapper-react="true">
					<div class="jfField" data-type="areaCode">
						<input type="tel" id="fareacode" name="fatherPhonearea"
							class="form-textbox form-control validate[required] forPhone jfInput-input hasSublabel"
							autocomplete="tel-area-code" size="3" value=""
							data-component="areaCode" required="" aria-required="true" placeholder="Area Code">
					</div>
					
					<div class="jfField" data-type="phone">
						<input type="tel" id="fphone" name="fatherPhonephone"
							class="form-textbox form-control formcontrol validate[required] forPhone jfInput-input"
							autocomplete="tel-local" size="8" value="" data-component="phone"
							required="" aria-required="true" placeholder="Phone Number">
					</div>
				</div>
	</div>
	
	   <!-- mail -->
    <div class="form-group">
      <label for="roll-number">Mother's Mail Id:</label>
             <input type="email" id="mothermailid" name="mmailid"
					class="form-control form-number-input form-textbox validate[required] form-validation-error"
					value="" placeholder="example@example.com">
	</div>
	
	
	   <!-- mail -->
    <div class="form-group">
      <label for="roll-number">Father Mail Id:</label>
             <input type="email" id="fathermailid" name="fmailid"
					class="form-control form-number-input form-textbox validate[required] form-validation-error"
					value="" placeholder="example@example.com">
	</div>
	
	   <!-- occupation-->
    <div class="form-group">
      <label for="roll-number">Occupation:</label>
             <input type="text" id="motheroccupation" name="moccupation"
					class="form-control form-number-input form-textbox validate[required] form-validation-error"
					value="" placeholder="Mother's Occupation" required="required">
			 <input type="text" id="fatheroccupation" name="foccupation"
					class="form-control form-number-input form-textbox validate[required] form-validation-error"
					value="" placeholder="Father's Occupation" required="required">
			
	</div>
	
	<div class="form-group">
		<label for="achievements">Achievements:</label>
			<div class="form-group">
				<input type="text" name="Fest" id="fest" placeholder="Fest" class="form-control">
				<input type="text" name="Competition" id="cname" placeholder="Competition Name" class="form-control">
				<input type="number" min="0" max="3" name="Position" id="pos" placeholder="Position Accquired" class="form-control">
				<button type="button" onclick="changeIt()" class="btn btn-default btn-lg">
 				 <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>More Achievements
				</button>
			</div>	
			<div class="form-group" id="my_div">
			</div>
			
			
			<script>
			function changeIt()
			{
					var i = 1;
					my_div.innerHTML = my_div.innerHTML +"<input type='text' name='Fest' id='fest' placeholder='Fest' class='form-control'>"
					my_div.innerHTML = my_div.innerHTML +"<input type='text' name='Competition' id='cname' placeholder='Competition Name' class='form-control'>"
					my_div.innerHTML = my_div.innerHTML +"<input type='number' min='0' max='3' name='position' id='pos' placeholder='Position Accquired' class='form-control'><br>"


			}
			</script>
	</div>
	   <!-- occupation-->
    <div class="form-group">
      <label for="roll-number">Photo:</label>(scanned file of your photograph)
             <input type="file" id="photofile" name="photofile"
					class="form-control" accept="image/*" required="required">
	</div>
	
	   <!-- occupation-->
    <div class="form-group">
      <label for="roll-number">Signature:</label>(scanned file of your Signature)
             <input type="file" id="photofile" name="photofile"
					class="form-control" accept="image/*" required="required">
	</div>
    
    <div class="checkbox form-group">
      <input type="checkbox" name="remember" required="required">I accept all <a href="https://www.mmumullana.org/link/disclaimer">T&C</a>
    </div>
    
    
    <input type="submit" class="btn btn-default btn btn-lg">
    
  </form>
</div>
</body>
</html>