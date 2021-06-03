<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.ResultSet" %>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="HandheldFriendly" content="true">
<link href="http://fonts.googleapis.com/css?family=Aclonica" rel="stylesheet" type="text/css" />
<link href="http://fonts.googleapis.com/css?family=Pattaya" rel="stylesheet" type="text/css" />
<title>Records</title>
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
.styled-table {
    border-collapse: collapse;
    margin: 25px 0;
    font-size: 0.9em;
    font-family: sans-serif;
    min-width: 400px;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
}
.styled-table th,
.styled-table td {
    padding: 12px 15px;
}
.styled-table tbody tr {
    border-bottom: 1px solid #dddddd;
}

.styled-table tbody tr:nth-of-type(even) {
    background-color: #f3f3f3;
}

.styled-table tbody tr:last-of-type {
    border-bottom: 2px solid #009879;
}

</style>
</head>

<body style="font-family:Aclonica;">


<center>
<h1 style="font-family:Pattaya;  font-size:350%;">
MY BANK 
</h1>
</center>


<%
if(session.getAttribute("admin")==null)
{
	response.sendRedirect("adminlogin.jsp");
	 
}

HttpSession result=request.getSession();
%>

<h3><i>Set date Range to view Delete Records:</i></h3>
<form method="post" action="Adminverify">


<label for="fdate">Initial Date:</label>
<input type="date" required name="fdate" id="fdate" placeholder="2021/05/30">

<br><br>
<label for="ldate">Last Date</label>
<input type="date" required  name="ldate" id="ldate" placeholder="2021/06/15">
<br><br>
<input type="submit" name=submit id=submit value="check">

</form>





<table  class="styled-table">
  <thead>
    <tr>
      <th>Record ID:</th>
       <th>Customer ID</th>
       <th>Date:</th>
      <th>Customer Name:</th>
      <th>Customer Email:</th>     
       <th> Account Number:</th>    
    </tr>
  </thead>
  <tbody>
  
  
  <%
  if(result.getAttribute("result1")!=null)
  {
 
  ResultSet rs=(ResultSet)result.getAttribute("result1");
  while(rs.next())
  {
	 //out.println(rs.getInt(1));
  

	  %>
    <tr>
      
      <td> <%= rs.getInt(1) %>   </td>
      <td><%= rs.getString(5) %> </td>
      <td><%= rs.getString(4) %> </td>
       <td><%= rs.getString(2) %> </td>
        <td><%= rs.getString(3) %> </td>
         <td><%= rs.getString(6) %> </td>
    </tr>
  
  </tbody>
  <% 
  }  
  }
  %>
  
</table>

  
  
  
<div class="goback">
<a href="welcome.jsp">Go Back</a>
</div>
  


</body>
