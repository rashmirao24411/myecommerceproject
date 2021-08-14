<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<body style="background-color:white;" >


<nav class="navbar navbar-expand-lg navbar-light">
<div class="container" >


<h5 style="color:black" > 
 <% String msg=(String)session.getAttribute("email").toString();
out.print("Welcome..." + msg);
%>
</h5>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item active">
          <a class="nav-link" href="Homy.jsp" style="color:black">HOME</a>
      
        </li>
        
        <li class="nav-item">
          <a class="nav-link" href="addTocart.jsp" style="color:black"><i class="fas fa-cart-plus"></i>Cart</a>
        </li>
          <li class="nav-item">
          <a class="nav-link" href="MyOrder.jsp" style="color:black">MyOrder</a>
        </li>
        
          <li class="nav-item">
          <a class="nav-link" href="ChangeInformation.jsp" style="color:black">Change Details</a>
        </li>
          <li class="nav-item">
          <a class="nav-link" href="Sms.jsp" style="color:black">Message Us</a>
        </li>
       
         <li class="nav-item">
          <a class="nav-link" href="login.jsp" style="color:black">Logout</a>
        </li>
      </ul>
    
    </div>
</div>

</nav>


</body>
</html>