<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     
       <%@page import="java.sql.* " %>
          
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head >

<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<style>

</style>

</head>

<body>
<%@include file="AdminWelcome.jsp" %>


<%
String id=request.getParameter("id");
Connection connection;
PreparedStatement ps;
ResultSet st;



try
{  
	Class.forName("com.mysql.cj.jdbc.Driver");
	connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/vastracollection", "root", "");
	
	ps=connection.prepareStatement("select * from  where id='"+id+"'");
	st=ps.executeQuery();
	
	while(st.next())
	{	

%>


<%
String msg=request.getParameter("msg");
if("done".equals(msg))
{
%>
<h3 >Product Successfully Updated!</h3>
<%} %>
<%if("wrong".equals(msg)) 
{
%>
<h3 >Some thing went wrong! Try again!</h3>
<%} %>


<div class="container">

<form action="Editproduct"  method="post" enctype="multipart/form-data">


<div style"width:1000px;float:left">
<fieldset>

<!-- Form Name -->
<center>
<img src="plus.png" width="30" height="30" class="d-inline-block align-top" alt="">

</center>
<h3 style="color:#ffffff;"><center>Edit Products</center></h3>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="id" style="color:#ffffff;">PRODUCT ID</label>  
  <div class="col-md-4">
  <input id="id" name="id" value="<%out.println(id);%>" class="form-control input-md" required="" type="text">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="name" style="color:#ffffff;">PRODUCT NAME</label>  
  <div class="col-md-4">
  <input id="name" name="name" value="<%=st.getString(2) %>" class="form-control input-md" required="" type="text">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="category" style="color:#ffffff;">PRODUCT CATEGORY</label>  
  <div class="col-md-4">
  <input id="name" name="category"  value="<%=st.getString(3) %>" class="form-control input-md" required="" type="text">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="price" style="color:#ffffff;">PRODUCT PRICE</label>  
  <div class="col-md-4">
  <input id="name" name="price" value="<%=st.getString(4) %>" class="form-control input-md" required="" type="text">
    
  </div>
</div>




<!-- Select Basic -->
<div class="form-group">
  <label class="col-md-4 control-label" for="active " style="color:#ffffff">PRODUCT ACTIVE</label>
  <div class="col-md-4">
   <select name="active" id="active" class="form-control input-border">
  <option  value="Yes">Yes</option>
  <option  value="No">No</option>
</select>
  </div>
</div>





<!-- Textarea -->
<div class="form-group">
  <label class="col-md-4 control-label" for="description "   style="color:#ffffff">PRODUCT DESCRIPTION</label>
  <div class="col-md-4">                     
    <textarea class="form-control" id="description" name="description"  value="<%=st.getString(6) %>"></textarea>
  </div>
</div>

<!-- File Button --> 
<div class="form-group">
  <label class="col-md-4 control-label" for="photo" style="color:#ffffff;">Product Image</label>
  <div class="col-md-4">
    <input id="photo" name="photo" class="input-file" type="file">
  </div>
</div>


<!-- Button -->
<div class="form-group">
  <label class="col-md-4 control-label" for="singlebutton"></label>
  <div class="col-md-4">
    <button id="singlebutton" name="singlebutton" class="btn btn-primary" style="color:#ffffff;">Save</button>
  </div>
  </div>

</fieldset>
</div>
</form>
</div>
<%
	}
}
catch(Exception e)
{
	
}
%>
</body>
</html>

