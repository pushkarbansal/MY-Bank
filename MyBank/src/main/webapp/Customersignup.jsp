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
<title>Register to MY BANK</title>


<style>
.box1{
display: block;
margin-left:auto;
margin-right:auto;
margin-top:6%;
padding-top:3%;
padding-bottom:5%;
 width: 50%;
 background-color:grey;
 text-align:center;
box-shadow: 0 20px 50px rgba(8, 112, 184, 0.7);
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


<DIV class="box1">
<H2 style="font-size:200%;margin-bottom:2%"><u>REGISTRATION FORM</u></H2>



<H5 style="margin-top:0;;margin-bottom:8%">FILL IN THE DETAILS BELOW TO REGISTER FOR <B><I><U> MY BANK </U></B></I></h5>

<FORM action="Customerverify" method="post">
<label for=email>E-MAIL :</label>

<input type="email" id="email" name="email" required placeholder="Example@gmail.com" class="form" style="margin-right:-2%">
<br>
<br>
<label for="fname">First Name :  </label>
<input type="text" name="fname" required id=fname placeholder="ex:Pushkar" class="form" style="margin-right:3%">



<br>
<br>
<label for="lname">Last Name :  </label>
<input type="text" name="lname" required id=lname placeholder="ex:Bansal" class="form" style="margin-right:3%">


<br>
<br>
<label for="aline1">Address Line 1 :  </label>
<input type="text" name="aline1" required id=aline1 placeholder="ex: house no.25 aprtment runanjan" class="form" style="margin-right:10%">

<br>
<br>
<label for="aline2">Address Line 2 :  </label>
<input type="text" name="aline2"  id=aline2 placeholder="ex: near ranuja chowk"class="form" style="margin-right:10%">
 
<br>
<br>
<label for="city">City :</label>
<input type="text" name="city" required id=city placeholder="ex:Dehradun" class="form" style="margin-right:-7%">
 
<br>
<br>
<label for="pincode">Pin Code :</label>
<input type="number" name="pincode" required id=pincode placeholder="ex:500362" class="form" style="margin-right:1%">


<br>
<br>
<label for="state">State :  </label>
<input type="text" name="state" required id=state placeholder="ex:Uttarakhand" class="form" style="margin-right:-5%">


<br>
<br>
<label for="phone">phone number :</label>
<input type="text" name="phone" required id=phone placeholder="+91" class="form" style="margin-right:10%">



<br>
<br>
<label for="dob">Date Of Birth : </label>
<input type="date" required name="dob" id=dob class="form" style="margin-right:8%">
<br><br>


<label for="pass">Password : </label>
<input type="Password" required name="pass" id=pass class="form" style="margin-right:3%">
<br><br>
 
 
<label for="male">Male :  </label>
<input type="checkbox" name="gender" value=1 id=male placeholder="Male">

<label for="female">Female : </label>
<input type="checkbox" name="gender" value=2  id=female placeholder="female">


<label for="others">Others :  </label>
<input type="checkbox" name="gender" value=3  id=other placeholder="Prefer not to tell">

<br>
<br>
<input type="submit" value="RegisterCustomer" name="submit" id=submit>
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

</FORM>
</div>
<div class="goback">
<a href="customerIndex.html">Go Back</a>
</div>


</body>
</html>