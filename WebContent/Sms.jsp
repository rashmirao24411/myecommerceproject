<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="
sha384-wvfXpqpZZVQGK6TAh5PVIGOfQNHSoD2xbE+QkPxCAF1NEevoEH3S10sibVcOQVnN " crossorigin="anonymous">
</head>

<link rel="stylesheet" href=Sms.css>

<a href="Homy.jsp"><i class="fa fa-arrow-circle-left" style="font-size:24px ; color:black;" style=></i></a>
<form action="MsgData.jsp" method="post">
<section class="contact">
<div class="content">
<h2>Contact Us</h2>
<p>VastraCollection have collection of Designer Lehenga Choli, Designer Saree -Bollywood Saree, Designer ...
       Sarees come in various examples like - basic Buti (Dots), multifaceted flower design, checks,
        zari ... Shop bollywood style dresses on VastraCollection.</p>
        </div>
        <div class="container">
        <div class="contactInfo">
        <div class="box">
        <div class="icon"><i class="fa fa-map-marker"></i></div>
        <div class="text">
        <h3>Addresses</h3>
        <p>SEC-59 Mohali Phase-5 Near PCL Chowk, Punjab <br>132987</p>
        </div>
        </div>
            <div class="box">
        <div class="icon"><i class="fa fa-phone"></i></div>
        <div class="text">
        <h3>Phone</h3>
        <p>9023432987</p>
        </div>
        </div>
            <div class="box">
        <div class="icon"><i class="fa fa-envelope-o"></i></div>
        <div class="text">
        <h3>Email</h3>
        <p>vastracollection@gmail.com</p>
        </div>
        </div>
        </div>
        <div class="contactForm">
        <form>
        <h2>Send Message</h2>
        <div class="inputBox">
        <input type="text" name="name" placeholder="Full Name" required="required" pattern="[a-z A-Z]+" required required title="Enter your name in the form of character like [a-zA-Z]" required>

        </div>
        <div class="inputBox">
        <input type="text" name="email" placeholder="Email" required="required" id="email"  pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" size="30" required>
        
        </div>
        <div class="inputBox">
        <input type="text" name="phoneno" placeholder="Phone" required="required"  pattern="[789][0-9]+"  name="mobilenumber" required title="Your Phone number should start with 7,8,9 and in the form of numeric" >
        
        </div>
        <div class="inputBox">
        <input type="text" name="place" placeholder="Place" required="required" pattern="[a-z A-Z]+" required required title="Enter your place in the form of character like [a-zA-Z]" required>
        
        </div>
        <div class="inputBox">
        <input type="text" name="message" placeholder="Your Message" required="required">
        
        </div>
        <div class="inputBox">
        <input type="submit" name="" value="Send">
         <% String user=request.getParameter("msg");
          if("valid".equals(user)){
        	  %>
        	  <h4> We Contact with you soon... </h4>
 
<% } %>
<%
if("invalid".equals(user)){
        	  %>
        	  <h4> Something Went Wrong </h4>
 
<% } %>
        </div>
        </form>
        </div>
        </div>
</section>
</form>
</body>
</html>