<%@page import="Connection_db.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
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

String product=request.getParameter("product_id");

int productid=Integer.parseInt(product);
System.out.println(productid);

String email=request.getParameter("email");
System.out.println(email);

String pro=request.getParameter("status");



if(pro.equals("cancel"))
	
{
%>
<br>
<br>
<% 
String status="cancel";


try
{
	
	Connection con=ConnectionProvider.getCon() ;
	PreparedStatement ps1=con.prepareStatement("update myorder set status=? where email='"+email+"' and product_id='"+productid+"'");
	
	ps1.setString(1, status);
	
	ps1.executeUpdate();
	

}
catch(Exception e)
{
	e.printStackTrace();

}%>


<%}
%>


<%
if(pro.equals("delivered"))
{
	
	
	String status="delivered";
	

try
{
	Connection con=ConnectionProvider.getCon();
	PreparedStatement ps1=con.prepareStatement("update myorder set status=? where email='"+email+"' and product_id='"+productid+"'");
	
	ps1.setString(1, status);
	
	ps1.executeUpdate();
}
catch(Exception e)
{
	e.printStackTrace();
}

%>
<%}
%>


<%
 if(pro.equals("processing"))
{
	
	
	String status="processing";
	

try
{
	Connection con=ConnectionProvider.getCon();
	PreparedStatement ps1=con.prepareStatement("update myorder set status=? where email='"+email+"' and product_id='"+productid+"'");
	
	ps1.setString(1, status);
	
	ps1.executeUpdate();
}
catch(Exception e)
{
	e.printStackTrace();
}

%>
      

     
<%
}
%>
 <a href="OrderRecieved.jsp"><button type="submit" class="btn btn-outline-info" >Click here</button></a>


</body>
</html>