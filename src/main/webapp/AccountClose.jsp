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
<style>
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
.submit
{
background-color: #4CAF50; /* Green */
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  }
</style>
<title>Close your Account</title>
</head>
<body style="font-family:Aclonica;">




<% if(session.getAttribute("valid")==null)
    	{
    	response.sendRedirect("Customerlogin.jsp");
    	return;
    	}
%>




<center>
<h1 style="font-family:Pattaya;  font-size:350%;">
MY BANK 
</h1>


<h2>Are you sure!!!,<h2></h2><h4>You Want To Close Your Account!!!</h4>

<form method="post" action="CustomerFunctions">

<input type="submit" name="submit" class="submit" value="close" >



<div style="color:red">
<%
if(session.getAttribute("error")!=null)
{
	out.print(session.getAttribute("error"));
	session.setAttribute("error",null);
}

%>
</div>
</form>



</center>



<div class="goback">
<a href="welcomecustomer.jsp">Go Back</a>
</div>



</body>
</html>