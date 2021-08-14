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


<nav class="navbar navbar-expand-lg navbar-light">
<div class="container" >
<h5 style="color:white" > 
 <% 
 String msg=(String)session.getAttribute("email");
out.print("Welcome..." + msg);
%>
</h5>

    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav ms-auto">
       <li class="nav-item">
          <a class="nav-link" href="Homy.jsp" style="color:white">Home</a>
        </li>
        
        <li class="nav-item">
          <a class="nav-link" href="addTocart.jsp" style="color:white"><i class="fas fa-cart-plus"></i>Cart</a>
        </li>
          <li class="nav-item">
          <a class="nav-link" href="#" style="color:white">MyOrder</a>
        </li>
         <li class="nav-item">
          <a class="nav-link" href="ProductCancel.jsp" style="color:white">CancelOrder</a>
        </li>
         <li class="nav-item">
          <a class="nav-link" href="login.jsp" style="color:white">Logout</a>
        </li>
      </ul>
    
    </div>
</div>

</nav>




<%




		Connection connection;
		PreparedStatement ps;
		ResultSet st;

		String imgLen="";
		
	%>
	
	
	  <div class="row">
	  
	    
	    <div class="column">
	  
<div class="column">
	   <center> <h4 style="color:white;"> My Order </h4></center> 
	    </div>
	  
	  </div>
	  </div>
	
	
	<div class="container">
<div class="row">
	
	
	<%	
	String email=(String)session.getAttribute("email").toString();
	
		try
		{  
			Class.forName("com.mysql.jdbc.Driver");
			connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/vastracollection", "root", "");
		    ps=connection.prepareStatement("select * from myorder where email='"+email+"' ");
		 
		   
			st=ps.executeQuery();
			
			while(st.next())
			{
				 Blob blob = st.getBlob(6);
                 
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
<input type="hidden" value="<%=st.getString(2)%>" name="product_id" >
<div class="col-sm-3">
<div class="product_wrapper">
<div class="card ">
    <img src="data:image/jpg;base64,${base64Image}" id="img"class="card-img" alt="..." width="240" height="250"/>
       
       
      <div class="card-body">
      <h5 class="card-title"><b><%=st.getString(7) %> </b></h5>
     
      
   <input type="hidden" value=<%= st.getString(1)%> name="product" class="form-control">
        <h5 class="card-title" id="desc"><b> </b></h5>
           <p class="card-text"><small class="text-muted">Product_id:<%=st.getString(2) %></small></p>
         <p class="card-text"><small class="text-muted">Price:<%=st.getString(4) %></small></p>
        
        <p class="card-text"><small class="text-muted">Date of Order:<%=st.getString(8) %></small></p>
        <p class="card-text"><small class="text-muted">Product_Status:<%=st.getString(9) %></small></p>

       
     
  

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

  








<%@include file="Nav.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<script scr="script.js"></script>
</body>
</html>


 