
<%@page import="paytm_java.PaytmConstants"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*,com.paytm.pg.merchant.CheckSumServiceHelper"%>
<%
Enumeration<String> paramNames = request.getParameterNames();

Map<String, String[]> mapData = request.getParameterMap();
TreeMap<String,String> parameters = new TreeMap<String,String>();
String paytmChecksum =  "";
while(paramNames.hasMoreElements()) {
	String paramName = (String)paramNames.nextElement();
	if(paramName.equals("CHECKSUMHASH")){
		paytmChecksum = mapData.get(paramName)[0];
	}else{
		parameters.put(paramName,mapData.get(paramName)[0]);
	}
}
boolean isValideChecksum = false;
String outputHTML="";
try{
	isValideChecksum = CheckSumServiceHelper.getCheckSumServiceHelper().verifycheckSum(PaytmConstants.MERCHANT_KEY,parameters,paytmChecksum);
	if(isValideChecksum && parameters.containsKey("RESPCODE"))
	{
		if(parameters.get("RESPCODE").equals("01"))
		{
			outputHTML = parameters.toString();
			%>
			<h2>PAYMENT DONE SUCESSFULLY!</h2>
			System.out.println("PAID SUCESSFULLY!");
			<jsp:forward page="Thankyou.jsp"/>
			
			
			<%
		}else
		{%>
			<script type="text/javascript">
			function Redirect()
			{
			    window.location="./Homy.jsp";
			}
			document.write("Payment Failed.! You will be redirected to main page in a few sec.");
			setTimeout('Redirect()', 5000);
			</script>
			<%
			
		}
	}
	else
	{%>
	
	<script type="text/javascript">
			function Redirect()
			{
			    window.location="./Homy.jsp";
			}
			document.write("Some Error Occured.! You will be redirected to main page in a few sec.");
			setTimeout('Redirect()', 5000);
			</script>
	<%
		
	}
}catch(Exception e){
	outputHTML=e.toString();
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%= outputHTML %>
</body>
</html>