<%@page import="java.util.Base64"%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>s<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     
       <%@page import="java.sql.* " %>
          
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Deleteproduct product</title>


</head>
<body>
<%
String id=request.getParameter("id");
Connection connection;
PreparedStatement ps;




try
{  
	Class.forName("com.mysql.jdbc.Driver");
	connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/vastracollection", "root", "");
	
	ps=connection.prepareStatement(" delete  from dress where id='"+id+"'");
	ps.executeUpdate();
	response.sendRedirect("EditProduct.jsp?answer=yes");
	
}
catch(Exception e)
{
	e.printStackTrace();
	response.sendRedirect("EditProduct.jsp?answer=no");
	
}
%>
</body>
</html>