<%@page import="java.sql.*" %>

<% 
String email=request.getParameter("email");
String password=request.getParameter("password");
if("admin@gmail.com".equals(email)&&"admin".equals(password))
{
	session.setAttribute("email",email);
	response.sendRedirect("AdminWelcome.jsp");
}
else
{
	int z=0;
	try
	{
		
		Class.forName("com.mysql.jdbc.Driver");  
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/vastracollection","root",""); 
		Statement st=con.createStatement();
		PreparedStatement ps=con.prepareStatement("select * from userss where email=? and password=?");
	    ps.setString(1,email);
	    ps.setString(2,password);
	    ResultSet rs=ps.executeQuery();
	   
		while(rs.next())
		{
			z=1;
			session.setAttribute("email",email);

			response.sendRedirect("Homy.jsp");	
		}
			
		if(z==0)
			response.sendRedirect("login.jsp?msg=notexist");
	}
	catch(Exception e){
		System.out.println(e);
		response.sendRedirect("login.jsp?msg=invalid");
	}
}
%>


