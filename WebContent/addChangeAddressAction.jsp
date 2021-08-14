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
String email=session.getAttribute("email").toString();
String city=request.getParameter("city");
String state=request.getParameter("state");
String pincode=request.getParameter("pincode");
String address=request.getParameter("address");
String houseno=request.getParameter("houseno");
String landmark=request.getParameter("landmark");


try{
	
	Connection con=ConnectionProvider.getCon();
	PreparedStatement ps=con.prepareStatement("update userss set city=?,state=?,pincode=?,address=?,houseno=?,landmark=? where email='"+email+"'");
	ps.setString(1, city);
	ps.setString(2, state);
	ps.setString(3, pincode);
	ps.setString(4, address);
	ps.setString(5, houseno);
	ps.setString(6, landmark);
	ps.executeUpdate();
	response.sendRedirect("AddOrChangePassword.jsp?msg=valid");
}
catch(Exception e)
{
	e.printStackTrace();
	response.sendRedirect("AddOrChangePassword.jsp?msg=invalid");
}
%>
</body>
</html>