<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.mybank.mvc.Customer" %>
    <%@ page import="com.mybank.mvc.custutil" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
<link href="http://fonts.googleapis.com/css?family=Aclonica" rel="stylesheet" type="text/css" />
<link href="http://fonts.googleapis.com/css?family=Pattaya" rel="stylesheet" type="text/css" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="HandheldFriendly" content="true">
<title>Edit Profile</title>


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


<% 

custutil cu=new custutil();


Customer c1=cu.getdata((String)session.getAttribute("email"));
Customer c=(Customer)session.getAttribute("data");

//out.print(c.getEmail());
//out.print(c1.getName());
%>


<center>
<h1 style="font-family:Pattaya;  font-size:350%;">
MY BANK 
</h1>
</center>



<form method="post" action="CustomerFunctions">

<label for=email>E-mail:</label>
<input type="email" id="email" name="email" value="<% out.print(c.getEmail()); %>"  required placeholder="Example@gmail.com">
<br>
<br>


<label for="name">Name:  </label>
<input type="text" name="name" required value="<% out.print(c.getName()); %>"  id=name placeholder="ex:Pushkar">



<br>
<br>
<label for="address">Address:  </label>
<input type="text" name="address" value="<% out.print(c.getAddress()); %>"  required id="address" placeholder="ex: house no.25 aprtment runanjan">

 
<br>
<br>
<label for="city">City  :</label>
<input type="text" name="city" value="<% out.print(c.getCity()); %>"  required id=city placeholder="ex:Dehradun">
 
<br>
<br>
<label for="pincode">Pin Code:</label>
<input type="number" name="pincode" value="<%out.print(c.getPincode());  %>"  required id=pincode placeholder="ex:500362">


<br>
<br>
<label for="state">State:  </label>
<input type="text" name="state" value="<%out.print(c.getState());  %>"  required id=state placeholder="ex:Uttarakhand">


<br>
<br>
<label for="phone">phone number:</label>
<input type="text" name="phone" value="<%out.print(c.getPhone());  %>"  required id=phone placeholder="+91">


<br>
<br>
<label for="dob">Date Of Birth  </label>
<input type="date" required value="<% out.print(c.getDob()); %>"  name="dob" id=dob>
<br><br>


<label for="pass">Password : </label>
<input type="Password"  name="pass" id=pass>
<br><br>

<label for="male">Male:  </label>
<input type="checkbox" name="gender" value=1 id=male placeholder="Male">


<label for="female">Female: </label>
<input type="checkbox" name="gender" value=2  id=female placeholder="female">


<label for="others">Others:  </label>
<input type="checkbox" name="gender" value=3  id=other placeholder="Prefer not to tell">


<br>
<br>
<input type="submit" value="Update" name="submit" id=submit placeholder="Update">
<br><br>
<div style="color:green">
<%

if(session.getAttribute("update")!=null)
{
	out.print(session.getAttribute("update"));
	session.setAttribute("update",null);
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
<a href="welcomecustomer.jsp">Go Back</a>
</div>



</body>
</html>