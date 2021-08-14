package com.jinn;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import Connection_db.ConnectionProvider;


@WebServlet("/DeleteProduct")
public class DeleteProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		  String id=request.getParameter("id");
		
		 
		try{
			
			Connection con=ConnectionProvider.getCon();
			Statement st=con.createStatement();
			st.executeUpdate("DELETE FROM dress WHERE id='"+id+"'");		
		   
		   response.sendRedirect("EditProduct.jsp?msg=done");
		   
		}
		catch(Exception e)
		{
			System.out.println(e);
			 response.sendRedirect("EditProduct.jsp?msg=wrong");
		}
				
		
	}

}

