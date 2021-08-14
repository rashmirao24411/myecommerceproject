<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
 <%
 String email=request.getParameter("email");
 String mobilenumber=request.getParameter("mobilenumber");
 String securityQuestion=request.getParameter("securityQuestion");
 String answer=request.getParameter("answer");
 String newPassword=request.getParameter("newPassword");
 int check=0;
 try
 {
	 Class.forName("com.mysql.jdbc.Driver");  
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/vastracollection","root",""); 
		
		Statement st=con.createStatement();
		PreparedStatement ps=con.prepareStatement("select * from userss where email=? and mobilenumber=? and securityQuestion=? and answer=? ");
	    ps.setString(1,email);
	    ps.setString(2,mobilenumber);
	    ps.setString(3,securityQuestion);
	    ps.setString(4,answer);
	   
	    ResultSet rs=ps.executeQuery();
	    
	    while(rs.next()){
	    	check=1;
	    	PreparedStatement sp=con.prepareStatement("select * from userss where email=? and mobilenumber=? and securityQuestion=? and answer=? ");
	    	sp.executeUpdate("update userss set password='" +newPassword+"' where email='"+email+"'");
	    	response.sendRedirect("forgotPassword.jsp?msg=done");
	    	
	    }
	    
	   if(check==0){
		   response.sendRedirect("forgotPassword.jsp?msg=invalid");
	   }
	   con.close();  
      
 }
 catch(Exception e){
	 System.out.println(e);
 }
 
 
 
 %>