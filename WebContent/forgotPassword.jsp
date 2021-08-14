<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="signup-style.css">
<title>ForgotPassword</title>
</head>
<body>
<div id='container'>
  <div class='signup'>
     <form action="forgotPasswordAction.jsp " method="post">
     <input type="email" name="email" placeholder="Enter Email" required>
      <input type="number" name="mobilenumber" placeholder="Enter Mobile Number" required>
      <select name="securityQuestion">
      <option value="What was your first car?">What was your first car?</option>
       <option value="What is the name of your first pet?">What is the name of your first pet?</option>
        <option value="What is the name of the town where you were born?">What is the name of the town where you were born?</option>
         <option value="What elementary school did you attend?">What elementary school did you attend?</option>
      
      </select>
      <input type="text" name="answer" placeholder="Enter Answer" required>
      <input type="password" name="newPassword" placeholder="Enter Your new password to set" required id="psw" name="psw" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required>
      <input type="submit" value="Save">
      </form>
      <h2><a href="login.jsp">Login</a></h2>
  </div>
  <div class='whyforgotPassword'>
  <%
  String msg=request.getParameter("msg");
  if("done".equals(msg))
  {
  %>
   
<h1>Password Changed Successfully!</h1>
<%} %>

<%if("invalid".equals(msg))
{%>

<h1>Some thing Went Wrong! Try Again !</h1>

<% } 
%>

    <h2>VASTRACollection</h2>
    <p>We have collection of Designer Lehenga Choli, Designer Saree -Bollywood Saree, Designer ...
       Sarees come in various examples like - basic Buti (Dots), multifaceted flower design, checks,
        zari ... Shop bollywood style dresses on VastraCollection</p>
  </div>
</div>
</body>
</html>