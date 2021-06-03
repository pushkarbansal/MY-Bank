<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.mybank.mvc.Customer" %>
    
   
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
.nav{

background-color:#5b80bf;
 width:13%;
 text-align:center;
 padding-top:2%;
 padding-bottom:2%;
display: inline-block;
font-size:13	0%;
}

.outer{
background-color:blue;
padding-left:8%;
padding-right:8%;
margin-top:5%;
 padding-top:2%;	
padding-top:4%;
padding-bottom:3%;
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
<div>
 <% if(session.getAttribute("valid")==null)
    	{
    	response.sendRedirect("Customerlogin.jsp");
    	return;
    	}
    	%>
<%
Customer c=(Customer)session.getAttribute("data");
//Customer c=request.getAttribute("data");
//Customer c=new Customer();
%>




</div>


<nav>
<div class="nav"><a href="editdetails.jsp">Edit details</a></div>
<div class="nav"><a href="Deposit.jsp">Deposit</a></div>
<div class="nav"><a href="withdraw.jsp">Withdrawal</a></div>
<div class="nav"><a href="Statement.jsp">Statement</a></div>
<div class="nav" style="width:15%;"><a href="transfer.jsp">Transfer money</a></div>
<div class="nav"style="width:15%;"><a href="AccountClose.jsp">Account closure</a></div>
<div class="nav"><a href="Logout.jsp">Logout</a></div>
</nav>




<div>

<center>
<h1 style="color:white">Welcome to your MyBank Portal   <span style="color:orange"><% out.print(c.getName().toUpperCase());%><span></h1>
</center>
</div>


<div>
  
  
  


<center>
<h1 style="color:white">The Balance in your Account is <span style="color:orange"> $

<%
out.print(c.getBalance());
%>

<span>
</h1>
</center>
<center>
<h1 style="color:white">Your Account Number is  <span style="color:orange"> 

<%
out.print(c.getAccountNumber());
%>

<span>
</h1>




</center>



</div>

</div>
</body>
</html>