<!DOCTYPE html>
<html>
  <head>
    <title>Product Cancel form</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet">
    <style>
      html, body {
      min-height: 100%;
      }
      body, div, form, input, select, p { 
      padding: 0;
      margin: 0;
      outline: none;
      font-family: Roboto, Arial, sans-serif;
      font-size: 16px;
      color: #eee;
      }
      body {
      background: url("/uploads/media/default/0001/01/b5edc1bad4dc8c20291c8394527cb2c5b43ee13c.jpeg") no-repeat center;
      background-size: cover;
      }
      h1, h2 {
      text-transform: uppercase;
      font-weight: 400;
      }
      h2 {
      margin: 0 0 0 8px;
      }
      .main-block {
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      height: 100%;
      padding: 25px;
      background: rgba(0, 0, 0, 0.5); 
      }
      .left-part, form {
      padding: 25px;
      }
      .left-part {
      text-align: center;
      }
      .fa-graduation-cap {
      font-size: 72px;
      }
      form {
      background: rgba(0, 0, 0, 0.7); 
      }
      .title {
      display: flex;
      align-items: center;
      margin-bottom: 20px;
      }
      .info {
      display: flex;
      flex-direction: column;
      }
      input, select {
      padding: 5px;
      margin-bottom: 30px;
      background: transparent;
      border: none;
      border-bottom: 1px solid #eee;
      }
      input::placeholder {
      color: #eee;
      }
      option:focus {
      border: none;
      }
      option {
      background: black; 
      border: none;
      }
      .checkbox input {
      margin: 0 10px 0 0;
      vertical-align: middle;
      }
      .checkbox a {
      color: #26a9e0;
      }
      .checkbox a:hover {
      color: #85d6de;
      }
      .btn-item, button {
      padding: 10px 5px;
      margin-top: 20px;
      border-radius: 5px; 
      border: none;
      background: #26a9e0; 
      text-decoration: none;
      font-size: 15px;
      font-weight: 400;
      color: #fff;
      }
      .btn-item {
      display: inline-block;
      margin: 20px 5px 0;
      }
      button {
      width: 100%;
      }
      button:hover, .btn-item:hover {
      background: #85d6de;
      }
      @media (min-width: 568px) {
      html, body {
      height: 100%;
      }
      .main-block {
      flex-direction: row;
      height: calc(100% - 50px);
      }
      .left-part, form {
      flex: 1;
      height: auto;
      }
      }
    </style>
  </head>
  <body>
  <a href="Homy.jsp"><i class="fa fa-arrow-circle-left" style="font-size:24px ; color:black;" style=></i></a>
    <div class="main-block">
      <div class="left-part">
            <% String user=request.getParameter("msg");
          if("valid".equals(user)){
        	  %>
        	  <h4> We will Contact you soon... </h4>
 
<% } %>
<%
if("invalid".equals(user)){
        	  %>
        	  <h4> Something Went Wrong </h4>
 
<% } %>
         <img src="Photo\cancel.png" width="60" height="60" class="d-inline-block align-top" alt="">
        <h1>Dear Customer Please fill the form</h1>
        <p>Please Provide us all the information through which we can work on our services as well as products.</p>
        
      </div>
      
      <form action="Usermyorderaction.jsp">
        <div class="title">
          <i class="fas fa-pencil-alt"></i> 
          <h2>Enter your details here</h2>
        </div>
        <div class="info">
          <input class="fname" type="text" name="name" placeholder="Full name" pattern="[a-z A-Z]+" required required title="Enter your name in the form of character like [a-zA-Z]" required>
          <input type="text" name="email" placeholder="Email" id="email"  pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" size="30" required>
          <input type="text" name="phone" placeholder="Phone number" pattern="[789][0-9]+"  required title="Your Phone number should start with 7,8,9 and in the form of numeric" placeholder="Enter New Mobile Number" required>
          <input type="text" name="product_id" placeholder="Product_id" pattern="[0-9]+"pattern="[0-9]+"  required title="Your Product number should be in the form of numeric" required>
          
          
          <select name="reason" required>
          <option value="">Product cancel reason?</option>
<option value="product price is high">product price is high</option>
<option value="will buy for the next time">will buy for the next time</option>
<option value="product-quality is low">product-quality is low</option>
<option value="why my product is cancel?">why my product is cancel?"</option>
</select>
        
     
        </div>
       
        <button type="submit" href="/">Submit</button>
      </form>
    </div>
  </body>
</html>