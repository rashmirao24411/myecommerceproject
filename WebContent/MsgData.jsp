<%@page import="Connection_db.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

String name=request.getParameter("name");
String phoneno=request.getParameter("phoneno");
String email=request.getParameter("email");
String place=request.getParameter("place");
String message=request.getParameter("message");
try
{
	Connection con=ConnectionProvider.getCon();
	PreparedStatement ps=con.prepareStatement("insert into message(name,phoneno,email,place,message)values(?,?,?,?,?)");
	ps.setString(1, name);
	ps.setString(2, phoneno);
	ps.setString(3, email);
	ps.setString(4, place);
	ps.setString(5, message);
	ps.executeUpdate();
	
	response.sendRedirect("Sms.jsp?msg=valid");
}
catch(Exception e)
{ 
	e.printStackTrace();
	response.sendRedirect("Sms.jsp?msg=invalid");
}

%>
</body>
</html>