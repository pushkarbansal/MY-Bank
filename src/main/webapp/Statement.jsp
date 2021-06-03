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
<link href="http://fonts.googleapis.com/css?family=Aclonica" rel="stylesheet" type="text/css" />
<link href="http://fonts.googleapis.com/css?family=Pattaya" rel="stylesheet" type="text/css" />
<meta name="HandheldFriendly" content="true">
<title>Your Statement</title>
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


<h3><i>Set date Range to view statement :</i></h3>
<form method="post" action="CustomerFunctions">


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
      <th>Transaction ID:</th>
      <th>Date:</th>
     
      <th>Recipient Account Number</th>
       <th> Recipient ID</th>
          <th> Transaction Type:</th>
       <th> Initial Balance</th>
         <th> Amount</th>
        <th> Updated Balance<th>
    </tr>
  </thead>
  <tbody>
  
  <%
  
  if(session.getAttribute("result")!=null)
  {
  	ResultSet rs=(ResultSet)session.getAttribute("result");
  	//out.println("successfully fectched all data");

  	

  //ResultSet rs=(ResultSet)session.getAttribute("result");
  while(rs.next())
  {
	  %>
    <tr>
      
      <td> <%= rs.getString(1) %>   </td>
      <td><%= rs.getString(2) %> </td>
          <td><%= rs.getString(6) %> </td>
       <td><%= rs.getString(7) %> </td>
       
    <%    if(rs.getString(3).equals("recieved"))
    	{
    	%>
    	
    	<td Style="color:#24ec00"><%= rs.getString(3) %> </td>
    	<%
    	}
    else
    {
    	%>
    	<td Style="color:red"><%= rs.getString(3) %> </td>
    	<%
    }
    	%>
       
         <td><%= rs.getString(8) %> </td>
         
         
         <%    if(rs.getString(3).equals("recieved"))
    	{
    	%>
    	
    	<td Style="color:#24ec00"><% out.println(Integer.parseInt(rs.getString(9))-Integer.parseInt(rs.getString(8)));%> </td>
    	<%
    	}
    else
    {
    	%>
    	<td Style="color:red"><% out.println(Integer.parseInt(rs.getString(9))-Integer.parseInt(rs.getString(8)));%> </td>
    	<%
    }
    	%>
         
           <td><%= rs.getString(9) %> </td>
    </tr>
  
  </tbody>
  <% 
  }
  }
  %>
  
</table>


</form>

<div class="goback">
<a href="welcomecustomer.jsp">Go Back</a>
</div>



</body>
</html>