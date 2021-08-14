<%@page import="Connection_db.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
System.out.print("welcome");

String email=(String)session.getAttribute("email").toString();

int id=Integer.parseInt(request.getParameter("product"));
int quantity=1;
int product_price=0;
int product_total=0;
int cart_total=0;
int z=0;

int i=0;

try
{
	Connection con=ConnectionProvider.getCon();
	PreparedStatement ps=con.prepareStatement("select * from dress where id='"+id+"'");
	
	ResultSet rs=ps.executeQuery();
	while(rs.next())
	{
	 product_price=Integer.parseInt(rs.getString(4));
	 product_total=product_price;
	 
     }
	PreparedStatement ps1=con.prepareStatement("select * from mycart where product_id='"+id+"' and email='"+email+"'and address is NULL");
	ResultSet rs1=ps1.executeQuery();	
	while(rs1.next())
	{
		cart_total=rs1.getInt(5);
		cart_total=cart_total+product_total;
		quantity=rs1.getInt(3);
		quantity=quantity+1;
		z=1;
	}
	if(z==1)
	{
		PreparedStatement ps2=con.prepareStatement("update mycart set total='"+cart_total+"',quantity='"+quantity+"' where product_id='"+id+"' and email='"+email+"'and address is NULL");
		ps2.executeUpdate();
		response.sendRedirect("Homy.jsp?msg=exist");
	}
	if(z==0)
	{
	
		PreparedStatement pss=con.prepareStatement("insert into mycart(email,product_id,quantity,price,total)values(?,?,?,?,?)");
		pss.setString(1, email);
		pss.setInt(2, id);
		pss.setInt(3, quantity);
		pss.setInt(4, product_price);
		pss.setInt(5,product_total);
		i=pss.executeUpdate();
//		response.sendRedirect("Homy.jsp?msg=added");
	}
	
	System.out.print("updated "+i);
	out.print(i);

}
catch(Exception e)
{
	e.printStackTrace();
}


%>