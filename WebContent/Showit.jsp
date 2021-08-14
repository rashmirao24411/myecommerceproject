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
<body>
<h1>My Collection</h1>
<table border="0px" cellspacing="3px" cellpadding="1opx">








<%
Connection connection;
PreparedStatement ps;
ResultSet st;

try{
	Class.forName("com.mysql.jdbc.Driver");
	connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/vastracollection", "root", "");
	
	ps=connection.prepareStatement("select * from dress ");
	int cnt=0;
	st=ps.executeQuery();
	while(st.next()){
		String i,n,c,p,a,d;
		Blob v;
		i=st.getString("id").trim();
		n=st.getString("name").trim();
		c=st.getString("category").trim();
		p=st.getString("price").trim();
		a=st.getString("active").trim();
		d=st.getString("Description").trim();
		v=st.getBlob("photo");
		cnt++;
		if(cnt==3){
			out.print("</tr><tr>");
			cnt=0;
			
		}
		%>
		<td> <div class="row" >
<div class="col-sm-3">
  <div class="card ">
  
    <div class="card-body">
    <img src="data:image/jpg;base64,${base64Image}" <%=st.getString(7) %>width="240" height="300"/>
  <h5 class="card-title"><i class="lni lni-rupee"></i><%=st.getString(4) %></h5>
      <p class="card-text"><%=st.getString(2) %></p>

<button class="btn btn-primary" type="submit"><a href="">Add Cart </a></button>
<button class="btn btn-primary" type="submit"><a href="">Buy Now </a></button>

    </div>
  </div>
</div>

</div>
		
		
		</td>
		<%
	}
}
catch(Exception e){
	out.println(e);
}
%>
</table>
</body>
</html>