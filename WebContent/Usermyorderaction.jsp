
<%@page import="java.sql.*" %>
<%
String name=request.getParameter("name");
String email=request.getParameter("email");
String phone=request.getParameter("phone");
String product_id=request.getParameter("product_id");
String reason=request.getParameter("reason");

try{
	Class.forName("com.mysql.jdbc.Driver");  
	Connection con=DriverManager.getConnection(  
			"jdbc:mysql://localhost:3306/vastracollection","root","");  
	PreparedStatement ps=con.prepareStatement("insert into customercancel values(?,?,?,?,?)");
	ps.setString(1,name);
	ps.setString(2,email);
	ps.setString(3,phone);
	ps.setString(4,product_id);
	ps.setString(5,reason);

	ps.executeUpdate();
	
	response.sendRedirect("ProductCancel.jsp?msg=valid");
	
	
}
catch(Exception e)
{
	System.out.print(e);
	response.sendRedirect("ProductCancel.jsp?msg=Invalid");
	
}
%>