<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="signup-style.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css">
	
<title>Sign-up</title> 
</head>
<body><br>
  
  <%
  String msg=request.getParameter("msg");
  if("valid".equals(msg))
  {
  %>

<h1>Successfully Registered!</h1>
<%} %>
<%
if("Invalid".equals(msg))
{
%>

<h1>Some thing Went Wrong! Try Again !</h1>
<%} %>
<div id='container' >


 <div class='signup'>
<form action="Sign_Up_Action.jsp" method="post">
<input type="text" name="name" placeholder="Enter name" pattern="[a-z A-Z]+" required required title="Enter your name in the form of character like [a-zA-Z]" required>
<input type="email" name="email" placeholder="Enter email" id="email"  pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" size="30" required>
<input type="number" name="mobilenumber"   placeholder="Enter Mobile number" required  title="Enter your phone in numeric" required>
<select name="securityQuestion" required>
<option value="What was your first car?">What was your first car?</option>
<option value="What is the name of your first pet?">What is the name of your first pet?</option>
<option value="What is the name of the town where you were born?">What is the name of the town where you were born?</option>
<option value="What elementary school did you attend?">What elementary school did you attend?</option>
</select>
<input type="text" name="answer" placeholder="Enter answer" pattern="[a-zA-Z]+" required title="Enter your security answer in the form of character like [a-zA-Z]" required>
<input type="password" name="password" placeholder="Enter password" required id="psw" name="psw" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required>
<input type="text" name="city" placeholder="City" pattern="[a-z A-Z]+" required title="Enter your city in the form of character like [a-z A-Z]" required> 
<input type="text"  name="state" placeholder="State" pattern="[a-z A-Z]+" required title="Enter your state answer in the form of character like [a-zA-Z]" required> 
<input type="text" name="pincode" placeholder="Pincode" pattern="[0-9]{6}" maxlength="6">
<input type="text" name="address" placeholder="Address"  required> 
<input type="text" name="houseno" placeholder="House no" required> 
<input type="text" name="landmark" placeholder="landmark" required>
<input type="submit" value="Signup">
</form>


 
    
      <h2 class="white-text" style="color:white;" ><a href="login.jsp">Login</a></h2>
  </div>


    <h2 >VASTRACollection</h2>
   
    <p class="w3-animate-zoom">We have collection of Designer Lehenga Choli, Designer Saree -Bollywood Saree, Designer ...
       Sarees come in various examples like - basic Buti (Dots), multifaceted flower design, checks,
        zari ... Shop bollywood style dresses on VastraCollection</p>
 
</div>
</body>
  
</html>