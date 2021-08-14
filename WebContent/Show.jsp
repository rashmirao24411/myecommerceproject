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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
.card{
width:270px;
margin:20px;
}

.card-img-top{
padding:5px;
 height:200px;
 width:200px;
}

</style>
</head>
<body>
<%




		Connection connection;
		PreparedStatement ps;
		ResultSet st;

		String imgLen="";
		
		try
		{  
			Class.forName("com.mysql.jdbc.Driver");
			connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/vastracollection", "root", "");
			
			ps=connection.prepareStatement("select * from dress ");
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
<div class="row" >
<div class="col-sm-3">
  <div class="card ">
  
    <div class="card-body">
    <img src="data:image/jpg;base64,${base64Image}" width="240" height="300"/>
  <h5 class="card-title"><i class="lni lni-rupee"></i><%=st.getString(4) %></h5>
      <p class="card-text"><%=st.getString(2) %></p>

<button class="btn btn-primary" type="submit"><a href="">Add Cart </a></button>
<button class="btn btn-primary" type="submit"><a href="">Buy Now </a></button>

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

</body>
</html>