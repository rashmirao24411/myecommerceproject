<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
.container{
background-color: #000000;
}

.well-block {
    background-color: #ECECEC;
    border: 1px solid #e9e6e8;
    padding: 40px;
}

.well-title {
    margin-bottom: 40px;
}
</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
</head>



<body>
<a href="Homy.jsp"><i class="fa fa-arrow-left"></i></a>
<center><h3> To Book an appointment with us </h3></center>
 <div class="container">
            <div class="row">

                <div class="col-md-6">
                    <div class="well-block">
                        <div class="well-title">
                            <h2>Questions? Book an Appointment</h2>
                        </div>
                        <form action="AppointmentFormAction.jsp" method="post">
                            <!-- Form start -->
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label" for="name">Name</label>
                                        <input id="name" name="name" type="text" placeholder="Name" class="form-control input-md" pattern="[a-z A-Z]+"  required title="Enter your name in the form of character like [a-z A-Z]" required>
                                        
                                    </div>
                                </div>
                                <!-- Text input-->
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label" for="email">Email</label>
                                        <input id="email" name="email" type="text" placeholder="E-Mail" class="form-control input-md" id="email"  pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" size="30" required title="Please add the correct format of mail id" required>
                                    </div>
                                </div>
                                <!-- Text input-->
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label" for="date">Preferred Date</label>
                                        <input id="date" name="date" type="text" placeholder="D/M/Y" class="form-control input-md" required>
                                    </div>
                                </div>
                                <!-- Select Basic -->
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label" for="time">Preferred Time </label>
                                        <select id="time" name="time" class="form-control" required>
                                        <option value="Choose your time" >Choose your time</option>
                                            <option value="10:00 AM to 12:00 PM">10:00 AM to 12:00 PM</option>
                                            <option value="2:00 PM to 4:00 PM ">2:00 PM to 4:00 PM</option>
                                            <option value="6:00 PM to 8:00 PM">6:00 PM to 8:00 PM</option>
                                        </select>
                                    </div>
                                </div>
                                <!-- Select Basic -->
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label class="control-label" for="appointmentfor">Appointment For</label>
                                        <select id="appointmentfor" name="service" class="form-control" >
                                         <option value="service" >Choose service</option>
                                            <option value="For Alteration">For Alteration</option>
                                            <option value="For Wedding Lehnga">For Wedding Lehnga</option>
                                            <option value="For Fabric">For Fabric</option>
                                            <option value="For Design of Dress">For Design of Dress</option>
                                        </select>
                                    </div>
                                </div>
                                <!-- Button -->
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <button id="singlebutton" name="singlebutton" class="btn btn-default">Make An Appointment</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                        
                         <% String email=request.getParameter("msg");
          if("valid".equals(email)){
        	  %>
        	  <h4> We received your message </h4>
 
<% } %>
<%
if("invalid".equals(email)){
        	  %>
        	  <h4> Something Went Wrong </h4>
 
<% } %>
                        
                        <!-- form end -->
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="well-block">
                        <div class="well-title">
                            <h2>Why Appointment with Us</h2>
                        </div>
                        <div class="feature-block">
                            <div class="feature feature-blurb-text">
                                <h4 class="feature-title">24/7 Hours Available</h4>
                                <div class="feature-content">
                                    <p>Dear Customer We are available for your Services .</p>
                                </div>
                            </div>
                            <div class="feature feature-blurb-text">
                                <h4 class="feature-title">Experienced Staff Available</h4>
                                <div class="feature-content">
                                    <p>Our staff will help you to bring out the best Stuff for you. </p>
                                </div>
                            </div>
                            <div class="feature feature-blurb-text">
                                <h4 class="feature-title">Low Price & Fees</h4>
                                <div class="feature-content">
                                    <p>We provide you best prices of the product. At reasonable price.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        

</body>
</html>