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
String product_id=request.getParameter("product_id");
String quantity=request.getParameter("quantity");
String total=request.getParameter("total");
String product_name=request.getParameter("product_name");
String Orderdate=request.getParameter("Orderdate");
String deliveryDate=request.getParameter("deliveryDate");



try{
	
	Connection con=ConnectionProvider.getCon();
	PreparedStatement ps=con.prepareStatement("Update mycarts set product_id=?,quantity=?,product_name=?,Orderdate=?,deliveryDate=DATE_ADD(TIMESTAMP(), INTERVAL 7 DAY) where email='"+email+"'");
	ps.setString(1, product_id);
	ps.setString(2, quantity);
	ps.setString(3, total);
	ps.setString(4, product_name);
	ps.setString(5, Orderdate);
	ps.setString(6, deliveryDate);
	
	ps.executeUpdate();
	response.sendRedirect("Thankyou.jsp?msg=valid");
}
catch(Exception e)
{
	e.printStackTrace();
	response.sendRedirect("Checkout.jsp?msg=invalid");
}
%>
</body>
</html>