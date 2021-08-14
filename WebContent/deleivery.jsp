<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

 
<%
String sum=request.getParameter("sum");
int total=Integer.parseInt(sum);
Random randomGenerator = new Random();
int Orderid = randomGenerator.nextInt(1000000);
Random randomGenerators=new Random();
int Custid=randomGenerator.nextInt(10000);
%>
      
<form method="post" action="pgRedirect.jsp">
	            
	            
		
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
						
						 <button type="submit" class="btn btn-outline-info" >Place Order</button></a>
		
	</form>
     

</body>
</html>