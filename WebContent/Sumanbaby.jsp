<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     
       <%@page import="java.sql.* " %>
          
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit product</title>

<style>

.back{
color:white;
margin-left:2px;
}
</style>
</head>
<body>
<%
String id=request.getParameter("id");
Connection connection;
PreparedStatement ps;
ResultSet st;



try
{  
	Class.forName("com.mysql.cj.jdbc.Driver");
	connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/vastracollection", "root", "");
	
	ps=connection.prepareStatement("select * from dress where id='"+id+"'");
	st=ps.executeQuery();
	
	while(st.next())
	{	

%>


<form action="Editproduct"  method="post" enctype="multipart/form-data">

<div class="product">
<div class="container">
<center>
<br>

<a href="EditProduct.jsp"><i class="fa fa-arrow-circle-left" style="font-size:24px"></i></a>
<h2>Edit Product</h2>
<br>
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
<br>
<h4><strong><a  style="float:left; color:white;" href="EditProduct.jsp"><i class="lni lni-arrow-left-circle"></i>Back</a></strong></h4>
<br>
<br>
<div class="row">
<input type="hidden" name="id" value="<%out.println(id);%>">
<div class="col-6">
<div class="form-group">
<label for="name">Enter Name</label>
<input type="text" id="name" name="name" class="form-control " value="<%=st.getString(2) %>" required>
<hr style="width:0px; height:0.2px;width:100%; background-color:white" >
</div>
</div>

<div class="col-6">
<div class="form-group">
<label for="category">Enter Category</label>
<input type="text" id="category" name="category" class="form-control " value="<%=st.getString(3) %>" required>
<hr  style="width:0px; height:0.2px;width:100%; background-color:white">
</div>
</div>
</div>

<div class="row">
<div class="col-6">
<div class="form-group">
<label for="price">Enter Price</label>
<input type="text" id="price" name="price" class="form-control" value="<%=st.getString(4) %>" required>
<hr style="width:0px; height:0.2px;width:100%; background-color:white ">
</div>
</div>

<div class="col-6">
<div class="form-group">
<label for="active">Active</label>
<select name="active"  class="form-control " >
  <option  value="Yes">Yes</option>
  <option  value="No">No</option>
</select>
<hr style="width:0px; height:0.2px;width:100%; background-color:white ">
</div>

</div>
</div>
<div class="row">
<div class="col-6">
<div class="form-group">
<label for="image">Select Image</label>
<input style="padding:2px;" type="file" id="photo"  name="photo" class="input-file" placeholder="select image.." required>
<hr style="width:0px; height:0.2px;width:100%; background-color:white ">
</div>
</div>
<div class="col-6">
<div class="form-group">
<label for="desc">Product Description</label>
<input type="text" id="desc" name="description" class="form-control " value="<%=st.getString(6) %>" required>
<hr style="width:0px; height:0.2px;width:100%; background-color:white" >
</div>
</div>



</div>
<div class="form-group">
<Button type="submit"  style="width:20%; border-radius: 25px; margin:20px;"class="btn btn-danger text-light form-control ">
Save
<span class="iconify" data-icon="simple-line-icons:arrow-right-circle" data-inline="false"></span></Button>
</div>


</div>
</div>
</form>
</center>
<%
	}
}
catch(Exception e)
{
	
}
%>
</body>
</html>