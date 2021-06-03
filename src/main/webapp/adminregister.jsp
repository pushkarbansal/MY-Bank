<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<link href="http://fonts.googleapis.com/css?family=Aclonica" rel="stylesheet" type="text/css" />
<link href="http://fonts.googleapis.com/css?family=Pattaya" rel="stylesheet" type="text/css" />
<meta name="HandheldFriendly" content="true">
<title>Admin Register:</title>

<style>
.box1{
display: block;
margin-left:auto;
margin-right:auto;
margin-top:6%;
padding-top:5%;
padding-bottom:5%;
 width: 40%;
 background-color:grey;
 text-align:center;
box-shadow: 0 20px 50px rgba(8, 112, 184, 0.7);
}

.goback
{
	text-align:center;
	background-color:grey;
	margin-top: 20px;
    margin-left: 40%;
    padding-left: 0px;
    margin-right: 40%;
    padding-top: 20px;
    padding-bottom: 20px;
    margin-bottom: 200px;
    font-size:120%;

}

.form{
width:50%;
padding-top:1%;
padding-bottom:1%;
}
#submit
{
background-color: #4CAF50; /* Green */
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 150%;
  
  }


</style>
</head>
<body style="background-color:#ded1d1; font-family:Aclonica;">

<center>
<h1 style="font-family:Pattaya;  font-size:350%;">
MY BANK 
</h1>
</center>
</div>


<DIV class="box1">

<H3 ><u>REGISTRATION FOR ADMINS:</u></H3>



<FORM action="Adminverify" method="post">
<label for=email>E-MAIL:</label>

<input type="email" id="email" name="email" class="form" required placeholder="Example@gmail.com">
<br>
<br>
<label for="pass">Password:  </label>
<input type="password" name="pass" required id=pass class="form" style="margin-right:7%">
<br><br>
<input type="checkbox" onclick="myFunction()">Show Password
<br><br>
<input type="submit" value="RegisterAdmin" name="submit" id="submit">

<br><br>
<div style="color:red">
<%

if(session.getAttribute("feedback")!=null)
{
	out.print(session.getAttribute("feedback"));
	session.setAttribute("feedback",null);
}

%>
</div>
</form>
</DIV>
<script>
function myFunction() {
  var x = document.getElementById("pass");
  if (x.type === "password") {
    x.type = "text";
  } else {
    x.type = "password";
  }
}


</script>
<div class="goback">
<a href="adminIndex.html">Go Back</a>
</div>
</body>
</html>