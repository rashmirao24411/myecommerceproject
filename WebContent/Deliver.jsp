<%@page import="java.util.Base64"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
.id1:hover {
  background-color: #555555;
  color: white;
 
}
.id1{
 border-radius: 8px;
}
#products {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

#products td, #products th {
  border: 1px solid #ddd;
  padding: 8px;
}

#products tr:nth-child(even){background-color: #f2f2f2;}

#products  tr:hover {background-color:black;color: white;}

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #04AA6D;
  color: white;
}
#button{
 border-radius: 50%;
 font-size: 10px;
}
</style>
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
<!--Get your own code at fontawesome.com-->
</head>
<a href="AdminWelcome.jsp"><i class="fa fa-arrow-circle-left" style="font-size:24px"></i></a>
<div style="color: black; text-align: center; font-size: 30px;">Delivered Orders Detail <i class="fa fa-motorcycle"></i></div>
<%
String msg=request.getParameter("msg");
if("done".equals(msg))
{
%>
<h3 class="alert">Product Successfully Updated!</h3>
<%} %>
<%if("worng".equals(msg)) 
{
%>
<h3 class="alert">Some thing went wrong! Try again!</h3>
<%} %>




<div class="col-md-8">

<div>
<hr>
</div>
</div>

   
       <table class="table table-dark" id="products">
       



      
        <thead>
        
          <tr>
        
            <th scope="col">Customer Email</th>
            
            <th scope="col" >Product Id</th>
            <th scope="col" >Quantity</th>
            <th scope="col"><i class="fa fa-inr"></i> Price</th>
            <th scope="col"><i class="fa fa-inr"></i> Total</th>
            <th>Product Name</th>
             <th scope="col">Order Date</th>
             <th scope="col">Payment Method</th>
             <th scope="col">Status</th>
               <th scope="col">Customer Name</th> 
               <th scope="col">Phone</th>  
            <th>City</th>
            <th>State</th>
            <th>Pin code</th>
            <th>Address</th>
            <th>Hno</th>
            <th>Landmark</th>
            
            
           
           
          </tr>
        </thead>
        <tbody>
       <%
       try
       {
    	   Class.forName("com.mysql.jdbc.Driver");  
    		Connection con=DriverManager.getConnection(  
    				"jdbc:mysql://localhost:3306/vastracollection","root","");  
    	   PreparedStatement ps=con.prepareStatement("select * from myorder where status='delivered'");
    	   ResultSet set=ps.executeQuery();
    	   while(set.next())
			{
				 
    	   
    
       %>
       
      

          <tr>
         
            <td><%=set.getString(1)%></td>
            <td><%=set.getString(2)%></td>
            <td><%=set.getString(3)%></td>
            <td><i class="fa fa-inr"></i> <%=set.getString(4)%></td>
            <td><%=set.getString(5)%></td>
            <td><%=set.getString(7)%></td>
             <td><%=set.getString(8)%></td>
               <td><%=set.getString(10)%></td>
               
               
                
                 
                 
                 
                 
                 
    <td><%=set.getString(9)%></td>
  <td><%=set.getString(11)%></td>
            <td><%=set.getString(12)%></td>
             
       <td><%=set.getString(13)%></td>
       <td><%=set.getString(14)%></td>
       <td><%=set.getString(15)%></td>
            <td><%=set.getString(16)%></td>
             <td><%=set.getString(17)%></td>
              <td><%=set.getString(18)%></td>
      
               
            
           
          </tr>

                  
          
         <%}}
       catch(Exception e)
       {
    	   e.printStackTrace();
       }
       %>

          
          
          
          
     
        </tbody>
      </table>
      <br>
      <br>
      <br>

</body>
</html>