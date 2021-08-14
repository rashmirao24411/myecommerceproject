
<%@page import="java.sql.*" %>
<%
String name=request.getParameter("name");
String email=request.getParameter("email");
String mobilenumber=request.getParameter("mobilenumber");
String securityQuestion=request.getParameter("securityQuestion");
String answer=request.getParameter("answer");
String password=request.getParameter("password");
String city=request.getParameter("city");
String state=request.getParameter("state");
String pincode=request.getParameter("pincode");
String address=request.getParameter("address");
String houseno=request.getParameter("houseno");
String landmark=request.getParameter("landmark");
try{
	Class.forName("com.mysql.jdbc.Driver");  
	Connection con=DriverManager.getConnection(  
			"jdbc:mysql://localhost:3306/vastracollection","root","");  
	PreparedStatement ps=con.prepareStatement("insert into userss values(?,?,?,?,?,?,?,?,?,?,?,?)");
	ps.setString(1,name);
	ps.setString(2,email);
	ps.setString(3,mobilenumber);
	ps.setString(4,securityQuestion);
	ps.setString(5,answer);
	ps.setString(6,password);
	ps.setString(7,city);
	ps.setString(8,state);
	ps.setString(9,pincode);
	ps.setString(10,address);
	ps.setString(11,houseno);
	ps.setString(12,landmark);
	ps.executeUpdate();
	
	response.sendRedirect("signup.jsp?msg=valid");
	
	
}
catch(Exception e)
{
	System.out.print(e);
	response.sendRedirect("signup.jsp?msg=Invalid");
	
}
%>