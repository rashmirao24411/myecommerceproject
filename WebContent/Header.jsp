<html>
<head>
	<title></title>
	<style>
	
.row{
width:100%
}
.column{
float:left;
width:50%;
}
.column1{
float:right;
width:50%;

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
          <a class="nav-link" href="MyOrder.jsp" style="color:white">MyOrder</a>
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

</html>