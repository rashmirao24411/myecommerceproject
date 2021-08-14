<%@page import="Connection_db.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ page import = "java.io.*"%>
   <%@ page import="java.util.*"%>
   <%@ page import = "javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/popper.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>OrderPlaced</title>
</head>
<body>

<%


String email=(String)session.getAttribute("email").toString();
String name=null;
Blob blob=null;
String date=null;
String payment=null;
String CFName=null;
String CLName=null;
String Phone=null;
String city=null;
String state=null;
String pincode=null;
String address=null;
String houseno=null;
String landmark=null;

String status="processing";

int total=0;
int id=0;
int price=0;
int quantity=0;


PreparedStatement ps;
ResultSet st;


try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/vastracollection", "root", "");
	
	ps=connection.prepareStatement("select * from mycarts where email='"+email+"'");
	st=ps.executeQuery();
	
	
	while(st.next())
	{    
		id=Integer.parseInt((st.getString(2)));
		name=(st.getString(7));
		blob=(st.getBlob(6));
		quantity=Integer.parseInt((st.getString(3)));
		price=Integer.parseInt((st.getString(4)));
		total=Integer.parseInt((st.getString(5)));
		payment=(st.getString(11));
		date=(st.getString(8));
		
		CFName=(st.getString(11));
		
		Phone=(st.getString(12));
		city=(st.getString(13));
		state=(st.getString(14));
		pincode=(st.getString(15));
		address=(st.getString(16));
		houseno=(st.getString(17));
		landmark=(st.getString(18));
		
		
		
				
		
		
		
%>


<div class="card">
  <div class="card-header">
    Dear Customer
  </div>
  <div class="card-body">
    <h5 class="card-title">We received your Order.</h5>
    <p class="card-text">Your Order will deliver with in 7 days</p>
    <p class="card-text"> Order Details:
      product id : <%=st.getString(2) %>   Product name : <%=st.getString(7) %>  Product Quantity :  <%=st.getString(3) %>  Your Payable  Amount : &#8377; <%=st.getString(5) %> </p>

   <p name="Orderdate">Order Date:<%=st.getString(8) %>  </p>
    
   

  </div>
</div>



                <%
	}
}
catch(Exception e)
{
	e.printStackTrace();
}
%>
<div class="jumbotron text-center">
  <h1 class="display-3">Thank You!</h1>
  <p class="lead"><strong>Please check your Profile</strong> for further details about your order.</p>
  <hr>
  <p>
    Having trouble? <a href="Sms.jsp">Contact Us</a>
  </p>
  <p class="lead">
    <a class="btn btn-primary btn-sm" href="Homy.jsp" role="button">Continue to homepage</a>
  </p>
</div>

<%
try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/vastracollection", "root", "");

	PreparedStatement pss=con.prepareStatement("insert into myorder(email,product_id,quantity,price,total,photo,product_name,Orderdate,status,paymentmethod,name,mobileNumber,city,state,pincode,address,houseno,landmark) select email,product_id,quantity,price,total,photo,product_name,Orderdate, status,paymentmethod,name,mobileNumber,city,state,pincode,address,houseno,landmark from mycarts where email='"+email+"'");
	pss.executeUpdate();
	
}
catch(Exception e)
{
	e.printStackTrace();
}
%>


<%
try
{
	

Class.forName("com.mysql.jdbc.Driver");
Connection cons=DriverManager.getConnection("jdbc:mysql://localhost:3306/vastracollection", "root", "");
PreparedStatement pss=cons.prepareStatement("update myorder set status=?  where email='"+email+"'");
pss.setString(1,status);
pss.executeUpdate();


}
catch(Exception e )
{
	
}
%>


<%
try
{
	

Class.forName("com.mysql.jdbc.Driver");
Connection cons=DriverManager.getConnection("jdbc:mysql://localhost:3306/vastracollection", "root", "");
PreparedStatement pst=cons.prepareStatement("delete from mycarts where email='"+email+"'");
pst.executeUpdate();
}
catch(Exception e)
{
	e.printStackTrace();
}

%>




</body>
</html>