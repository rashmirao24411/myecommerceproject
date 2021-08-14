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
<%
String text=request.getParameter("msg");
if("done".equals(text))
{
%>
<h6 class="alert" style="color:white">Your Mobile Number successfully changed!</h6>
<%} %>
<% 
if("wrong".equals(text))
{
	%>
<h6 class="alert" style="color:white">Your Password is wrong!</h6>

<%}%>

<div class="container mt-5 mb-5 d-flex justify-content-center">
    <div class="card px-1 py-4">
        <div class="card-body">
           
            <h3 class="information mt-4">You can change Your MobileNo here</h3>
            <div class="row">
                <div class="col-sm-12">
                    <div class="form-group">
                        
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <div class="form-group">
<form action="changePhoneNumberAction.jsp" method="post">
  <h6 class="information mt-4">Enter Your New Mobile Number</h6>
                

  <input class="form-control" class="input-style"  pattern="[789][0-9]+"  name="mobilenumber" required title="Your Phone number should start with 7,8,9 and in the form of numeric" placeholder="Enter New Mobile Number" required>
 
  <h6 class="information mt-4">Enter Password (For Security)</h6>

<input class="form-control" class="input-style" type="password" name="password" placeholder="Enter Password (For Security)" required> 

<hr>
<div class="form-group col-sm-6"> <button type="submit" class="btn-block btn-primary">Save</button> 
</form>
</body>
<br><br><br>
</html>