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

<title>TRANSFER AMOUNT</title>

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

<label for="name">Account Holder Name:</label>
<input type="text" required name="name" id="name" placeholder="ex. pushkar bansal">

<br><br>
<label for="number">Account Numnber:</label>
<input type="number" required  name="number" id="number" placeholder="ex.1345567412346543">
<br><br>
<label for="amount">Amount:</label>
<input type="number" required  name="amount" id="amount" placeholder="$5000">
<br><br>


<input type="submit" name=submit id="submit" value="transfer">
<div style="color:green">
<%

if(session.getAttribute("transfer")!=null)
{
	out.print(session.getAttribute("transfer"));
	session.setAttribute("transfer",null);
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
</form>

<div class="goback">
<a href="welcomecustomer.jsp">Go Back</a>
</div>

</body>
</html>