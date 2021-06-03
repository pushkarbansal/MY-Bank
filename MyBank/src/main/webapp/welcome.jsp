<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="HandheldFriendly" content="true">
<link href="http://fonts.googleapis.com/css?family=Aclonica" rel="stylesheet" type="text/css" />
<link href="http://fonts.googleapis.com/css?family=Pattaya" rel="stylesheet" type="text/css" />

<title>Welcome to MyBank</title>

<style>

.nav{

background-color:#5b80bf;
 width:27%;
 text-align:center;
 padding-top:1%;
 padding-bottom:1%;
 margin-bottom:3%;
display: inline-block;
font-size:150%;
}

.outer{
background-color:blue;
padding-left:10%;
padding-right:10%;
padding-TOP:3%;

margin-top:14%;
paddin-top:5%;
}
</style>


</head>
<body style="background-color:#8f8cad;font-family:Aclonica;">

<center>
<h1 style="font-family:Pattaya;  font-size:350%;">
MY BANK 
</h1>
</center>

<div  class="outer">



<%
if(session.getAttribute("admin")==null)
{
	response.sendRedirect("adminlogin.jsp");
}
else

%>




<nav>
<div class="nav" style="margin-left:23%"><a href="deleterecords.jsp">Check Records</a></div>
<div class="nav"><a href="Logout.jsp">Logout</a></div>
</nav>
</div>

<br><br>





</body>
</html>