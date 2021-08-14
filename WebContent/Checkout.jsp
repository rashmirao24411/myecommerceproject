<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="Connection_db.ConnectionProvider" %>
<%@page import="java.util.Base64"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.*"%>


<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- CSS only -->

<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/popper.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<style>

body {
  font-family: Arial;
  font-size: 17px;
  padding: 8px;
}

* {
  box-sizing: border-box;
}

.row {
  display: -ms-flexbox; /* IE10 */
  display: flex;
  -ms-flex-wrap: wrap; /* IE10 */
  flex-wrap: wrap;
  margin: 0 -16px;
}

.col-25 {
  -ms-flex: 25%; /* IE10 */
  flex: 25%;
}

.col-50 {
  -ms-flex: 50%; /* IE10 */
  flex: 50%;
}

.col-75 {
  -ms-flex: 75%; /* IE10 */
  flex: 75%;
}

.col-25,
.col-50,
.col-75 {
  padding: 0 16px;
}

.container {
  background-color: #f2f2f2;
  padding: 5px 20px 15px 20px;
  border: 1px solid lightgrey;
  border-radius: 3px;
}

input[type=text] {
  width: 100%;
  margin-bottom: 20px;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 3px;
}

label {
  margin-bottom: 10px;
  display: block;
}

.icon-container {
  margin-bottom: 20px;
  padding: 7px 0;
  font-size: 24px;
}

.btn {
  background-color: #04AA6D;
  color: white;
  padding: 12px;
  margin: 10px 0;
  border: none;
  width: 100%;
  border-radius: 3px;
  cursor: pointer;
  font-size: 17px;
}

.btn:hover {
  background-color: #45a049;
}

a {
  color: #2196F3;
}

hr {
  border: 1px solid lightgrey;
}

span.price {
  float: right;
  color: grey;
}

/* Responsive layout - when the screen is less than 800px wide, make the two columns stack on top of each other instead of next to each other (also change the direction - make the "cart" column go on top) */
@media (max-width: 800px) {
  .row {
    flex-direction: column-reverse;
  }
  .col-25 {
    margin-bottom: 20px;
  }
}
</style>
</head>
<body>




<h2>CheckOut</h2>
<p>Dear Customer Please Check your address and make sure to click on the save button and then proceed to payment option.</p>
<div class="row">
 <div class="col-25">
    <div class="container">
      <h4>Cart <span class="price" style="color:black"><i class="fa fa-shopping-cart"></i> <b></b></span></h4>
      <p><a href="#"></a> <span class="price"></span></p>
      
      <hr>
 
<%
Random randomGenerator = new Random();
int Orderid = randomGenerator.nextInt(1000000);
Random randomGenerators=new Random();
int Custid=randomGenerator.nextInt(10000);


int total=0;
String email=(String)session.getAttribute("email").toString();
Connection connection;
PreparedStatement ps;
ResultSet st;



try
{  
	Class.forName("com.mysql.jdbc.Driver");
	connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/vastracollection", "root", "");
	
	ps=connection.prepareStatement("select sum(total) as total from mycarts where email='"+email+"'");
	st=ps.executeQuery();
	
	while(st.next())
	{
		total=st.getInt(1);
	}
   
}
catch(Exception exception)
{
	exception.printStackTrace();
}

%>
      
      <p>Total <span class="price" style="color:black"><b>Total:&#8377 <%out.print(total);%></b></span></p>
    </div>
  </div>
</div>

  <div class="col-75">
    <div class="container">
      <form action="CheckoutAction.jsp?total=<%=total%>">
<%
String msg=(String)session.getAttribute("email").toString();



try
{
	Class.forName("com.mysql.jdbc.Driver");
	connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/vastracollection", "root", "");
	
	ps=connection.prepareStatement("select * from userss where email='"+email+"'");
	st=ps.executeQuery();
	
	
	while(st.next())
	{

%>
        <div class="row">
          <div class="col-50">
            <h3>Billing Address</h3>
            <label for="name"><i class="fa fa-user"></i> Name</label>
            <input type="text" id="name" name="name" pattern="[a-z A-Z]+" required required title="Enter your name in the form of character like [a-zA-Z]" required value="<%=st.getString(1) %>">
          
            <input type="hidden" id="email" name="email" placeholder="john@example.com" value="<%=st.getString(2) %>" >
              <label for="mobileNumber"><i class="fa fa-phone"></i> Phone</label>
            <input type="text" id="mobileNumber" name="mobileNumber" placeholder="+91"  pattern="[789][0-9]+" maxlength="10"  name="mobilenumber" required title="Your Phone number should start with 7,8,9 and in the form of numeric" value="<%=st.getString(3) %>">
            <label for="adr"><i class="fa fa-address-card-o"></i> Address</label>
            <input type="text" id="adr" name="address" placeholder="542 W. 15th Street" value="<%=st.getString(10) %>">
            <label for="adr"><i class="fa fa-address-card-o"></i> Houseno</label>
            <input type="text" id="adr" name="houseno" placeholder="542 W. 15th Street" value="<%=st.getString(11) %>">
            <label for="city"><i class="fa fa-institution"></i> City</label>
            <input type="text" id="city" name="city" City value="<%=st.getString(7) %>" placeholder="New York"  pattern="[a-z A-Z]+" required title="Enter your state answer in the form of character like [a-zA-Z]" required>
             <label for="city"><i class="fa fa-institution"></i>Landmark </label>
            <input type="text" id="city" name="landmark" City value="<%=st.getString(12) %>" placeholder="New York">

            <div class="row">
              <div class="col-50">
                <label for="state">State</label>
                <input type="text" id="state" name="state" value="<%=st.getString(8) %>" placeholder="NY"  pattern="[a-z A-Z]+" required title="Enter your state answer in the form of character like [a-zA-Z]" required>
              </div>
              <div class="col-50">
                <label for="zip">Pincode</label>
                <input type="text" id="zip" name="pincode" value="<%=st.getString(9) %>" placeholder="10001" pattern="[0-9]{6}" maxlength="6" required>
              </div>
              <input type="submit" value="Save" class="btn">
            </div>
          </div>

          <div class="col-50">
          
      
            <h3>Payment</h3>
            <label for="fname">Accepted Cards</label>
            <div class="icon-container">
              <i class="fa fa-cc-visa" style="color:navy;"></i>
              <i class="fa fa-cc-amex" style="color:blue;"></i>
              <i class="fa fa-cc-mastercard" style="color:red;"></i>
              <i class="fa fa-cc-discover" style="color:orange;"></i>
            </div>

      
     
  


      </form>
      
    <form  action="Paymentmode.jsp?total=<%=total%>" method="post">  
       <label for="cname">Select the Payment Method</label>
      <select class="form-select" aria-label="Default select example" name="paymentmethod">
  <option selected>Select the method</option>
  <option value="Cod">Cash on Delivery</option>
  <option value="Online">Online Payment</option>
  
</select>
     
     
 
    
     
     
     
     
     
     
     
     
       
        <input type="submit" value="Continue to checkout" class="btn">
      
     
  


      </form>
      

 
    
  
  
        
        
                <%
	}
}
catch(Exception e)
{
	e.printStackTrace();
}
%>

      
    </div>
  </div> 


  
  
  
<!-- Option 1: Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
        crossorigin="anonymous"></script>
 
</body>
</html>
    