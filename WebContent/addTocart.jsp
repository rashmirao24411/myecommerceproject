<%@page import="Connection_db.ConnectionProvider" %>
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
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>

.container{
position:center;
}
table{
width:100%;
border-collapse:collapse;
}
.card-info{
display:flex;
flex-wrap:wrap;
}
th{
text-align:left;
padding:5px;
color:#fff;
background:#ff523b;
font-weight:normal;
}
td{
padding:10px,5px;
}
td input{
width:40px;
height:30px;
padding:5px;
}
td a{
colors: #ff523b;
font-size:12px;
}
td img{
width:80px;
height:80px;
margin-right:10px;
}
.total-price{
display:flex;
justify-content:flex-end;

}
.total-price table{
border-top:3px solid #ff523b;
width:100%;
max-width:4000px;
}
td:last-child{
text-align:right;

}
th:last-child{
text-align:right;

}
.table
{
width:50%;
}

.hrline
{
width:-40%;
align:Right;


}
.column1{
width:50%;
align:left;
}
.column2{
width:50%;
align:Right;
}
#card2{
float:right;
margin-top:3%;
margin-right:5%;
position: right-top-right fixed;
}
#tab{
margin-left:5%;
}

</style>

</head>
<body >

<%@include file="Afterlogin.jsp" %>
  


<div class="marquee" bg-color:"black">


<div class="onoffswitch3">
   
    <label class="onoffswitch3-label" for="myonoffswitch3">
        <span class="onoffswitch3-inner">
            <span class="onoffswitch3-active">
               <p class="text-white"> <marquee class="scroll-text"  >As per guidelines, We are only delivering essentials in government specified pincode
                <span class="glyphicon glyphicon-forward"></span>
                 Your Safety is our priority
                  <span class="glyphicon glyphicon-forward"></span>  We care for you</marquee>
                <span class="onoffswitch3-switch" >  
   <center><h3 class="display-4">
</h3></center> <span class="glyphicon glyphicon-remove"></span></span></p>
            </span>
          
        </span>
    </label>
</div>

</div >
    
  




<% 
String msg1=request.getParameter("msg");
if("removed".equals(msg1)) 
{
	%>  <h6> Product removed</h6>
<%}
%>


<div class="container" id="tab" >

<table class="table"  >

<tr>
<th  scope="col" class="border-0 bg-light">Product </th>
<th  scope="col" class="border-0 bg-light">Quantity</th>
<th  scope="col" class="border-0 bg-light">SubTotal</th>
</tr>
</table>

<%
String email=(String)session.getAttribute("email").toString();



		Connection connection;
		PreparedStatement ps;
		ResultSet st;

		String imgLen="";
		
		try
		{  
			Class.forName("com.mysql.jdbc.Driver");
			connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/vastracollection", "root", "");
			
			ps=connection.prepareStatement("select * from mycarts where email='"+email+"' ");
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


<table class="table">


<tr>
<td><div class="class-info">
<img src="data:image/jpg;base64,${base64Image}" />
<p><%=st.getString(7) %></p>
<small>Price:&#8377;<%=st.getInt(4) %></small>
<i class="fas fa-trash-alt"></i>
<a href="Remove.jsp?id=<%=st.getString(2)%>"><i class="fa fa-trash"></i></a>
</div></td>
<td>


<a href="incDesQuantityAction.jsp?id=<%=st.getInt(2)%>&quantity=dec"><i class="fa fa-minus-circle" aria-hidden="true"></i></a>
 <input type="text" style="text-align:center" value="<%=st.getString(3) %>"><a href="incDesQuantityAction.jsp?id=<%=st.getString(2)%>&quantity=inc">
 <i class="fa fa-plus-circle" aria-hidden="true"></i></a>
</td>
<td>Subtotal:&#8377;<%=st.getInt(5) %></td>
</tr>






<%
			   }
					}
					catch (Exception e)
					{
					e.printStackTrace();
					}

%>
</table>
<%

int total=0;


try
{  
	Class.forName("com.mysql.jdbc.Driver");
	connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/vastracollection", "root", "");
	
	ps=connection.prepareStatement("select sum(total) as total from mycarts where email='"+email+"'");
	st=ps.executeQuery();
	
	while(st.next())
	{
		total=st.getInt(1);
	}
   
}
catch(Exception exception)
{
	exception.printStackTrace();
}

%>

<div class="column2">
<div class="total-price">

<table>
<tr>
<td></td>
</tr>
<tr>
<td>Total: &#8377; <%out.print(total);%> </td>
</tr>
</table>
</div>
</div>
</div>

<div class="card" style="width: 28rem;" id="card2">
 
  <div class="card-body">
    <h5 class="card-title" style="background-color:#ff523b ; font-size:20px; color:white">Price Details</h5>
    <p class="card-text"> .</p>
  </div>
  <ul class="list-group list-group-flush">
    <pre><li class="list-group-item"><b>Price  </b>                                 &#x20B9;<%out.print(total);%> </li></pre>
   <pre> <li class="list-group-item" ><b>Delievery Charges </b>                    <span style= "color:#12b31d"> -FREE</span></li></pre>
   <pre><li class="list-group-item"><b>Total Amount </b>                          &#x20B9; <%out.print(total);%></li>
  </ul>
  <div class="card-body">
    <a href="Checkout.jsp?sum=<%=total%>" class="card-link"><Button class="btn btn-info">Proceed to Checkout</Button></a>
   
  </div>
</div>






</body>

</html>
  


  