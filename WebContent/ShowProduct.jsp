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
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<style>


.card{
border:1px solid #ccc;
width:300px;
margin:35px;
padding:20px;
margin-bottom:10px;
display:inline-block;
}

.card-img-top{
padding:5px;
 height:200px;
 width:200px;
}

</style>
</head>

<body>
<div class="row">
<br>
<br>


<br><br>



<%
String answer=request.getParameter("msg");
if("added".equals(answer))
{
	

%>
<h3>Product Added Successfully!</h3>
<form action="" method="post">
 <button type="submit" class="btn btn-info">GO TO CART</button>
 </form>
<%}%>
<%
if("exist".equals(answer))
{
	

%>
<h3>Product already exist in your cart! Quantity increased!</h3>
<form action="myCart.jsp" method="post">
 <button type="submit" class="btn btn-info">GO TO CART</button>
 </form>
<%}%>
<%
if("invalid".equals(answer))
{
%>
<h3>Something went wrong! Try Again!</h3>
<%}%>

<%




		Connection connection;
		PreparedStatement ps;
		ResultSet st;

		String imgLen="";
		String Milk="";
	%>
	
	 
	
	<%	
		try
		{  
			Class.forName("com.mysql.jdbc.Driver");
			connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/vastracollection", "root", "");
		    ps=connection.prepareStatement("select * from dress where category ='Traditional' ");
		 
		   
			st=ps.executeQuery();
			
			while(st.next())
			{
				 Blob blob = st.getBlob(7);
                 
                InputStream inputStream = blob.getBinaryStream();
                ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                byte[] buffer = new byte[4096];
                int bytesRead = -1;
                 
                while ((bytesRead = inputStream.read(buffer)) != -1)
                {
                    outputStream.write(buffer, 0, bytesRead);                  
                }
                 
                byte[] imageBytes = outputStream.toByteArray();
                String base64Image = Base64.getEncoder().encodeToString(imageBytes);
                 
                pageContext.setAttribute("base64Image", base64Image);
            
                inputStream.close();
                outputStream.close();
	    
%>
<br><br>

 <div class="row">
<form action="#" method="post" >
 <div class="col-mb-4" style=" display:inline-block;">
 <div class="row" >
  <div class="col-sm-3">
 
    <div class="card ">
    <img src="data:image/jpg;base64,${base64Image}" class="card-img" alt="..." width="240" height="250"/>
       
       
      <div class="card-body">
     
       <input type="hidden" value=<%= st.getString(2)%> name="product" class="form-control">
   
        <h5 class="card-title"><b><%=st.getString(6) %> </b></h5>
        
        <p class="card-text"><small class="text-muted">Rs<%=st.getString(4) %></small></p>
       
     <button type="submit" class="btn btn-outline-info">OrderNow</button>
     <button type="submit" class="btn btn-outline-info">Add to Cart</button>

      </div>
    </div>
  </div>
</div>
 </div>
 </form></div>
 <br><br>
 
 <%
			   }
					}
					catch (Exception e)
					{
					e.printStackTrace();
					}
%>
</div>
</body>
</html>