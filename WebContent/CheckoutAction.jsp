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
String name=request.getParameter("name");
String mobileNumber=request.getParameter("mobileNumber");
String city=request.getParameter("city");
String state=request.getParameter("state");
String pincode=request.getParameter("pincode");
String address=request.getParameter("address");
String houseno=request.getParameter("houseno");
String landmark=request.getParameter("landmark");

String sum=request.getParameter("total");



try{
	
	Connection con=ConnectionProvider.getCon();
	PreparedStatement ps=con.prepareStatement("update userss set  name=?,mobileNumber=?,city=?,state=?,pincode=?,address=?,houseno=?,landmark=? where email='"+email+"'");
	ps.setString(1, name);
	ps.setString(2, mobileNumber);
	ps.setString(3, city);
	ps.setString(4, state);
	ps.setString(5, pincode);
	ps.setString(6, address);
	ps.setString(7, houseno);
	ps.setString(8, landmark);
	
	ps.executeUpdate();
	
}
catch(Exception e)
{
	e.printStackTrace();
	response.sendRedirect("Checkout.jsp?msg=invalid");
}
%>

<%

try{
	
	Connection con=ConnectionProvider.getCon();
	PreparedStatement ps=con.prepareStatement("update mycarts set  name=?,mobileNumber=?,city=?,state=?,pincode=?,address=?,houseno=?,landmark=? where email='"+email+"'");
	ps.setString(1, name);
	ps.setString(2, mobileNumber);
	ps.setString(3, city);
	ps.setString(4, state);
	ps.setString(5, pincode);
	ps.setString(6, address);
	ps.setString(7, houseno);
	ps.setString(8, landmark);
	
	ps.executeUpdate();
	response.sendRedirect("Checkout.jsp?total="+sum+"");
}
catch(Exception e)
{
	e.printStackTrace();
	response.sendRedirect("Checkout.jsp?msg=invalid");
}
%>
</body>
</html>