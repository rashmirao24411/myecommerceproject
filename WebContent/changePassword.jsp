<%@page import="Connection_db.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="ChangeInformation.jsp" %>

<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Message Us</title>
</head>
<body>
<% String Hello=request.getParameter("msg");
if("notMatch".equals(Hello))
{
%>
<h3 class="alert" style="color:white">New password and Confirm password does not match!</h3>
<%} %>
<%
if("wrong".equals(Hello))
{
%>
<h3 class="alert" style="color:white">Your old Password is wrong!</h3>
<%} %>
<%
if("done".equals(Hello))
{
%>
<h3 class="alert" style="color:white">Password change successfully!</h3>
<%} %>

<div class="container mt-5 mb-5 d-flex justify-content-center">
    <div class="card px-1 py-4">
        <div class="card-body">
            <h2 class="card-title mb-3">Change Your Password</h2>
                <div class="d-flex flex-row"> <label class="radio mr-1"> 
                 <h6 class="information mt-4">Please provide following information to change your password</h6>
            <div class="row">
<form action="changePasswordAction.jsp"method="post">
<h6>Enter Old Password</h6>
 <input  class="form-control" type="password" name="oldPassword" placeholder="Enter Old Password" required class="input-style" id="psw" name="psw" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" >
  <hr>
 <h6>Enter New Password</h6>
 <input  class="form-control" type="password" name="newPassword" placeholder="Enter new Password" required class="input-style" id="psw" name="psw" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" >
  <hr>
<h6>Enter Confirm Password</h6>
 <input  class="form-control" type="password" name="confirmPassword" placeholder="Enter confirm Password" required class="input-style" id="psw" name="psw" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" >
  <hr>

   <div class="form-group col-sm-6"> <button type="submit" class="btn-block btn-primary">Save</button> </div>
 
</form>
</body>
<br><br><br>
</html>