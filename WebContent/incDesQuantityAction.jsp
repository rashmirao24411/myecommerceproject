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

String id=request.getParameter("id");
int id2=Integer.parseInt(id);
String incdec=request.getParameter("quantity");






int price=0;
int total=0;
int quantity=0;
int final_total=0;
try
{
	Connection con=ConnectionProvider.getCon();
	PreparedStatement ps=con.prepareStatement("select * from mycarts where product_id ='"+id2+"'");
	ResultSet rs=ps.executeQuery();
	while(rs.next())
	{
		price=rs.getInt(4);
		total=rs.getInt(5);
		quantity=rs.getInt(3);
		
	}
	if(quantity==1 && incdec.equals("dec"))
	
		response.sendRedirect("addTocart.jsp?msg=notPossible");
	else if(quantity !=1 && incdec.equals("dec"))
	{
		total=total-price;
		quantity=quantity-1;
		ps.executeUpdate("update mycarts set total='"+total+"',quantity='"+quantity+"'where product_id='"+id2+"'");
		response.sendRedirect("addTocart.jsp?msg=dec");
	}
	else
	{
		total=total+price;
		quantity=quantity+1;
		ps.executeUpdate("update mycarts set total='"+total+"',quantity='"+quantity+"'where product_id='"+id2+"'");
		response.sendRedirect("addTocart.jsp?msg=inc");
	}
}
catch(Exception e)
{
	e.printStackTrace();
}
%>
</body>
</html>