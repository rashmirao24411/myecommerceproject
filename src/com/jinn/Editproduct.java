package com.jinn;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.sql.rowset.serial.SerialBlob;



import Connection_db.ConnectionProvider;


@WebServlet("/Editproduct")
@MultipartConfig
public class Editproduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		InputStream inputStream = null;
		
		response.setContentType("text/html");
		  String id=request.getParameter("id");
		  String name=request.getParameter("name");
		  String category=request.getParameter("category");
		  String price=request.getParameter("price");
		  String active=request.getParameter("active");
		  String description=request.getParameter("description");
		  Part filePart = request.getPart("photo");
		 	
			if(filePart!=null)
			{
				System.out.println(filePart.getName());
				
				inputStream=filePart.getInputStream();
				
			}
		try{
			
		
           int i=0;
			Connection con=ConnectionProvider.getCon();
				
			 PreparedStatement ps=con.prepareStatement("update dress set name=?,category=?,price=?,active=?,description=?,photo=?  where id='"+id+"'");
	 	    
	 		  ps.setString(1,name);
	 		  ps.setString(2,category);
	 		  ps.setString(3,price);
	 		 ps.setString(4,active);
	 		 ps.setString(5,description);
	 		ps.setBlob(6, inputStream);
	 		  i=ps.executeUpdate();
	 	  if(i>0)
	 	  {
	 		 response.sendRedirect("EditProduct.jsp?msg=done");
	 	  }
			
	 		
	

			
			
		
		}
		catch(Exception e)
		{
			System.out.println(e);
			 response.sendRedirect("EditProduct.jsp?msg=wrong");
		}
		
	}

}