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
String email=session.getAttribute("email").toString();
String sum=request.getParameter("total");
int total=Integer.parseInt(sum);
String paymentmethod=request.getParameter("paymentmethod");

Random randomGenerator = new Random();
int Orderid = randomGenerator.nextInt(1000000);
Random randomGenerators=new Random();
int Custid=randomGenerator.nextInt(10000);

if(paymentmethod.equals("Cod"))
	
{
%>
<br>
<br>
<% 
String status="cashondelievery";


try{
	
	Connection con=ConnectionProvider.getCon();
	PreparedStatement ps=con.prepareStatement("update mycarts set paymentmethod=? where email='"+email+"'");
	ps.setString(1, paymentmethod);
	
	
	ps.executeUpdate();
	response.sendRedirect("Thankyou.jsp?msg=valid");
}
catch(Exception e)
{
	e.printStackTrace();
	response.sendRedirect("Checkout.jsp?msg=invalid");
}%>


<%}
%>


<%
if(paymentmethod.equals("Online"))
{
	
	
	String status="onlinepayment";
	

try
{
	Connection con=ConnectionProvider.getCon();
	PreparedStatement ps1=con.prepareStatement("update mycarts set PaymentMethod=? where email='"+email+"'");
	
	ps1.setString(1, status);
	
	ps1.executeUpdate();
}
catch(Exception e)
{
	e.printStackTrace();
}

%>
      
<form  action="pgRedirect.jsp" method="post">
	            
	            
		
					<input id="ORDER_ID" tabindex="1" maxlength="20" size="20"
						type="hidden" name="ORDER_ID" autocomplete="off"
						value="ORDS_<%= Orderid %>">
					
					<input id="CUST_ID" type="hidden" tabindex="2" maxlength="30" size="12" 
					name="CUST_ID" autocomplete="off" value="CUST_<%= Custid %>">
				
								
				
					<input title="TXN_AMOUNT" tabindex="10"
						type="hidden" name="TXN_AMOUNT" 
						value="<%=total%>">
						
					
					
					<input id="INDUSTRY_TYPE_ID" tabindex="4" type="hidden" maxlength="12" size="12" 
					name="INDUSTRY_TYPE_ID" autocomplete="off" value="Retail">
				
					
					
					<input id="CHANNEL_ID" type="hidden" tabindex="4" maxlength="12"
						size="12" name="CHANNEL_ID" autocomplete="off" value="WEB">
						
						 <button type="submit" class="btn btn-outline-info" >Pay Now</button></a>
		
	</form>
     
<%
}
%>



</body>
</html>