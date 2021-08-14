<%@page import="Connection_db.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="ChangeInformation.jsp" %>

<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Add Address</title>
</head>
<style>
body {
    color: #000;"WebContent/Vastraaa/AddOrChangePassword.jsp"
    overflow-x: hidden;
    height: 100%;
    background-image: url("https://i.imgur.com/GMmCQHC.png");
    background-repeat: no-repeat;
    background-size: 100% 100%
}

.card {
    padding: 30px 40px;
    margin-top: 60px;
    margin-bottom: 60px;
    border: none !important;
    box-shadow: 0 6px 12px 0 rgba(0, 0, 0, 0.2)
}

.blue-text {
    color: #00BCD4
}

.form-control-label {
    margin-bottom: 0
}

input,
textarea,
button {
    padding: 8px 15px;
    border-radius: 5px !important;
    margin: 5px 0px;
    box-sizing: border-box;
    border: 1px solid #ccc;
    font-size: 18px !important;
    font-weight: 300
}

input:focus,
textarea:focus {
    -moz-box-shadow: none !important;
    -webkit-box-shadow: none !important;
    box-shadow: none !important;
    border: 1px solid #00BCD4;
    outline-width: 0;
    font-weight: 400
}

.btn-block {
    text-transform: uppercase;
    font-size: 15px !important;
    font-weight: 400;
    height: 43px;
    cursor: pointer
}

.btn-block:hover {
    color: #fff !important
}

button:focus {
    -moz-box-shadow: none !important;
    -webkit-box-shadow: none !important;
    box-shadow: none !important;
    outline-width: 0
}
</style>
<body>


<%

String hyy=request.getParameter("msg");
if("valid".equals(hyy))
{
%>
<h3 class="alert" style="color:white">Address Successfully Updated !</h3>
<%} %>
<%
if("invalid".equals(hyy))
{
%>
<h3 class="alert" style="color:white">Some thing Went Wrong! Try Again!</h3>
<%} %>

<%
try
{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from userss where email='"+msg+"'");
	while(rs.next())
	{

%>
               
<div class="container-fluid px-1 py-5 mx-auto">
    <div class="row d-flex justify-content-center">
        <div class="col-xl-7 col-lg-8 col-md-9 col-11 text-center">
            <h3 style="color:white">Change Your Information</h3>
             <form action="addChangeAddressAction.jsp"   method="post">
            <div class="card">
                <h5 class="text-center mb-4">You can Edit your Address Details here.</h5>

                    <div class="row justify-content-between text-left">
                        <div class="form-group col-sm-6 flex-column d-flex"> <label class="form-control-label px-3">Enter City<span class="text-danger"> *</span></label> <input type="text" id="fname" name="city" pattern="[a-zA-Z]+" required title="Enter your city in the form of character like [a-z A-Z]" required value="<%=rs.getString(7) %>" onblur="validate(1)"> </div>
                        <div class="form-group col-sm-6 flex-column d-flex"> <label class="form-control-label px-3">Enter State<span class="text-danger"> *</span></label> <input type="text" id="lname" name="state" pattern="[a-zA-Z]+" required title="Enter your state answer in the form of character like [a-zA-Z]" required value="<%=rs.getString(8) %>"onblur="validate(2)"> </div>
                    </div>
                    <div class="row justify-content-between text-left">
                        <div class="form-group col-sm-6 flex-column d-flex"> <label class="form-control-label px-3">Enter Pincode<span class="text-danger"> *</span></label> <input type="text" id="email" name="pincode" pattern="[0-9]{6}" maxlength="6" required title="Enter your pincode in the form of numeric" required value="<%=rs.getString(9) %>" placeholder="" onblur="validate(3)"> </div>
                        <div class="form-group col-sm-6 flex-column d-flex"> <label class="form-control-label px-3">Enter Address<span class="text-danger"> *</span></label> <input type="text" id="mob" name="address" value="<%=rs.getString(10) %>" placeholder="" onblur="validate(4)"> </div>
                    </div>
                    <div class="row justify-content-between text-left">
                        <div class="form-group col-sm-6 flex-column d-flex"> <label class="form-control-label px-3">Enter Houseno<span class="text-danger"> *</span></label> <input type="text" id="job" name="houseno"  value="<%=rs.getString(11) %>"placeholder="" onblur="validate(5)"> </div>
                    </div>
                    <div class="row justify-content-between text-left">
                        <div class="form-group col-12 flex-column d-flex"> <label class="form-control-label px-3">Enter Landmark<span class="text-danger"> *</span></label> <input type="text" id="ans" name="landmark"  value="<%=rs.getString(12) %>" placeholder="" onblur="validate(6)"> </div>
                    </div>
                    <div class="row justify-content-end">
                        <div class="form-group col-sm-6"> <button type="submit" class="btn-block btn-primary">Save</button> </div>
                    </div>
           
            </div>
  
</form>
      </div>
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
</body>
<br><br><br><br>
</html>