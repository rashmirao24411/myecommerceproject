
<!DOCTYPE html>
<html>
<head>

<style>
h1{
color:white;
 font-family:verdana;
  font-size:100%;
}
a{
color:white;
}
</style>

<link rel="stylesheet" href="style3.css">

<title>Login</title>

</head>
<body>

<div class="full-screen-container">

<div id='login-container'>
<h3 class="login-title">Welcome</h3>
   <%
   String msg=request.getParameter("msg");
  if("notexist".equals(msg))
  {
	 %>
  <h1>Incorrect email or Password</h1>
 <% } %>
 <% if("invalid".equals(msg))
	 {%>

<h1>Some thing Went Wrong! Try Again !</h1>
<% }%>
   

  <form action="loginAction.jsp" method="post">
  <div class="input-group">
  <label>Email</label>
  <input type="email" name="email" ></div>
   <div class="input-group">
    <label>Password</label>
    
  
            
            <input type="password" name="password"class="pass-key"  >
            
  </div>
  <button type="submit" class="login-button">Sign In</button>
  
  </form>
     <h1 ><a href="signup.jsp" >SignUp</a></h1>
       <h1 ><a href="forgotPassword.jsp">Forgot Password?</a></h1>
       <h1 ><a href="Vastraa.jsp">Back</a></h1>
    
  </div>
  <div class='whysignLogin'>

       
  </div>
</div>



</body>
</html>