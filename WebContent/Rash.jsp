

<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
</head>

<form  class="form-horizontal" action="Product" method="post" enctype="multipart/form-data">

<div style"width:1000px;float:left">
<fieldset>

<!-- Form Name -->
<center>
<img src="adminphoto\plus.png" width="30" height="30" class="d-inline-block align-top" alt="">

</center>
<h1 style="color:#ffffff;"><center>PRODUCTS</center></h1>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="id" style="color:#ffffff;">PRODUCT ID</label>  
  <div class="col-md-4">
  <input id="id" name="id" placeholder="PRODUCT ID" class="form-control input-md" required="" type="text">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="name" style="color:#ffffff;">PRODUCT NAME</label>  
  <div class="col-md-4">
  <input id="name" name="name" placeholder="PRODUCT NAME" class="form-control input-md" required="" type="text">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="category" style="color:#ffffff;">PRODUCT CATEGORY</label>  
  <div class="col-md-4">
  <input id="name" name="category" placeholder="PRODUCT CATEGORY" class="form-control input-md" required="" type="text">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="price" style="color:#ffffff;">PRODUCT PRICE</label>  
  <div class="col-md-4">
  <input id="name" name="price" placeholder="PRODUCT PRICE" class="form-control input-md" required="" type="text">
    
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
    <textarea class="form-control" id="description" name="description"></textarea>
  </div>
</div>

<!-- File Button --> 
<div class="form-group">
  <label class="col-md-4 control-label" for="filebutton" style="color:#ffffff;">Product Image</label>
  <div class="col-md-4">
    <input id="filebutton" name="filebutton" class="input-file" type="file">
  </div>
</div>


<!-- Button -->
<div class="form-group">
  <label class="col-md-4 control-label" for="singlebutton"></label>
  <div class="col-md-4">
    <button id="singlebutton" name="singlebutton" class="btn btn-primary" style="color:#ffffff;">Submit</button>
  </div>
  </div>

</fieldset>
</div>
</form>


