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
String mobileNumber=request.getParameter("mobilenumber");
String password=request.getParameter("password");
int check=0;
try
{
Connection con=ConnectionProvider.getCon();
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from userss where email='"+email+"'and password='"+password+"'");
while(rs.next())
{
	check=1;
	st.executeUpdate("update userss set mobilenumber='"+mobileNumber+"'where email='"+email+"'");
	response.sendRedirect("changePhoneNumber.jsp?msg=done");
}
if(check==0)
{
response.sendRedirect("changePhoneNumber.jsp?msg=wrong");
}
}
catch(Exception e)
{
	e.printStackTrace();
}



%>
</body>
</html>