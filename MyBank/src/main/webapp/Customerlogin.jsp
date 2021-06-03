<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
<link href="http://fonts.googleapis.com/css?family=Aclonica" rel="stylesheet" type="text/css" />
<link href="http://fonts.googleapis.com/css?family=Pattaya" rel="stylesheet" type="text/css" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="HandheldFriendly" content="true">
<title>Login My Bank </title>
<style>

.box1{
display: block;
margin-left:auto;
margin-right:auto;
margin-top:6%;
padding-top:5%;
padding-bottom:5%;
 width: 45%;
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

.form{
width:50%;
padding-top:1%;
padding-bottom:1%;
}



</style>




</head>
<body style="background-color:#ded1d1; font-family:Aclonica;">

<div>
<center>
<h1 style="font-family:Pattaya;  font-size:350%;">
MY BANK 
</h1>
</center>
</div>
<div class="box1">

<u>
<h2>Customer Login</h2>
</u>



<div>
<form action="Customerverify" method="Post" >
<label for="id">E-mail</label>
<input type="text" required  id= "id" name="email" class="form">
<br>
<br>

<label for="pass">PASSWORD:</label>
<input type="password"  required id= "pass" name="pass" class="form" style="margin-right:10%">
<br>
<br>
<input type="checkbox" onclick="myFunction()">Show Password
<br><br>
<input type="submit" value="customerlogin" name="submit" id="submit">
<br><br>

<div style="color:#ce2600">
<%

if(session.getAttribute("feedback")!=null)
{
	out.print(session.getAttribute("feedback"));
	session.setAttribute("feedback",null);
}

%>
</div>
</form>
</div>
</div >
<div class="goback">
<a href="customerIndex.html">Go Back</a>
</div>
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
</body>
</html>