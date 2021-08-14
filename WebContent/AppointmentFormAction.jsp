
<%@page import="java.sql.*" %>
<%
String name=request.getParameter("name");
String email=request.getParameter("email");
String date=request.getParameter("date");
String time=request.getParameter("time");
String service=request.getParameter("service");

try{
	Class.forName("com.mysql.jdbc.Driver");  
	Connection con=DriverManager.getConnection(  
			"jdbc:mysql://localhost:3306/vastracollection","root","");  
	PreparedStatement ps=con.prepareStatement("insert into appointment values(?,?,?,?,?)");
	ps.setString(1,name);
	ps.setString(2,email);
	ps.setString(3,date);
	ps.setString(4,time);
	ps.setString(5,service);
	
	ps.executeUpdate();
	
	response.sendRedirect("AppointmentForm.jsp?msg=valid");
	
	
}
catch(Exception e)
{
	System.out.print(e);
	response.sendRedirect("AppointmentForm.jsp?msg=Invalid");
	
}
%>