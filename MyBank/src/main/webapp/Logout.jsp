<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>logout</title>
</head>
<body style="font-family:Aclonica;">

<%session.invalidate();
response.sendRedirect("Index.html");


%>


</body>
</html>