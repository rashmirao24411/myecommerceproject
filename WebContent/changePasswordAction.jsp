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
String oldPassword=request.getParameter("oldPassword");
String newPassword=request.getParameter("newPassword");
String confirmPassword=request.getParameter("confirmPassword");
if(!confirmPassword.equals(newPassword))
response.sendRedirect("changePassword.jsp?msg=notMatch");
else
{
	int check=0;
	try
	{
		Connection con=ConnectionProvider.getCon();
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select * from userss where email='"+email+"'and password='"+oldPassword+"'");
		while(rs.next())
		{
			check=1;
			st.executeUpdate("update userss set password='"+newPassword+"'where email='"+email+"'");
			response.sendRedirect("changePassword.jsp?msg=done");
		}
		if(check==0)
		{
			response.sendRedirect("changePassword.jsp?msg=wrong");
		}
		
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
}

%>
</body>
</html>