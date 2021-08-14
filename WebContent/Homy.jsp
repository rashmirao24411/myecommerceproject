<%@page import="java.util.Base64"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<html>
<head>
	<title></title>
	<style>
	
	.container{
display:inline-block;


}
.card{
border:1px solid #ccc;
width:270px;
margin:20px;
padding:20px;
margin-bottom:10px;
display:inline-block;
}

.card-img-top{
padding:5px;
 height:200px;
 width:200px;
}
	

}
.card{
position:center;
}
	.marquee{
	background-color:black;
	}
	.onoffswitch3-switch{
	font-size:45 px;
	text-transform:uppercase;
	letter-spacing: 2px;
	margin-top:25px;
	font-family: merienda;
	font-weight:bold;
	text-color:white;
	}


	
	
	</style>
	

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css">
<link rel="stylesheet"  type="text/css" href="Prospectus.css">
<link rel="shortcut icon" href=*/assests/favicon.ico*>
<link rel="stylesheet" href="./blockquotes.css">

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
</head>
<body style="background-color:black;" >
<%
response.setHeader("Cache-Control", "no-cache, no-store");

String msg=(String)session.getAttribute("email");

if(msg==null)
{
	response.sendRedirect("Vastraa.jsp");
}%>

<nav class="navbar navbar-expand-lg navbar-light">
<div class="container" >


<h5 style="color:white" > 
 <% 
out.print("Welcome..." + msg);
%>
</h5>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item active">
          <a class="nav-link" href="#" style="color:white">HOME</a>
      
        </li>
        
        <li class="nav-item">
          <a class="nav-link" href="addTocart.jsp" style="color:white"><i class="fas fa-cart-plus"></i>Cart</a>
        </li>
          <li class="nav-item">
          <a class="nav-link" href="MyOrder.jsp" style="color:white">MyOrder</a>
        </li>
        
          <li class="nav-item">
          <a class="nav-link" href="ChangeInformation.jsp" style="color:white">Change Details</a>
        </li>
          <li class="nav-item">
          <a class="nav-link" href="Sms.jsp" style="color:white">Message Us</a>
        </li>
       
         <li class="nav-item">
          <a class="nav-link" href="Logout.jsp" style="color:white">Logout</a>
        </li>
      </ul>
    
    </div>
</div>

</nav>




<div id="demo"  class="carousel slide" data-ride="carousel">


<div  class="carousel-inner" style="background-color:black;">
	<div  class="carousel-item active">
		<img src="Photo\imggg.jpg" class="d-block w-100 " alt="Indian Wear"/>
		<div class="carousel-caption d-none d-md-block">
    <h3 class="animated bounceInRight" style="animation-delay:1s">Let Celebrate Our Collection </h3>
    <p class="animated bounceInLeft" style="animation-delay:2s">To Book your Appointment Please
    </p>
    <p class="animated bounceInRight" style="animation-delay:3s"><a href="AppointmentForm.jsp">Click here</a></p>
  </div>
	</div>
</div>
</div>	
	
<div class="marquee">

<div class="onoffswitch3">
   
    <label class="onoffswitch3-label" for="myonoffswitch3">
        <span class="onoffswitch3-inner">
            <span class="onoffswitch3-active">
               <p class="text-white"> <marquee class="scroll-text"  >Wrap yourself in the best attires! 
                Take pride in wearing ethnic! The style you love!  <span class="glyphicon glyphicon-forward"></span>
                 Wearing traditional clothes is a way of letting the world know who I am without having to say it.
                  <span class="glyphicon glyphicon-forward"></span>  No matter how many shorts or strapless minis an 
                  Indian girl wears, deep down she will always be a cute desi girl in an Anarkali!</marquee>
                <span class="onoffswitch3-switch" >Special Offers For You VASTRACollection<span class="glyphicon glyphicon-remove"></span></span></p>
            </span>
          
        </span>
    </label>
</div>

</div >
<form class="form-inline my-2 my-lg-0" action="Searching.jsp"> 
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" name="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>


<%




		Connection connection;
		PreparedStatement ps;
		ResultSet st;

		String imgLen="";
		
	%>
	
	
	  <div class="row">
	  
	    
	    <div class="column">
	  
<div class="column">
	   <center> <h4 style="color:white;"> Anarkali Suit Collection</h4></center> 
	    </div>
	  
	  </div>
	  </div>
	
	
	<div class="container">
<div class="row">
	
	
	<%	
		try
		{  
			Class.forName("com.mysql.jdbc.Driver");
			connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/vastracollection", "root", "");
		    ps=connection.prepareStatement("select * from dress where active='yes' AND category='Anarkali Collection'");
		 
		   
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

<div class="col-sm-3">
<div class="product_wrapper">
<div class="card ">
    <img src="data:image/jpg;base64,${base64Image}" id="img"class="card-img" alt="..." width="240" height="250"/>
       
       
      <div class="card-body">
      <h5 class="card-title"><b><%=st.getString(2) %> </b></h5>
     
      
   <input type="hidden" value=<%= st.getString(1)%> name="product" class="form-control">
        <h5 class="card-title" id="desc"><b> </b></h5>
        
        <p class="card-text"><small class="text-muted"><%=st.getString(6) %></small></p>
       
     <h6 type="" class="">&#8377;<%=st.getString(4)%>/-<span class="text-secondary discount-label">10% off</span></h6>
     <button type="button" class="btn btn-outline-info" onclick="addToCart(<%= st.getString(1)%>)" >Add to Cart</button>

</div>
</div>
</div>
</div>

  
 <br><br>
 
 <%
			   }
					}
					catch (Exception e)
					{
					e.printStackTrace();
					}
	
%>
<br><br>
<center><h4 style="color:white;">  Gowns Collection</h4></center>

<br>


	<%	
		try
		{  
			Class.forName("com.mysql.jdbc.Driver");
			connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/vastracollection", "root", "");
		    ps=connection.prepareStatement("select * from dress where active='yes' AND category='Gown Collection'");
		 
		   
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



<div class="col-sm-3">
<div class="product_wrapper">
<div class="card ">
    <img src="data:image/jpg;base64,${base64Image}" id="img"class="card-img" alt="..." width="240" height="250"/>
       
       
      <div class="card-body">
      <h5 class="card-title"><b><%=st.getString(2) %> </b></h5>
     
      
   <input type="hidden" value=<%= st.getString(1)%> name="product" class="form-control">
        <h5 class="card-title" id="desc"><b> </b></h5>
        
        <p class="card-text"><small class="text-muted"><%=st.getString(6) %></small></p>
       
     <h6 type="" class="">&#8377;<%=st.getString(4)%>/-<span class="text-secondary discount-label">10% off</span></h6>
     <button type="button" class="btn btn-outline-info" onclick="addToCart(<%= st.getString(1)%>)" >Add to Cart</button>

</div>
</div>
</div>
</div>
 <%
			   }
					}
					catch (Exception e)
					{
					e.printStackTrace();
					}
	
%>
<br><br>

<br><br>
<br><br>
<center><h4 style="color:white;"> Gujrati Dress Collection</h4></center>

<br>



	<%	
		try
		{  
			Class.forName("com.mysql.jdbc.Driver");
			connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/vastracollection", "root", "");
		    ps=connection.prepareStatement("select * from dress where active='yes' AND category='GujratiDressCollection'");
		 
		   
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


  


<div class="col-sm-3">
<div class="product_wrapper">
<div class="card ">
    <img src="data:image/jpg;base64,${base64Image}" id="img"class="card-img" alt="..." width="240" height="250"/>
       
       
      <div class="card-body">
      <h5 class="card-title"><b><%=st.getString(2) %> </b></h5>
     
      
   <input type="hidden" value=<%= st.getString(1)%> name="product" class="form-control">
<h5 class="card-title" id="desc"><b> </b></h5>
        
        <p class="card-text"><small class="text-muted"><%=st.getString(6) %></small></p>
       
     <h6 type="" class="">&#8377;<%=st.getString(4)%>/-<span class="text-secondary discount-label">10% off</span></h6>
     <button type="button" class="btn btn-outline-info" onclick="addToCart(<%= st.getString(1)%>)" >Add to Cart</button>
       
</div>
</div>
</div>
</div>

  <%
			   }
					}
					catch (Exception e)
					{
					e.printStackTrace();
					}
	
%>
<br><br> 

<br><br>
<center><h4 style="color:white;"> Saree Collections </h4></center>

<br>


	<%	
		try
		{  
			Class.forName("com.mysql.jdbc.Driver");
			connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/vastracollection", "root", "");
		    ps=connection.prepareStatement("select * from dress where active='yes' AND category='SareeCollection'");
		 
		   
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

  


<div class="col-sm-3">
<div class="product_wrapper">
<div class="card ">
    <img src="data:image/jpg;base64,${base64Image}" id="img"class="card-img" alt="..." width="240" height="250"/>
       
       
      <div class="card-body">
      <h5 class="card-title"><b><%=st.getString(2) %> </b></h5>
     
      
   <input type="hidden" value=<%= st.getString(1)%> name="product" class="form-control">
        <h5 class="card-title" id="desc"><b> </b></h5>
        
        <p class="card-text"><small class="text-muted"><%=st.getString(6) %></small></p>
       
     <h6 type="" class="">&#8377;<%=st.getString(4)%>/-<span class="text-secondary discount-label">10% off</span></h6>
     <button type="button" class="btn btn-outline-info" onclick="addToCart(<%= st.getString(1)%>)" >Add to Cart</button>
       
</div>
</div>
</div>
</div>

  <%
			   }
					}
					catch (Exception e)
					{
					e.printStackTrace();
					}
	
%>
<br><br> 



<center><h4 style="color:white;"> Kathak Costume </h4></center>

<br>


	<%	
		try
		{  
			Class.forName("com.mysql.jdbc.Driver");
			connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/vastracollection", "root", "");
		    ps=connection.prepareStatement("select * from dress where active='yes' AND category='KathakCostume'");
		 
		   
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

  


<div class="col-sm-3">
<div class="product_wrapper">
<div class="card ">
    <img src="data:image/jpg;base64,${base64Image}" id="img"class="card-img" alt="..." width="240" height="250"/>
       
       
      <div class="card-body">
      <h5 class="card-title"><b><%=st.getString(2) %> </b></h5>
     
      
   <input type="hidden" value=<%= st.getString(1)%> name="product" class="form-control">
       <h5 class="card-title" id="desc"><b> </b></h5>
        
        <p class="card-text"><small class="text-muted"><%=st.getString(6) %></small></p>
       
     <h6 type="" class="">&#8377;<%=st.getString(4)%>/-<span class="text-secondary discount-label">10% off</span></h6>
     <button type="button" class="btn btn-outline-info" onclick="addToCart(<%= st.getString(1)%>)" >Add to Cart</button>
       
</div>
</div>
</div>
</div>

  <%
			   }
					}
					catch (Exception e)
					{
					e.printStackTrace();
					}
	
%>
<br><br> 

<br><br>
<center><h4 style="color:white;"> Ghagra Choli </h4></center>

<br>


	<%	
		try
		{  
			Class.forName("com.mysql.jdbc.Driver");
			connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/vastracollection", "root", "");
		    ps=connection.prepareStatement("select * from dress where active='yes' AND category='Rajasthan Collection'");
		 
		   
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

  


<div class="col-sm-3">
<div class="product_wrapper">
<div class="card ">
    <img src="data:image/jpg;base64,${base64Image}" id="img"class="card-img" alt="..." width="240" height="250"/>
       
       
      <div class="card-body">
      <h5 class="card-title"><b><%=st.getString(2) %> </b></h5>
     
      
   <input type="hidden" value=<%= st.getString(1)%> name="product" class="form-control">
        <h5 class="card-title" id="desc"><b> </b></h5>
        
        <p class="card-text"><small class="text-muted"><%=st.getString(6) %></small></p>
       
     <h6 type="" class="">&#8377;<%=st.getString(4)%>/-<span class="text-secondary discount-label">10% off</span></h6>
     <button type="button" class="btn btn-outline-info" onclick="addToCart(<%= st.getString(1)%>)" >Add to Cart</button>
       
</div>
</div>
</div>
</div>

  <%
			   }
					}
					catch (Exception e)
					{
					e.printStackTrace();
					}
	
%>
<br><br> 

<br><br>
<center><h4 style="color:white;"> Crop tops & Skirts </h4></center>

<br>


	<%	
		try
		{  
			Class.forName("com.mysql.jdbc.Driver");
			connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/vastracollection", "root", "");
		    ps=connection.prepareStatement("select * from dress where active='yes' AND category='Top&skirts'");
		 
		   
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

  


<div class="col-sm-3">
<div class="product_wrapper">
<div class="card ">
    <img src="data:image/jpg;base64,${base64Image}" id="img"class="card-img" alt="..." width="240" height="250"/>
       
       
      <div class="card-body">
      <h5 class="card-title"><b><%=st.getString(2) %> </b></h5>
     
      
   <input type="hidden" value=<%= st.getString(1)%> name="product" class="form-control">
      <h5 class="card-title" id="desc"><b> </b></h5>
        
        <p class="card-text"><small class="text-muted"><%=st.getString(6) %></small></p>
       
     <h6 type="" class="">&#8377;<%=st.getString(4)%>/-<span class="text-secondary discount-label">10% off</span></h6>
     <button type="button" class="btn btn-outline-info" onclick="addToCart(<%= st.getString(1)%>)" >Add to Cart</button>
       
</div>
</div>
</div>
</div>

  <%
			   }
					}
					catch (Exception e)
					{
					e.printStackTrace();
					}
	
%>
<br><br> 

<br><br>
<center><h4 style="color:white;"> Plazzo Suit </h4></center>

<br>


	<%	
		try
		{  
			Class.forName("com.mysql.jdbc.Driver");
			connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/vastracollection", "root", "");
		    ps=connection.prepareStatement("select * from dress where active='yes' AND category='Plazzo Suit'");
		 
		   
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

  


<div class="col-sm-3">
<div class="product_wrapper">
<div class="card ">
    <img src="data:image/jpg;base64,${base64Image}" id="img"class="card-img" alt="..." width="240" height="250"/>
       
       
      <div class="card-body">
      <h5 class="card-title"><b><%=st.getString(2) %> </b></h5>
     
      
   <input type="hidden" value=<%= st.getString(1)%> name="product" class="form-control">
       <h5 class="card-title" id="desc"><b> </b></h5>
        
        <p class="card-text"><small class="text-muted"><%=st.getString(6) %></small></p>
       
     <h6 type="" class="">&#8377;<%=st.getString(4)%>/-<span class="text-secondary discount-label">10% off</span></h6>
     <button type="button" class="btn btn-outline-info" onclick="addToCart(<%= st.getString(1)%>)" >Add to Cart</button>
       
</div>
</div>
</div>
</div>

  <%
			   }
					}
					catch (Exception e)
					{
					e.printStackTrace();
					}
	
%>
<br><br> 

<br><br>
<br><br>
<center><h4 style="color:white;"> Mask Collections </h4></center>

<br>


	<%	
		try
		{  
			Class.forName("com.mysql.jdbc.Driver");
			connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/vastracollection", "root", "");
		    ps=connection.prepareStatement("select * from dress where active='yes' AND category='DesignerMask'");
		 
		   
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




  


<div class="col-sm-3">
<div class="product_wrapper">
<div class="card ">
    <img src="data:image/jpg;base64,${base64Image}" id="img"class="card-img" alt="..." width="240" height="250"/>
       
       
      <div class="card-body">
      <h5 class="card-title"><b><%=st.getString(2) %> </b></h5>
     
      
   <input type="hidden" value=<%= st.getString(1)%> name="product" class="form-control">
<h5 class="card-title" id="desc"><b> </b></h5>
        
        <p class="card-text"><small class="text-muted"><%=st.getString(6) %></small></p>
       
     <h6 type="" class="">&#8377;<%=st.getString(4)%>/-<span class="text-secondary discount-label">10% off</span></h6>
     <button type="button" class="btn btn-outline-info" onclick="addToCart(<%= st.getString(1)%>)" >Add to Cart</button>
       
</div>
</div>
</div>
</div>

  <%
			   }
					}
					catch (Exception e)
					{
					e.printStackTrace();
					}
	
%>
<br><br> 

<br><br>




<%@include file="Nav.jsp" %>
<script>

function addToCart(id){
	
	
	$.ajax({
		url:'SHAKA.jsp',
		data:{"product":id},
		type:'POST',
		
		
		
		
		
		
		success: function(data)
		{
			var result=$.trim(data);
			
				if(result==1)
				{
					alert("added to cart");
				}
				else
				{
					alert("Quantity increased");
				}
				
		}
		
	});
	
}
</script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<script scr="script.js"></script>
</body>
</html>


 