<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

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
#submit
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
<meta charset="ISO-8859-1">
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<link href="http://fonts.googleapis.com/css?family=Aclonica" rel="stylesheet" type="text/css" />
<link href="http://fonts.googleapis.com/css?family=Pattaya" rel="stylesheet" type="text/css" /> 	
<meta name="HandheldFriendly" content="true">
<title>Deposit</title>

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
</center>

<form method="post" action="CustomerFunctions">

<label for="deposit">AMOUNT TO BE DEPOSIT:</label>
<input type="number" required  name="deposit" id="deposit" placeholder="$0.00">

<input type="submit" value="Deposit" name="submit" id=submit>

<br><br>
<div style="color:green">
<%

if(session.getAttribute("deposit")!=null)
{
	out.print(session.getAttribute("deposit"));
	session.setAttribute("deposit",null);
}
%>
</div>

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

<div class="goback">
<a href="welcomecustomer.jsp">Go Back</a>
</div>



</body>
</html>